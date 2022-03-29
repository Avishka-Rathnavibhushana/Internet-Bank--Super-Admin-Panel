import 'package:superadminpanel/widgets/customButton.dart';
import 'package:superadminpanel/widgets/customText.dart';
import 'package:flutter/material.dart';

class CreditCardCard extends StatefulWidget {
  CreditCardCard({Key? key}) : super(key: key);

  @override
  State<CreditCardCard> createState() => _CreditCardCardState();
}

class _CreditCardCardState extends State<CreditCardCard> {
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
              text: "Credit Cards",
              fontSize: 18,
              fontWeight: FontWeight.bold),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CustomText(
                  color: Colors.black54, text: "Card Number", fontSize: 15),
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
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CustomButton(
                  buttonName: "Fund Transfer",
                  function: () {},
                  buttonColor: Colors.blueAccent),
              SizedBox(
                width: 10,
              ),
              CustomButton(
                  buttonName: "Bill Payments",
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
