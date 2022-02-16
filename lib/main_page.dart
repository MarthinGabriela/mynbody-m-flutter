// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mynbodym/patient_page.dart';
import 'package:mynbodym/theme.dart';

class MainPage extends StatelessWidget {
  var userName;
  var password;

  MainPage(this.userName, this.password, {required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grayBg,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: redMyn),
              child: Image.asset(
                "assets/images/LogoLandscape.png",
              ),
            ),
            ListTile(
              title: const Text("Test InBody"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Lihat Hasil Test"),
              onTap: () {},
            )
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: redMyn,
        title: Text(
          'Beranda',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: grayBg,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomRight,
              heightFactor: 0.5,
              widthFactor: 0.5,
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(200.0)),
                color: const Color.fromRGBO(255, 255, 255, 0.4),
                child: SizedBox(
                  width: 400,
                  height: 400,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/LogoLandscape.png",
                      ),
                      //Lottie.asset("assets/effects/test (2).json"),
                      Center(
                          child: Text('Selamat Datang, Admin!',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: redMyn,
                                  fontSize: 18))),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 300,
                              width:
                                  MediaQuery.of(context).size.width * 0.5 - 20,
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => PatientPage(
                                                  userName,
                                                  key: Key("Patient"),
                                                )));
                                  },
                                  child: Image.asset("assets/images/tes.png"))),
                          SizedBox(
                              height: 300,
                              width:
                                  MediaQuery.of(context).size.width * 0.5 - 20,
                              child: GestureDetector(
                                  child:
                                      Image.asset("assets/images/hasil.png")))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
