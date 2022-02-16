import 'package:flutter/material.dart';
import 'package:mynbodym/device_page.dart';
import 'package:mynbodym/theme.dart';

class PairPage extends StatefulWidget {
  var userName;
  var password;
  var device;

  PairPage(this.userName, this.password, this.device, {Key? key})
      : super(key: key);

  @override
  _PairPageState createState() => _PairPageState();
}

class _PairPageState extends State<PairPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
