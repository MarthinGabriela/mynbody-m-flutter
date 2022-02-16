// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import 'package:mynbodym/test_page/new_patient_form_page.dart';
import 'package:mynbodym/theme.dart';

class PatientPage extends StatelessWidget {
  var accountName;

  PatientPage(userName, {this.accountName, Key? key}) : super(key: key);

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
            'Pasien',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: grayBg,
            child: Stack(children: <Widget>[
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Siapa yang akan menjalani InBody Test?",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: redMyn,
                            fontSize: 24)),
                    SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: lightRed,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Text("Pasien Lama",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white)),
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                                "Temukan data pasien yang sudah pernah melakukan InBody Test",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.white)),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                              Expanded(
                                flex: 1,
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: redMyn,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: GestureDetector(
                                            onTap: () {
                                              // Enter Old Patient
                                            },
                                            child: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 45,
                                              color: Colors.white,
                                            ),
                                          )),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: lightRed,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Text("Pasien Baru",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white)),
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                                "Daftarkan Pasien yang belum pernah melakukan InBody Test",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.white)),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                              Expanded(
                                flex: 1,
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: redMyn,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          NewPatientFormPage(
                                                            accountName,
                                                            key: Key("Patient"),
                                                          )));
                                            },
                                            child: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 45,
                                              color: Colors.white,
                                            ),
                                          )),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ])));
  }
}
