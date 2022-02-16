// ignore_for_file: prefer_const_constructors, unused_import, dead_code, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:mynbodym/home_page.dart';
import 'package:lottie/lottie.dart';
import 'package:mynbodym/theme.dart';
import 'package:mynbodym/pair_page.dart';
import 'package:mynbodym/connect_page.dart';

class DevicePage extends StatefulWidget {
  var userName;
  var password;

  DevicePage(this.userName, this.password, {required Key key})
      : super(key: key);

  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: grayBg,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: redMyn,
          leading: BackButton(color: grayBg),
          title: Text(
            'MynBody App',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width / 22.5),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomRight,
              heightFactor: 0.5,
              widthFactor: 0.5,
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(200.0)),
                color: const Color.fromRGBO(255, 255, 255, 0.4),
                child: SizedBox(
                  width: 350,
                  height: 350,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(
                    left: 0.1 * MediaQuery.of(context).size.width,
                    top: 0,
                    right: 0.1 * MediaQuery.of(context).size.width,
                    bottom: 20),
                child: SizedBox(
                  // height: MediaQuery.of(context).size.height * 0.1,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        //Lottie.asset("assets/effects/test (2).json"),
                        Text('Pilih Perangkat InBodymu:',
                            style: TextStyle(
                                fontFamily: 'MicroExtend',
                                fontWeight: FontWeight.normal,
                                color: redMyn,
                                fontSize: 28)),
                        SizedBox(
                          height: 0.075 * MediaQuery.of(context).size.height,
                        ),
                        Container(
                          child: Material(
                            color: grayBg,
                            child: Wrap(
                              runAlignment: WrapAlignment.start,
                              children: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => ConnectPage(
                                                  widget.userName,
                                                  widget.password,
                                                  "270",
                                                  key: null,
                                                )));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    primary: redMyn,
                                    // minimumSize: Size(
                                    //     0.1 * MediaQuery.of(context).size.width,
                                    //     100)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 0.05 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width +
                                            5,
                                      ),
                                      Image.asset(
                                          'assets/images/products/270S.png'),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'InBody 270',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.06,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 150,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => ConnectPage(
                                                widget.userName,
                                                widget.password,
                                                "570")));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      primary: redMyn,
                                      minimumSize: Size(
                                          0.6 *
                                              MediaQuery.of(context).size.width,
                                          100)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 0.05 *
                                            MediaQuery.of(context).size.width,
                                      ),
                                      Image.asset(
                                          'assets/images/products/570S.png'),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'InBody 570',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.06,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 150,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => ConnectPage(
                                                widget.userName,
                                                widget.password,
                                                "770")));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      primary: redMyn,
                                      minimumSize: Size(
                                          0.6 *
                                              MediaQuery.of(context).size.width,
                                          100)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 0.05 *
                                            MediaQuery.of(context).size.width,
                                      ),
                                      Image.asset(
                                        'assets/images/products/770S.png',
                                        height: 100,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'InBody 770',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.06,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }
}
