import 'package:flutter/material.dart';
import 'package:superadminpanel/constants/Colors.dart';
import 'package:superadminpanel/constants/PageTitles.dart';
import 'package:superadminpanel/constants/RouteNames.dart';
import 'package:superadminpanel/utils/Utils.dart';
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

  final ExpandableController roleExpandableController =
      ExpandableController(initialExpanded: false);
  final ExpandableController systemConfigurationExpandableController =
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
        _selectedRoute == RouteNames.bankSetting ||
        _selectedRoute == RouteNames.userGroupLimits ||
        _selectedRoute == RouteNames.createAccountType ||
        _selectedRoute == RouteNames.configureAccountType ||
        _selectedRoute == RouteNames.manageAccountType ||
        _selectedRoute == RouteNames.schedularNotifier) {
      settingExpandableController.expanded = true;
    }
    else if (_selectedRoute == RouteNames.manageRoles ||
        _selectedRoute == RouteNames.editRoles ||
        _selectedRoute == RouteNames.viewPrivileges ||
        _selectedRoute == RouteNames.createPrivileges) {
      roleExpandableController.expanded = true;
    } else if (_selectedRoute == RouteNames.globalSwitch ||
        _selectedRoute == RouteNames.smsConfiguration ||
        _selectedRoute == RouteNames.emailConfiguration ||
        _selectedRoute == RouteNames.payAnyoneConfiguration ||
        _selectedRoute == RouteNames.securityViewConfiguration ||
        _selectedRoute == RouteNames.commonConfiguration) {
      systemConfigurationExpandableController.expanded = true;
    }
    return Drawer(
      child: Row(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                  accountName: Text('SUPER ADMIN PANEL'),
                  accountEmail: null,
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: AppColors.primaryColorLight,
                    child: Icon(
                      Icons.admin_panel_settings,
                      color: AppColors.white,
                    ),
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
                          await Utils.navigateTo(
                              context, RouteNames.manageAdminUsers, widget.permanentlyDisplay);
                          adminUserManagementExpandableController.expanded =
                              true;
                        },
                        selected: _selectedRoute == RouteNames.manageAdminUsers,
                      ),
                      ListTile(
                        title: const Text(PageTitles.adminUserUpdate),
                        onTap: () async {
                          await Utils.navigateTo(
                              context, RouteNames.adminUserUpdate, widget.permanentlyDisplay);
                          adminUserManagementExpandableController.expanded =
                              true;
                        },
                        selected: _selectedRoute == RouteNames.adminUserUpdate,
                      ),
                      ListTile(
                        title: const Text(PageTitles.manageBankingUsers),
                        onTap: () async {
                          await Utils.navigateTo(
                              context, RouteNames.manageBankingUsers, widget.permanentlyDisplay);
                          adminUserManagementExpandableController.expanded =
                              true;
                        },
                        selected: _selectedRoute == RouteNames.manageBankingUsers,
                      ),
                      ListTile(
                        title: const Text(PageTitles.createAdminUser),
                        onTap: () async {
                          await Utils.navigateTo(
                              context, RouteNames.createAdminUser, widget.permanentlyDisplay);
                          adminUserManagementExpandableController.expanded =
                              true;
                        },
                        selected: _selectedRoute == RouteNames.createAdminUser,
                      ),
                      ListTile(
                        title: const Text(PageTitles.adminUserApprovalQueue),
                        onTap: () async {
                          await Utils.navigateTo(
                              context, RouteNames.adminUserApprovalQueue, widget.permanentlyDisplay);
                          adminUserManagementExpandableController.expanded =
                              true;
                        },
                        selected: _selectedRoute == RouteNames.adminUserApprovalQueue,
                      ),
                      ListTile(
                        title: const Text(PageTitles.adminUserApproval),
                        onTap: () async {
                          await Utils.navigateTo(
                              context, RouteNames.adminUserApproval, widget.permanentlyDisplay);
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
                          await Utils.navigateTo(context, RouteNames.changePassword, widget.permanentlyDisplay);
                          settingExpandableController.expanded = true;
                        },
                        selected: _selectedRoute == RouteNames.changePassword,
                      ),
                      ListTile(
                        title: const Text(PageTitles.bankSetting),
                        onTap: () async {
                          await Utils.navigateTo(context, RouteNames.bankSetting, widget.permanentlyDisplay);
                          settingExpandableController.expanded = true;
                        },
                        selected: _selectedRoute == RouteNames.bankSetting,
                      ),
                      ListTile(
                        title: const Text(PageTitles.userGroupLimits),
                        onTap: () async {
                          await Utils.navigateTo(
                              context, RouteNames.userGroupLimits, widget.permanentlyDisplay);
                          settingExpandableController.expanded = true;
                        },
                        selected: _selectedRoute == RouteNames.userGroupLimits,
                      ),
                      ListTile(
                        title: const Text(PageTitles.createAccountType),
                        onTap: () async {
                          await Utils.navigateTo(
                              context, RouteNames.createAccountType, widget.permanentlyDisplay);
                          settingExpandableController.expanded = true;
                        },
                        selected:
                            _selectedRoute == RouteNames.createAccountType,
                      ),
                      ListTile(
                        title: const Text(PageTitles.configureAccountType),
                        onTap: () async {
                          await Utils.navigateTo(
                              context, RouteNames.configureAccountType, widget.permanentlyDisplay);
                          settingExpandableController.expanded = true;
                        },
                        selected:
                            _selectedRoute == RouteNames.configureAccountType,
                      ),
                      ListTile(
                        title: const Text(PageTitles.manageAccountType),
                        onTap: () async {
                          await Utils.navigateTo(
                              context, RouteNames.manageAccountType, widget.permanentlyDisplay);
                          settingExpandableController.expanded = true;
                        },
                        selected:
                            _selectedRoute == RouteNames.manageAccountType,
                      ),
                      ListTile(
                        title: const Text(PageTitles.schedularNotifier),
                        onTap: () async {
                          await Utils.navigateTo(
                              context, RouteNames.schedularNotifier, widget.permanentlyDisplay);
                          settingExpandableController.expanded = true;
                        },
                        selected:
                            _selectedRoute == RouteNames.schedularNotifier,
                      ),
                    ],
                  ),
                  collapsed: Container(),
                ),
                const Divider(),
                ExpandablePanel(
                  controller: roleExpandableController,
                  header: Container(
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(child: const Text(PageTitles.roleUpperCase)),
                      ],
                    ),
                  ),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        title: const Text(PageTitles.manageRoles),
                        onTap: () async {
                          await Utils.navigateTo(
                              context,
                              RouteNames.manageRoles,
                              widget.permanentlyDisplay);
                          settingExpandableController.expanded = true;
                        },
                        selected: _selectedRoute == RouteNames.manageRoles,
                      ),
                      ListTile(
                        title: const Text(PageTitles.viewPrivileges),
                        onTap: () async {
                          await Utils.navigateTo(
                              context,
                              RouteNames.viewPrivileges,
                              widget.permanentlyDisplay);
                          settingExpandableController.expanded = true;
                        },
                        selected: _selectedRoute == RouteNames.viewPrivileges,
                      ),
                      ListTile(
                        title: const Text(PageTitles.createPrivileges),
                        onTap: () async {
                          await Utils.navigateTo(
                              context,
                              RouteNames.createPrivileges,
                              widget.permanentlyDisplay);
                          settingExpandableController.expanded = true;
                        },
                        selected: _selectedRoute == RouteNames.createPrivileges,
                      ),
                     
                    ],
                  ),
                  collapsed: Container(),
                ),
                const Divider(),
                ExpandablePanel(
                  controller: systemConfigurationExpandableController,
                  header: Container(
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                            child: const Text(
                                PageTitles.systemConfigurationUpperCase)),
                      ],
                    ),
                  ),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        title: const Text(PageTitles.globalSwitch),
                        onTap: () async {
                          await Utils.navigateTo(
                              context,
                              RouteNames.globalSwitch,
                              widget.permanentlyDisplay);
                          settingExpandableController.expanded = true;
                        },
                        selected: _selectedRoute == RouteNames.globalSwitch,
                      ),
                      ListTile(
                        title: const Text(PageTitles.smsConfiguration),
                        onTap: () async {
                          await Utils.navigateTo(
                              context,
                              RouteNames.smsConfiguration,
                              widget.permanentlyDisplay);
                          settingExpandableController.expanded = true;
                        },
                        selected: _selectedRoute == RouteNames.smsConfiguration,
                      ),
                      ListTile(
                        title: const Text(PageTitles.emailConfiguration),
                        onTap: () async {
                          await Utils.navigateTo(
                              context,
                              RouteNames.emailConfiguration,
                              widget.permanentlyDisplay);
                          settingExpandableController.expanded = true;
                        },
                        selected:
                            _selectedRoute == RouteNames.emailConfiguration,
                      ),
                      ListTile(
                        title: const Text(PageTitles.payAnyoneConfiguration),
                        onTap: () async {
                          await Utils.navigateTo(
                              context,
                              RouteNames.payAnyoneConfiguration,
                              widget.permanentlyDisplay);
                          settingExpandableController.expanded = true;
                        },
                        selected:
                            _selectedRoute == RouteNames.payAnyoneConfiguration,
                      ),
                      ListTile(
                        title: const Text(PageTitles.securityViewConfiguration),
                        onTap: () async {
                          await Utils.navigateTo(
                              context,
                              RouteNames.securityViewConfiguration,
                              widget.permanentlyDisplay);
                          settingExpandableController.expanded = true;
                        },
                        selected: _selectedRoute ==
                            RouteNames.securityViewConfiguration,
                      ),
                      ListTile(
                        title: const Text(PageTitles.commonConfiguration),
                        onTap: () async {
                          await Utils.navigateTo(
                              context,
                              RouteNames.commonConfiguration,
                              widget.permanentlyDisplay);
                          settingExpandableController.expanded = true;
                        },
                        selected:
                            _selectedRoute == RouteNames.commonConfiguration,
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

  void _updateSelectedRoute() {
    setState(() {
      _selectedRoute = ModalRoute.of(context)!.settings.name.toString();
    });
  }
}
