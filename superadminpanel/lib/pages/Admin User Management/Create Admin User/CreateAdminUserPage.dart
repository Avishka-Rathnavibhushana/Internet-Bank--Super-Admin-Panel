import 'package:responsive_framework/responsive_framework.dart';
import 'package:superadminpanel/api/adminUserManagementAPIs.dart';
import 'package:superadminpanel/constants/colors.dart';
import 'package:superadminpanel/modals/AdminUser.dart';
import 'package:superadminpanel/widgets/dashboard/CustomPageView.dart';
import 'package:superadminpanel/widgets/MainForm/MainForm.dart';
import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class CreateAdminUserPage extends StatefulWidget {
  const CreateAdminUserPage({Key? key}) : super(key: key);

  @override
  State<CreateAdminUserPage> createState() => _CreateAdminUserPageState();
}

class _CreateAdminUserPageState extends State<CreateAdminUserPage> {
  //form 1 data
  TextEditingController firstNameTextEditingController =
      TextEditingController();
  bool firstNameValidation = false;
  String status = "MR";
  TextEditingController lastNameTextEditingController = TextEditingController();
  bool lastNameValidation = false;
  TextEditingController emailTextEditingController = TextEditingController();
  bool emailValidation = false;
  TextEditingController confirmEmailTextEditingController =
      TextEditingController();
  bool confirmEmailValidation = false;
  String confirmEmailValidationText = "";
  TextEditingController employeeIdTextEditingController =
      TextEditingController();
  bool employeeIdValidation = false;

  //form 2 data
  String passwordPolicy = "Admin";
  TextEditingController userIdTextEditingController = TextEditingController();
  bool userIdValidation = false;
  String userIdValidationText = "";
  TextEditingController passwordTextEditingController = TextEditingController();
  bool passwordValidation = false;
  TextEditingController reTypePasswordTextEditingController =
      TextEditingController();
  bool reTypePasswordValidation = false;
  String reTypePasswordValidationText = "";

  //form 3
  bool checkBox1 = false;
  bool checkBox2 = false;

  bool pageloading = false;

  void submit() async {
    setState(() {
      pageloading = true;
    });

    //form 1 data
    String fname = firstNameTextEditingController.text;
    String userStatus = status;
    String lname = lastNameTextEditingController.text;
    String email = emailTextEditingController.text;
    String confirmEmail = confirmEmailTextEditingController.text;
    String empId = employeeIdTextEditingController.text;

    //form 2 data
    String pwPolicy = passwordPolicy;
    String userId = userIdTextEditingController.text;
    String pw = passwordTextEditingController.text;
    String repw = reTypePasswordTextEditingController.text;

    if (fname == "" ||
        lname == "" ||
        email == "" ||
        confirmEmail == "" ||
        empId == "" ||
        userId == "" ||
        pw == "" ||
        repw == "") {
      if (fname == "") {
        setState(() {
          firstNameValidation = true;
        });
      } else {
        setState(() {
          firstNameValidation = false;
        });
      }
      if (lname == "") {
        setState(() {
          lastNameValidation = true;
        });
      } else {
        setState(() {
          lastNameValidation = false;
        });
      }
      if (email == "") {
        setState(() {
          emailValidation = true;
        });
        if (email != confirmEmail) {
          setState(() {
            confirmEmailValidationText = 'Email does not match.';
            confirmEmailValidation = true;
          });
        } else {
          confirmEmailValidation = false;
        }
      } else {
        setState(() {
          emailValidation = false;
        });
        if (email != confirmEmail) {
          setState(() {
            confirmEmailValidationText = 'Email does not match.';
            confirmEmailValidation = true;
          });
        } else {
          confirmEmailValidation = false;
        }
      }

      if (empId == "") {
        setState(() {
          employeeIdValidation = true;
        });
      } else {
        setState(() {
          employeeIdValidation = false;
        });
      }
      if (userId == "") {
        setState(() {
          userIdValidationText = 'Field cannot be empty.';
          userIdValidation = true;
        });
      } else {
        setState(() {
          userIdValidation = false;
        });
      }
      if (pw == "") {
        setState(() {
          passwordValidation = true;
        });
        if (pw != repw) {
          setState(() {
            reTypePasswordValidationText = 'Password does not match.';
            reTypePasswordValidation = true;
          });
          return;
        } else {
          reTypePasswordValidation = false;
        }
      } else {
        setState(() {
          passwordValidation = false;
        });
        if (pw != repw) {
          setState(() {
            reTypePasswordValidationText = 'Password does not match.';
            reTypePasswordValidation = true;
          });
          return;
        } else {
          reTypePasswordValidation = false;
        }
      }
      // if (repw == "") {
      //   setState(() {
      //     reTypePasswordValidationText = 'Field cannot be empty.';
      //     reTypePasswordValidation = true;
      //   });
      // } else {
      //   setState(() {
      //     reTypePasswordValidation = false;
      //   });
      // }
      debugPrint("Check required fields");
      setState(() {
        pageloading = false;
      });
    } else {
      if (email != confirmEmail) {
        setState(() {
          confirmEmailValidationText = 'Email does not match.';
          confirmEmailValidation = true;
        });
        if (pw != repw) {
          setState(() {
            reTypePasswordValidationText = 'Password does not match.';
            reTypePasswordValidation = true;
          });
          setState(() {
            pageloading = false;
          });
          return;
        }
        setState(() {
          pageloading = false;
        });
        return;
      }

      AdminUser adminUser = AdminUser(
        address: "",
        adminrole: "",
        contact: "",
        email: email,
        employeeid: empId,
        fname: fname,
        lname: lname,
        nicnumber: "",
        objectuuid: "",
        password: pw,
        passwordpolicy: passwordPolicy,
        status: status,
        userid: userId,
      );
      bool data = await AdminUserManagementAPIS.createAdmin(adminUser);
      setState(() {
        pageloading = false;
      });
      reset();
    }

    setState(() {
      pageloading = false;
    });
  }

