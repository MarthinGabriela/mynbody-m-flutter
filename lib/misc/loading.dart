// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mynbodym/theme.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation_rotation;
  late Animation<double> animation_radius_in;
  late Animation<double> animation_radius_out;

  final double initialRadius = 50;

  double radius = 0.0;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));

    animation_rotation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 1.0, curve: Curves.linear)));

    animation_radius_in = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            curve: Interval(0.75, 1.0, curve: Curves.elasticIn),
            parent: controller));
    animation_radius_out = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            curve: Interval(0.0, 0.25, curve: Curves.elasticOut),
            parent: controller));

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0) {
          radius = animation_radius_in.value * initialRadius;
        } else if (controller.value >= 0.0 && controller.value <= 0.25) {
          radius = animation_radius_out.value * initialRadius;
        }
      });
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100.0,
          height: 100.0,
          child: Center(
            child: RotationTransition(
              turns: animation_rotation,
              child: Stack(
                children: [
                  Dot(radius: 15.0, color: Colors.white),
                  Transform.translate(
                      offset:
                          Offset(radius * cos(pi / 4), radius * sin(pi / 4)),
                      child: Dot(radius: 10.0, color: redMyn)),
                  Transform.translate(
                      offset: Offset(
                          radius * cos(2 * pi / 4), radius * sin(2 * pi / 4)),
                      child: Dot(radius: 15.0, color: lightRed)),
                  Transform.translate(
                      offset: Offset(
                          radius * cos(3 * pi / 4), radius * sin(3 * pi / 4)),
                      child: Dot(radius: 10.0, color: redMyn)),
                  Transform.translate(
                      offset: Offset(
                          radius * cos(4 * pi / 4), radius * sin(4 * pi / 4)),
                      child: Dot(radius: 15.0, color: lightRed)),
                  Transform.translate(
                      offset: Offset(
                          radius * cos(5 * pi / 4), radius * sin(5 * pi / 4)),
                      child: Dot(radius: 10.0, color: redMyn)),
                  Transform.translate(
                      offset: Offset(
                          radius * cos(6 * pi / 4), radius * sin(6 * pi / 4)),
                      child: Dot(radius: 15.0, color: lightRed)),
                  Transform.translate(
                      offset: Offset(
                          radius * cos(7 * pi / 4), radius * sin(7 * pi / 4)),
                      child: Dot(radius: 10.0, color: redMyn)),
                  Transform.translate(
                      offset: Offset(
                          radius * cos(8 * pi / 4), radius * sin(8 * pi / 4)),
                      child: Dot(radius: 15.0, color: lightRed)),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 35),
        Center(
            child: Padding(
          padding: const EdgeInsets.only(right: 25.0, left: 25.0),
          child: Text('Mohon Menunggu Tes Hingga Selesai',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w300, color: redMyn, fontSize: 24)),
        )),
      ],
    );
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  Dot({required this.radius, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.radius,
      height: this.radius,
      decoration: BoxDecoration(color: this.color, shape: BoxShape.circle),
    );
  }
}
