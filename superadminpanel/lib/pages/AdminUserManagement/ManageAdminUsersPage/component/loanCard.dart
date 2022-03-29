import 'package:superadminpanel/widgets/customButton.dart';
import 'package:superadminpanel/widgets/customText.dart';
import 'package:flutter/material.dart';

class LoanCard extends StatefulWidget {
  LoanCard({Key? key}) : super(key: key);

  @override
  State<LoanCard> createState() => _LoanCardState();
}

class _LoanCardState extends State<LoanCard> {
  TextEditingController accountNumber = new TextEditingController();
  @override
  void initState() {
    super.initState();
    accountNumber.text = "aaaaaa";
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(20),
      width: width * 0.25,
      color: Color.fromARGB(213, 166, 167, 166),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              color: Colors.black,
              text: "Loans/Lease",
              fontSize: 18,
              fontWeight: FontWeight.bold),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CustomText(
                  color: Colors.black54, text: "Contract Number", fontSize: 15),
              SizedBox(
                width: 30,
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                width: 100,
                child: DropdownButton<String>(
                  value: 'Google',
                  icon: Icon(Icons.arrow_drop_down_rounded),
                  items: <String>['Google', 'Apple', 'Amazon', 'Tesla']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {},
                ),
              )
            ],
          ),
          Row(
            children: [
              CustomText(
                  color: Colors.black54, text: "Account Balance", fontSize: 15),
              SizedBox(
                width: 20,
              ),
              Container(
                  width: 100,
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: accountNumber,
                    enabled: false,
                    decoration: InputDecoration(hintText: "00220220101"),
                  ))
            ],
          ),
          Row(
            children: [
              CustomText(
                  color: Colors.black54, text: "Amount Payable", fontSize: 15),
              SizedBox(
                width: 20,
              ),
              Container(
                  width: 100,
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: accountNumber,
                    enabled: false,
                    decoration: InputDecoration(hintText: "LKR 0.00"),
                  ))
            ],
          ),
          Row(
            children: [
              CustomText(color: Colors.black54, text: "Due Date", fontSize: 15),
              SizedBox(
                width: 20,
              ),
              Container(
                  width: 100,
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: accountNumber,
                    enabled: false,
                    decoration: InputDecoration(hintText: "Due Date"),
                  ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CustomButton(
                  buttonName: "Pay Now",
                  function: () {},
                  buttonColor: Colors.blueAccent),
              SizedBox(
                width: 10,
              ),
              CustomButton(
                  buttonName: "More Info",
                  function: () {},
                  buttonColor: Colors.blueAccent),
            ],
          ),
        ],
      ),
    );
  }
}
