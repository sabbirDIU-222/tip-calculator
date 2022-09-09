// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tipcalculator/util/haxcolor.dart';

class BillSpliter extends StatefulWidget {
  @override
  State<BillSpliter> createState() => _BillSpliterState();
}

class _BillSpliterState extends State<BillSpliter> {
  // set the variable
  int tippercentage = 0;
  int personCount = 1;
  double totalbill = 0.0;

  final Color _purple = HaxColor('#6908D6');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
      alignment: Alignment.center,
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20.0),
        children: [
          //SECTION 1
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: _purple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Per person',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.normal,
                      color: _purple,
                    ),
                  ),
                  Text(
                    '\$ ${calculateTotalBill(tippercentage, totalbill, personCount)}',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: _purple,
                    ),
                  )
                ],
              ),
            ),
          ),

          // SECTION 2

          Container(
            margin: const EdgeInsets.only(top: 21.4),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey.shade100,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(15.0)),
            child: Column(
              children: [
                TextField(
                  // ignore: prefer_const_constructors
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  style: TextStyle(color: _purple),
                  decoration: InputDecoration(
                      prefixText: 'total bill',
                      prefixIcon: Icon(Icons.attach_money_outlined)),
                  onChanged: (value) {
                    try {
                      totalbill = double.parse(value);
                    } catch (exception) {
                      totalbill = 0.0;
                    }
                  },
                ),

                //SECTION 3

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Split',
                      style: TextStyle(
                          fontSize: 16.0, color: Colors.grey.shade700),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (personCount > 1) {
                                personCount--;
                              } else {
                                // nothing to do
                              }
                            });
                          },
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: _purple.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Center(
                              child: Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: _purple,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '$personCount',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _purple,
                            fontSize: 18.0,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              personCount++;
                            });
                          },
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: _purple.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Center(
                              child: Text(
                                '+',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: _purple,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                // SECTION 4

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tip',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 16.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        '\$ ${calculateTotalTip(totalbill, personCount, tippercentage).toStringAsFixed(2)}',
                        style: TextStyle(
                            color: _purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                    ),
                  ],
                ),

                // SECTION 5

                Column(
                  children: [
                    Text(
                      '$tippercentage%',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: _purple,
                          fontWeight: FontWeight.bold),
                    ),
                    Slider(
                        min: 0,
                        max: 100,
                        activeColor: _purple,
                        inactiveColor: Colors.grey,
                        divisions: 10,
                        value: tippercentage.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            tippercentage = newValue.round();
                          });
                        })
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  // this method will work for SECTION 1
  calculateTotalBill(int totalTip, double totalBill, int splitby) {
    var totalPerson =
        (calculateTotalTip(totalbill, tippercentage, splitby) + totalBill) /
            splitby;
    return totalPerson.toStringAsFixed(2);
  }

// this method will work for section 4
  calculateTotalTip(double totalbill, int tippercentage, int splitby) {
    double totalTip = 0.0;

    if (totalbill < 0 || totalbill.toString().isEmpty || totalbill == null) {
      // do nothing
    } else {
      totalTip = (totalbill * tippercentage) / 100;
    }

    return totalTip;
  }
}
