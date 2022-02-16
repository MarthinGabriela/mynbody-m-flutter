// ignore_for_file: prefer_const_constructors, unused_import, dead_code
import 'package:flutter/material.dart';
import 'package:mynbodym/device_page.dart';
import 'package:mynbodym/home_page.dart';
import 'package:lottie/lottie.dart';
import 'package:mynbodym/test_page/result_page.dart';
import 'package:mynbodym/theme.dart';
import 'package:mynbodym/login_page.dart';

void main() => runApp(const MynBodyM());

class MynBodyM extends StatelessWidget {
  const MynBodyM({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login App",
      theme: ThemeData(
        // fontFamily: 'MicroExtend',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: (5)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        backgroundColor: grayBg,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Lottie.asset(
            'assets/effects/splash.json',
            controller: _controller,
            animate: true,
            fit: BoxFit.cover,
            onLoaded: (composition) {
              _controller
                ..duration = composition.duration
                ..forward().whenComplete(
                    () => Navigator.push(context, _createRoute()));
            },
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
