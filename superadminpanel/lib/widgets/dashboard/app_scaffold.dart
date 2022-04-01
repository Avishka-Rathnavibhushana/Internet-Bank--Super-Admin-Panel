import 'package:flutter/material.dart';

import 'app_drawer.dart';

/// A responsive scaffold for our application.
/// Displays the navigation drawer alongside the [Scaffold] if the screen/window size is large enough
class AppScaffold extends StatelessWidget {
  const AppScaffold({required this.body, required this.pageTitle, Key? key})
      : super(key: key);

  final Widget body;

  final String pageTitle;

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
                    Text(
                      pageTitle,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(pageTitle),
                  ],
                ),
                actions: [],
                backgroundColor: Colors.blue,

                elevation: 0,
                // title: Text(pageTitle),
              ),
              drawer: displayMobileLayout
                  ? const AppDrawer(
                      permanentlyDisplay: false,
                    )
                  : null,
              body: body
              ),
        )
      ],
    );
  }
}
