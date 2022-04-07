import 'package:flutter/material.dart';
import 'package:superadminpanel/pages/AdminUserManagement/AdminUserApproval/AdminUserApprovalPage.dart';
import 'package:superadminpanel/pages/AdminUserManagement/AdminUserUpdatePage/AdminUserUpdate.dart';
import 'package:superadminpanel/pages/AdminUserManagement/CreateAdminUser/CreateAdminUserPage.dart';
import 'package:superadminpanel/pages/AdminUserManagement/ManageBankingUsers/ManageBankingUsersPage.dart';
import 'package:superadminpanel/pages/AdminUserManagement/adminUserApprovalQueue/adminUserApprovalQueuePage.dart';
import 'package:superadminpanel/pages/Settings/Bank%20Setting/BankSettingPage.dart';
import 'package:superadminpanel/pages/Settings/Change%20Password/ChangePasswordPage.dart';
import 'package:superadminpanel/pages/Settings/Configure%20Account%20Type/ConfigureAccountTypePage.dart';
import 'package:superadminpanel/pages/Settings/Create%20Account%20Type/CreateAccountTypePage.dart';
import 'package:superadminpanel/pages/Settings/Manage%20Account%20Type/ManageAccountTypePage.dart';
import 'package:superadminpanel/pages/Settings/Schedular%20Notifier/SchedularNotifierPage.dart';
import 'package:superadminpanel/pages/Settings/User%20Group%20Limits/CreateUserGroupLimitsPage.dart';
import 'package:superadminpanel/pages/Settings/User%20Group%20Limits/UserGroupLimitsPage.dart';
import 'constants/RouteNames.dart';
import 'pages/AdminUserManagement/ManageAdminUsersPage/ManageAdminUsersPage.dart';
import 'widgets/dashboard/app_route_observer.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super Admin Dashboard',
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: [
          const ResponsiveBreakpoint.resize(350, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(600, name: TABLET),
          const ResponsiveBreakpoint.resize(800, name: 'DESKTOPMINI'),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
        ],
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        pageTransitionsTheme: PageTransitionsTheme(
          // makes all platforms that can run Flutter apps display routes without any animation
          builders: Map<TargetPlatform,
                  _InanimatePageTransitionsBuilder>.fromIterable(
              TargetPlatform.values.toList(),
              key: (dynamic k) => k,
              value: (dynamic _) => const _InanimatePageTransitionsBuilder()),
        ),
      ),
      initialRoute: RouteNames.manageAdminUsers,
      navigatorObservers: [AppRouteObserver()],
      routes: {
        //Admin user management
        RouteNames.manageAdminUsers: (_) => MangeAdminUsersPage(),
        RouteNames.adminUserUpdate: (_) => AdminUserUpdate(),
        RouteNames.manageBankingUsers: (_) => ManageBankingUsersPage(),
        RouteNames.createAdminUser: (_) => CreateAdminUserPage(),
        RouteNames.adminUserApprovalQueue: (_) => AdminUserApprovalQueuePage(),
        RouteNames.adminUserApproval: (_) => AdminUserApprovalPage(),
        //Setting
        RouteNames.changePassword: (_) => ChangePasswordPage(),
        RouteNames.bankSetting: (_) => BankSettingPage(),
        RouteNames.userGroupLimits: (_) => UserGroupLimitsPage(),
        RouteNames.createUserGroupLimits: (_) => CreateUserGroupLimitsPage(),
        RouteNames.createAccountType: (_) => CreateAccountTypePage(),
        RouteNames.configureAccountType: (_) => ConfigureAccountTypePage(),
        RouteNames.manageAccountType: (_) => ManageAccountTypePage(),
        RouteNames.schedularNotifier: (_) => SchedularNotifierPage(),
      },
    );
  }
}

/// This class is used to build page transitions that don't have any animation
class _InanimatePageTransitionsBuilder extends PageTransitionsBuilder {
  const _InanimatePageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return child;
  }
}
