import 'package:superadminpanel/pages/AdminUserManagement/ManageAdminUsersPage/component/creditCardCard.dart';
import 'package:superadminpanel/pages/AdminUserManagement/ManageAdminUsersPage/component/fdCard.dart';
import 'package:superadminpanel/pages/AdminUserManagement/ManageAdminUsersPage/component/loanCard.dart';
import 'package:superadminpanel/pages/AdminUserManagement/ManageAdminUsersPage/component/savingAccountCard.dart';
import 'package:superadminpanel/pages/AdminUserManagement/ManageAdminUsersPage/component/transactionSummaryTile.dart';
import 'package:superadminpanel/widgets/app_scaffold.dart';
import 'package:superadminpanel/widgets/customText.dart';
import 'package:flutter/material.dart';

import '../../../constants/page_titles.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Widget> cardList = [
    SavingAccountCard(),
    FDCard(),
    CreditCardCard(),
    LoanCard(),
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AppScaffold(
        pageTitle: PageTitles.manageAdminUsers,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(20),
                        width: width * 0.25,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: "Welcome Username!",
                                color: Colors.black,
                                fontSize: 20),
                            CustomText(
                                text: "Last Login: 2021/01/01",
                                color: Color.fromARGB(255, 15, 15, 15),
                                fontSize: 15),
                          ],
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(10),
                      color: Colors.grey,
                      child: CustomText(
                          text: "NEWS", color: Colors.black, fontSize: 20),
                    )
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // height: 1000,
                    width: width * 0.5,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: cardList.length,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        return cardList[index];
                      },
                    ),
                  ),
                  // Column(
                  //   children: [],
                  // ),
                  Container(
                    width: width * 0.25,
                    child: Column(
                      children: [
                        Container(
                          width: width * 0.25,
                          padding: EdgeInsets.all(5),
                          color: Colors.blue,
                          child: CustomText(
                              text: "Transaction Summary", fontSize: 18),
                        ),
                        TransactionSummaryTile(
                            id: "1234545556",
                            amount: "23456.67",
                            date: "2021/01/01",
                            isAdd: true),
                        Divider(
                          color: Colors.black54,
                        ),
                        TransactionSummaryTile(
                            id: "1234545556",
                            amount: "2345667.00",
                            date: "2021/01/01",
                            isAdd: false)
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
