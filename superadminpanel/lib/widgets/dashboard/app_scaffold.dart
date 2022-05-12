import 'package:flutter/material.dart';
import 'package:superadminpanel/constants/Colors.dart';
import 'package:superadminpanel/constants/RouteNames.dart';
import 'package:superadminpanel/constants/userData.dart';

import 'app_drawer.dart';

/// A responsive scaffold for our application.
/// Displays the navigation drawer alongside the [Scaffold] if the screen/window size is large enough
class AppScaffold extends StatefulWidget {
  final Widget body;

  final List<String> pageTitle;
  const AppScaffold({required this.body, required this.pageTitle, Key? key})
      : super(key: key);

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  checkLogin() async {
    setState(() {
      loading = true;
    });
    if (bearer == "") {
      await Future.delayed(const Duration(seconds: 2));
      await Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.login, ModalRoute.withName('/login'));
    }

    setState(() {
      loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width < 900;
    return loading
        ? const Center(child: CircularProgressIndicator())
        : Row(
      children: [
        if (!displayMobileLayout)
          const AppDrawer(
            permanentlyDisplay: true,
          ),
        Expanded(
          child: Scaffold(
              appBar: AppBar(
                // when the app isn't displaying the mobile version of app, hide the menu button that is used to open the navigation drawer
                automaticallyImplyLeading: displayMobileLayout,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                              const Icon(
                          Icons.home,
                          size: 12,
                        ),
                              ...widget.pageTitle.map((title) {
                          return Wrap(
                            //mainAxisSize: MainAxisSize.min,
                            children: [
                                    const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 12,
                              ),
                              Text(
                                title,
                                      style: const TextStyle(fontSize: 10),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                          Text(widget.pageTitle.last),
                  ],
                ),
                actions: [],
                backgroundColor: AppColors.primaryColor,

                elevation: 0,
                // title: Text(pageTitle),
              ),
              drawer: displayMobileLayout
                  ? const AppDrawer(
                      permanentlyDisplay: false,
                    )
                  : null,
                    body: widget.body),
        )
      ],
    );
  }
}
