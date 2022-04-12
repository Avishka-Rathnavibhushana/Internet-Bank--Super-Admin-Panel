class RouteNames {
  // static const String root = '/';

  //Admin user management
  static const String manageAdminUsers = '/dashboard';
  static const String adminUserUpdate = '/updateAdminUser';
  static const String manageBankingUsers = '/manageBankingUsers';
  static const String createAdminUser = '/createAdminUser';
  static const String adminUserApprovalQueue = '/adminUserApprovalQueue';
  static const String adminUserApproval = '/adminUserApproval';

  //Setting
  static const String changePassword = '/changePassword';
  static const String bankSetting = '/bankSetting';
  static const String userGroupLimits = '/userGroupLimits';
  static const String createUserGroupLimits =
      '/userGroupLimits/createUserGroupLimits';
  static const String createAccountType = '/createAccountType';
  static const String configureAccountType = '/configureAccountType';
  static const String manageAccountType = '/manageAccountType';
  static const String schedularNotifier = '/schedularNotifier';

  //Role
  static const String manageRoles = 'manageRoles';
  static const String editRoles = 'manageRoles/editRoles';
  static const String viewPrivileges = 'viewPrivileges';
  static const String createPrivileges = 'createPrivileges';

   //System configuration
  static const String globalSwitch = '/globalSwitch';
  static const String smsConfiguration = '/smsConfiguration';
  static const String emailConfiguration = '/emailConfiguration';
  static const String payAnyoneConfiguration = '/payAnyoneConfiguration';
  static const String securityViewConfiguration = '/securityViewConfiguration';
  static const String commonConfiguration = '/commonConfiguration';
}
