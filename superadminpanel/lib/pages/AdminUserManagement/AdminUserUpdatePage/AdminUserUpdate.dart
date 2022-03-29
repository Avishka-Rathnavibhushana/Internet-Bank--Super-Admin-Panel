import 'package:superadminpanel/widgets/dashboard/app_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../constants/PageTitles.dart';

class AdminUserUpdate extends StatefulWidget {
  AdminUserUpdate({Key? key}) : super(key: key);

  @override
  State<AdminUserUpdate> createState() => _AdminUserUpdateState();
}

class _AdminUserUpdateState extends State<AdminUserUpdate> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AppScaffold(
      pageTitle: PageTitles.adminUserUpdate,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      color: Colors.white,
                      child: Text("Form"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      color: Colors.white,
                      child: Text("Table"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
