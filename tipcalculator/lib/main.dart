import 'package:flutter/material.dart';
import 'package:tipcalculator/UI/billspilter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple),
      title: 'tip calculator',
      home: BillSpliter(),
    );
  }
}
