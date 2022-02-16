// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:mynbodym/test_page/connect_inbody.dart';
import 'package:mynbodym/test_page/test_page.dart';
import 'package:mynbodym/theme.dart';

class NewPatientFormPage extends StatelessWidget {
  var accountName;

  NewPatientFormPage(this.accountName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _name = TextEditingController();
    var _gender = TextEditingController();
    var _age = TextEditingController();
    var _height = TextEditingController();
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
            'Pasien Baru',
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
                padding: EdgeInsets.all(10.0),
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
                    Wrap(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: lightRed,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 8.0, top: 8.0, left: 8.0, bottom: 8.0),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                          ),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 40,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, left: 8.0),
                            child: Form(
                              child: TextField(
                                controller: _name,
                                obscureText: false,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  //errorText: _validate ? "Username" : null,
                                  border: InputBorder.none,
                                  hintText: "Nama",
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Wrap(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: lightRed,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 8.0, top: 8.0, left: 8.0, bottom: 8.0),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                          ),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 40,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, left: 8.0),
                            child: Form(
                              child: TextField(
                                controller: _gender,
                                obscureText: false,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  //errorText: _validate ? "Username" : null,
                                  border: InputBorder.none,
                                  hintText: "Gender",
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Wrap(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: lightRed,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 8.0, top: 8.0, left: 8.0, bottom: 8.0),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                          ),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 40,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, left: 8.0),
                            child: Form(
                              child: TextField(
                                controller: _age,
                                obscureText: false,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  //errorText: _validate ? "Username" : null,
                                  border: InputBorder.none,
                                  hintText: "Umur",
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Wrap(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: lightRed,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 8.0, top: 8.0, left: 8.0, bottom: 8.0),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                          ),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 40,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, left: 8.0),
                            child: Form(
                              child: TextField(
                                controller: _height,
                                obscureText: false,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  //errorText: _validate ? "Username" : null,
                                  border: InputBorder.none,
                                  hintText: "Tinggi badan",
                                  fillColor: Colors.white,
                                  filled: true,
                                ),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 150,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: lightRed,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ConnectInBody(
                                      accountName,
                                      _name.text,
                                      _gender.text,
                                      _age.text,
                                      _height.text,
                                      key: Key("Patient"),
                                    )));
                          },
                          child: Text(
                            "Mulai InBody Test",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ])));
  }
}
