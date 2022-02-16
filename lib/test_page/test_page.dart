// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mynbodym/misc/loading.dart';

class TestPage extends StatefulWidget {
  const TestPage(
      accountName, String name, String gender, String age, String height,
      {Key? key})
      : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Loading(),
      ),
    );
  }
}
