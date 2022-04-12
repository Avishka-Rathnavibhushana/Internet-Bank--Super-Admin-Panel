import 'package:flutter/material.dart';
import 'package:superadminpanel/constants/Colors.dart';

import 'app_drawer.dart';

/// A responsive scaffold for our application.
/// Displays the navigation drawer alongside the [Scaffold] if the screen/window size is large enough
class AppScaffold extends StatelessWidget {
  const AppScaffold({required this.body, required this.pageTitle, Key? key})
      : super(key: key);

  final Widget body;

  final List<String> pageTitle;

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width < 900;
    return Row(
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
                        Icon(
                          Icons.home,
                          size: 12,
                        ),
                        ...pageTitle.map((title) {
                          return Wrap(
                            //mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 12,
                              ),
                              Text(
                                title,
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                    Text(pageTitle.last),
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
              body: body),
        )
      ],
    );
  }
}
