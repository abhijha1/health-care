import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:health_care/utils/const.dart';

class CountDownPage extends StatefulWidget {
  final String name;
  const CountDownPage({super.key, required this.name});

  @override
  State<CountDownPage> createState() => _CountDownPageState();
}

class _CountDownPageState extends State<CountDownPage> {
  @override
  Widget build(BuildContext context) {
    Constants().init(context);
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Constants.screenHeight! * 0.05,
          ),
          Text(
            "Calling ${widget.name} ...",
            style: TextStyle(
                fontSize: Constants.screenHeight! * 0.05, color: Colors.red),
          ),
          SizedBox(
            height: Constants.screenHeight! * 0.05,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: CircularCountDownTimer(
              isReverse: true,
              width: double.infinity,
              height: Constants.screenHeight! * 0.4,
              duration: 7,
              fillColor: Colors.red,
              strokeWidth: 20,
              ringColor: Constants.darkBlue,
              textStyle: TextStyle(fontSize: Constants.screenHeight! * 0.2),
            ),
          ),
          SizedBox(
            height: Constants.screenHeight! * 0.12,
          ),
          Center(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Image.asset(
                'assets/icons/cancel.jpg',
                width: Constants.screenWidth! * 0.2,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
