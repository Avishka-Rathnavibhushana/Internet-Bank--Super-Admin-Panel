import 'package:flutter/material.dart';

import '../constants/page_titles.dart';
import '../constants/route_names.dart';
import 'app_route_observer.dart';
import 'package:expandable/expandable.dart';

/// The navigation drawer for the app.
/// This listens to changes in the route to update which page is currently been shown
class AppDrawer extends StatefulWidget {
  const AppDrawer({required this.permanentlyDisplay, Key? key})
      : super(key: key);

  final bool permanentlyDisplay;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with RouteAware {
  late String _selectedRoute;
  late AppRouteObserver _routeObserver;

  var settingOnPressed;
  final ExpandableController settingsController =
      ExpandableController(initialExpanded: false);

  @override
  void initState() {
    super.initState();
    _routeObserver = AppRouteObserver();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    _routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    _updateSelectedRoute();
  }

  @override
  void didPop() {
    _updateSelectedRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Row(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const UserAccountsDrawerHeader(
                  accountName: Text('Username'),
                  accountEmail: null,
                  currentAccountPicture: CircleAvatar(
                    child: Icon(Icons.android),
                  ),
                ),
                ListTile(
                  title: const Text(PageTitles.manageAdminUsers),
                  onTap: () async {
                    await _navigateTo(context, RouteNames.manageAdminUsers);
                  },
                  selected: _selectedRoute == RouteNames.manageAdminUsers,
                ),
                const Divider(),
                ListTile(
                  title: const Text(PageTitles.updateAdminUser),
                  onTap: () async {
                    await _navigateTo(context, RouteNames.update);
                  },
                  selected: _selectedRoute == RouteNames.update,
                ),
                const Divider(),
                ExpandablePanel(
                  controller: settingsController,
                  header: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17.0),
                    child: Row(
                      children: [
                        // SvgPicture.asset(
                        //   "assets/images/side-menu-icons/settings.svg",
                        //   height: 30,
                        // ),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: const Text("Topic"),
                        ),
                        // IconButton(
                        //   icon: SvgPicture.asset(
                        //     "assets/images/menu-dropdown-icon.svg",
                        //     height: 8,
                        //   ),
                        //   onPressed: settingOnPressed,
                        // )
                      ],
                    ),
                  ),
                  expanded: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 58.0, vertical: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          title: const Text(PageTitles.updateAdminUser),
                          onTap: () async {
                            await _navigateTo(context, RouteNames.update);
                          },
                          selected: _selectedRoute == RouteNames.update,
                        ),
                        ListTile(
                          title: const Text(PageTitles.updateAdminUser),
                          onTap: () async {
                            await _navigateTo(context, RouteNames.update);
                          },
                          selected: _selectedRoute == RouteNames.update,
                        ),
                        ListTile(
                          title: const Text(PageTitles.updateAdminUser),
                          onTap: () async {
                            await _navigateTo(context, RouteNames.update);
                          },
                          selected: _selectedRoute == RouteNames.update,
                        ),
                      ],
                    ),
                  ),
                  collapsed: Container(),
                ),
                const Divider(),
                ListTile(
                  title: const Text(PageTitles.updateAdminUser),
                  onTap: () async {
                    await _navigateTo(context, RouteNames.update);
                  },
                  selected: _selectedRoute == RouteNames.update,
                ),
              ],
            ),
          ),
          if (widget.permanentlyDisplay)
            const VerticalDivider(
              width: 1,
            )
        ],
      ),
    );
  }

  /// Closes the drawer if applicable (which is only when it's not been displayed permanently) and navigates to the specified route
  /// In a mobile layout, the a modal drawer is used so we need to explicitly close it when the user selects a page to display
  Future<void> _navigateTo(BuildContext context, String routeName) async {
    if (widget.permanentlyDisplay) {
      Navigator.pop(context);
    }
    await Navigator.pushNamed(context, routeName);
  }

  void _updateSelectedRoute() {
    setState(() {
      _selectedRoute = ModalRoute.of(context)!.settings.name.toString();
    });
  }
}
