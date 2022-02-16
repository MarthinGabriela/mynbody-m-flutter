// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mynbodym/device_page.dart';
import 'package:mynbodym/main_page.dart';
import 'package:mynbodym/theme.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  //StateFullWidget

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var _text = TextEditingController();
    var _password = TextEditingController();

    return Scaffold(
      //Scaffold
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
            Center(
              child: SizedBox(
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/LogoLandscape.png",
                    ),
                    //Lottie.asset("assets/effects/test (2).json"),
                    Center(
                        child: Text('Login',
                            style: TextStyle(
                                fontFamily: 'MicroExtend',
                                fontWeight: FontWeight.bold,
                                color: redMyn,
                                fontSize: 24))),
                    Container(
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: redMyn,
                        child: Wrap(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  8.0, 16.0, 8.0, 8.0),
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
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
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Form(
                                  child: TextField(
                                    controller: _text,
                                    obscureText: false,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                      //errorText: _validate ? "Username" : null,
                                      border: InputBorder.none,
                                      hintText: "Username",
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
                      ),
                    ),
                    Container(
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: const Color(0xFF840C24),
                        child: Wrap(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  8.0, 16.0, 8.0, 8.0),
                              child: Icon(
                                Icons.lock,
                                color: Colors.white,
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
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Form(
                                  child: TextField(
                                    controller: _password,
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                      //errorText: _validate ? "Username" : null,
                                      border: InputBorder.none,
                                      hintText: "Password",
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
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        //Raised Button
                        onPressed: () {
                          print("Login Berhasil");

                          Navigator.push(
                              context,
                              PageTransition(
                                  child: MainPage(
                                    _text.text,
                                    _password.text,
                                    key: Key("Login Key"),
                                  ),
                                  type: PageTransitionType.rightToLeft)
                              // MaterialPageRoute(
                              //     builder: (context) => MainPage(
                              //           _text.text,
                              //           _password.text,
                              //           key: Key("test"),
                              );
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: redMyn,
                            onPrimary: Colors.white,
                            textStyle: TextStyle(color: Colors.white),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
