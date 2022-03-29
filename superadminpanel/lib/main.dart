import 'package:flutter/material.dart';
import 'package:superadminpanel/pages/AdminUserManagement/AdminUserUpdatePage/AdminUserUpdate.dart';
import 'package:superadminpanel/pages/Settings/BankSettingPage/BankSettingPage.dart';
import 'package:superadminpanel/pages/Settings/ChangePasswordPage/ChangePasswordPage.dart';
import 'constants/RouteNames.dart';
import 'pages/AdminUserManagement/ManageAdminUsersPage/ManageAdminUsersPage.dart';
import 'widgets/dashboard/app_route_observer.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive app with navigation drawer',
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
        RouteNames.manageAdminUsers: (_) => MangeAdminUsersPage(),
        RouteNames.adminUserUpdate: (_) => AdminUserUpdate(),
        RouteNames.changePassword: (_) => ChangePasswordPage(),
        RouteNames.bankSetting: (_) => BankSettingPage(),
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