  void reset() {
    setState(() {
      //form 1 data
      firstNameTextEditingController.text = "";
      status = "MR";
      lastNameTextEditingController.text = "";
      emailTextEditingController.text = "";
      confirmEmailTextEditingController.text = "";
      employeeIdTextEditingController.text = "";

      //form 2 data
      passwordPolicy = "Admin";
      userIdTextEditingController.text = "";
      passwordTextEditingController.text = "";
      reTypePasswordTextEditingController.text = "";
    });
    setState(() {
      firstNameValidation = false;
      lastNameValidation = false;
      emailValidation = false;
      confirmEmailValidation = false;
      employeeIdValidation = false;
      userIdValidation = false;
      passwordValidation = false;
      reTypePasswordValidation = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: const [
        PageTitles.adminUserManagement,
        PageTitles.createAdminUser
      ],
      body: pageloading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: CustomPageView(
            items: [
              ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Center(
                    child: MainForm(
                      buttons: [],
                      textFieldItems: [
                        [
                          "Status",
                          "DropDownTextField",
                          ["MR", "MRS", "MS"],
                          status,
                          true,
                          (value) {
                            setState(() {
                              status = value!;
                            });
                          },
                        ],
                        [
                          "First Name",
                          "TextField",
                          firstNameTextEditingController,
                          true,
                          true,
                                firstNameValidation
                        ],
                        [
                          "Last Name",
                          "TextField",
                          lastNameTextEditingController,
                          true,
                          true,
                                lastNameValidation
                        ],
                        [
                          "E-mail",
                          "TextField",
                          emailTextEditingController,
                          true,
                          true,
                                emailValidation
                        ],
                        [
                          "Confirm E-mail",
                          "TextField",
                          confirmEmailTextEditingController,
                          true,
                          true,
                                confirmEmailValidation,
                                false,
                                confirmEmailValidationText
                        ],
                        [
                          "Employee id",
                          "TextField",
                          employeeIdTextEditingController,
                          true,
                          true,
                                employeeIdValidation
                        ],
                      ],
                      topic: 'Personal Details',
                      topicBackgroundColor: Colors.blue[100],
                      topicTextColor: Colors.blue[150],
                    ),
                  )),
                    const ResponsiveRowColumnItem(
                child: SizedBox(
                  height: 20,
                ),
              ),
              ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Center(
                    child: MainForm(
                      buttons: [],
                      textFieldItems: [
                        [
                          "Password Policy",
                          "DropDownTextField",
                          ["Admin", "Customer"],
                          passwordPolicy,
                          true,
                          (value) {
                            setState(() {
                              passwordPolicy = value!;
                            });
                          },
                        ],
                        [
                          "User Id",
                          "TextField",
                          userIdTextEditingController,
                          true,
                          true,
                                userIdValidation,
                                false,
                                userIdValidationText
                        ],
                        [
                          "Password",
                          "TextField",
                          passwordTextEditingController,
                          true,
                          true,
                                passwordValidation,
                                true,
                        ],
                        [
                          "Retype Password",
                          "TextField",
                          reTypePasswordTextEditingController,
                          true,
                          true,
                                reTypePasswordValidation,
                                true,
                                reTypePasswordValidationText
                        ],
                              // [
                              //   "",
                              //   "Custom",
                              //   Text(
                              //     "Note: User Id/Password minimum length 8..*",
                              //     style: TextStyle(
                              //       color: AppColors.primaryColor,
                              //     ),
                              //   ),
                              // ],
                      ],
                      topic: 'User Name and Password',
                      topicBackgroundColor: Colors.blue[100],
                      topicTextColor: Colors.blue[150],
                    ),
                  )),
                    const ResponsiveRowColumnItem(
                child: SizedBox(
                  height: 20,
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: MainForm(
                    isHeaderAvailable: true,
                    buttons: [
                      [
                        "Submit",
                              submit,
                        AppColors.buttonLightGreenColor,
                        AppColors.white,
                      ],
                      [
                        "Reset",
                        () {},
                        Colors.grey[700],
                        AppColors.white,
                      ]
                    ],
                    textFieldItems: [
                      [
                        "",
                        "Table",
                        [
                          [
                            ["Label", "Role", false, true],
                            ["Label", "Description", false, true],
                            ["Label", "", false, true],
                          ],
                          [
                                  [
                                    "CheckBox",
                                    checkBox1,
                                    (value) {
                                      setState(() {
                                        checkBox1 = value;
                                      });
                                    }
                                  ],
                            ["Label", "24x7CallCenter", false, false],
                            ["Label", "Call Center", false, false],
                          ],
                          [
                                  [
                                    "CheckBox",
                                    checkBox2,
                                    (value) {
                                      setState(() {
                                        checkBox2 = value;
                                      });
                                    }
                                  ],
                            ["Label", "24x7CallCenter", false, false],
                            ["Label", "Call Center", false, false],
                          ],
                        ],
                      ],
                    ],
                    topic: 'Role',
                    topicBackgroundColor: Colors.blue[100],
                    topicTextColor: Colors.blue[150],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
