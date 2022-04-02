import 'package:flutter/material.dart';
import 'package:superadminpanel/constants/PageTitles.dart';
import 'package:superadminpanel/constants/RouteNames.dart';
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
  
  final ExpandableController adminUserManagementExpandableController =
      ExpandableController(initialExpanded: false);

  final ExpandableController settingExpandableController =
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
    if (_selectedRoute == RouteNames.manageAdminUsers ||
        _selectedRoute == RouteNames.adminUserUpdate ||
        _selectedRoute == RouteNames.manageBankingUsers ||
        _selectedRoute == RouteNames.createAdminUser ||
        _selectedRoute == RouteNames.adminUserApprovalQueue ||
        _selectedRoute == RouteNames.adminUserApproval) {
      adminUserManagementExpandableController.expanded = true;
    } else if (_selectedRoute == RouteNames.changePassword ||
        _selectedRoute == RouteNames.bankSetting) {
      settingExpandableController.expanded = true;
    }
    return Drawer(
      child: Row(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const UserAccountsDrawerHeader(
                  accountName: Text('SUPER ADMIN PANEL'),
                  accountEmail: null,
                  currentAccountPicture: CircleAvatar(
                    child: Icon(Icons.admin_panel_settings),
                  ),
                ),
                ExpandablePanel(
                  controller: adminUserManagementExpandableController,
                  header: Container(
                    height: 50,
                    child: Row(
                      children: [
                        const Text(PageTitles.adminUserManagementUpperCase),
                      ],
                    ),
                  ),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        title: const Text(PageTitles.manageAdminUsers),
                        onTap: () async {
                          await _navigateTo(
                              context, RouteNames.manageAdminUsers);
                          adminUserManagementExpandableController.expanded =
                              true;
                        },
                        selected: _selectedRoute == RouteNames.manageAdminUsers,
                      ),
                      ListTile(
                        title: const Text(PageTitles.adminUserUpdate),
                        onTap: () async {
                          await _navigateTo(
                              context, RouteNames.adminUserUpdate);
                          adminUserManagementExpandableController.expanded =
                              true;
                        },
                        selected: _selectedRoute == RouteNames.adminUserUpdate,
                      ),
                      ListTile(
                        title: const Text(PageTitles.manageBankingUsers),
                        onTap: () async {
                          await _navigateTo(
                              context, RouteNames.manageBankingUsers);
                          adminUserManagementExpandableController.expanded =
                              true;
                        },
                        selected: _selectedRoute == RouteNames.manageBankingUsers,
                      ),
                      ListTile(
                        title: const Text(PageTitles.createAdminUser),
                        onTap: () async {
                          await _navigateTo(
                              context, RouteNames.createAdminUser);
                          adminUserManagementExpandableController.expanded =
                              true;
                        },
                        selected: _selectedRoute == RouteNames.createAdminUser,
                      ),
                      ListTile(
                        title: const Text(PageTitles.adminUserApprovalQueue),
                        onTap: () async {
                          await _navigateTo(
                              context, RouteNames.adminUserApprovalQueue);
                          adminUserManagementExpandableController.expanded =
                              true;
                        },
                        selected: _selectedRoute == RouteNames.adminUserApprovalQueue,
                      ),
                      ListTile(
                        title: const Text(PageTitles.adminUserApproval),
                        onTap: () async {
                          await _navigateTo(
                              context, RouteNames.adminUserApproval);
                          adminUserManagementExpandableController.expanded =
                              true;
                        },
                        selected: _selectedRoute == RouteNames.adminUserApproval,
                      ),
                      
                    ],
                  ),
                  collapsed: Container(),
                ),
                const Divider(),
                ExpandablePanel(
                  controller: settingExpandableController,
                  header: Container(
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(child: const Text(PageTitles.settingUpperCase)),
                      ],
                    ),
                  ),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        title: const Text(PageTitles.changePassword),
                        onTap: () async {
                          await _navigateTo(context, RouteNames.changePassword);
                          settingExpandableController.expanded = true;
                        },
                        selected: _selectedRoute == RouteNames.changePassword,
                      ),
                      ListTile(
                        title: const Text(PageTitles.bankSetting),
                        onTap: () async {
                          await _navigateTo(context, RouteNames.bankSetting);
                          settingExpandableController.expanded = true;
                        },
                        selected: _selectedRoute == RouteNames.bankSetting,
                      ),
                    ],
                  ),
                  collapsed: Container(),
                ),
                const Divider(),
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
