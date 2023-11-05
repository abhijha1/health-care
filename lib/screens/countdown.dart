import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:gesture_x_detector/gesture_x_detector.dart';

import 'package:health_care/utils/const.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CountDownPage extends StatefulWidget {
  final String name;
  final String number;
  const CountDownPage({super.key, required this.name, required this.number});

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
              onComplete: () async => await _callNumber(widget.number),
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
            child: XGestureDetector(
              onMoveEnd: (event) => Navigator.of(context).pop(),
              behavior: HitTestBehavior.deferToChild,
              // onTap: (event) => Navigator.of(context).pop(),
              // child: Image.asset(
              //   'assets/icons/cancel.jpg',
              //   width: Constants.screenWidth! * 0.2,
              // ),

              child: SizedBox(
                height: Constants.screenWidth! * 0.3,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: SwipeableButtonView(
                    onFinish: () {},
                    onWaitingProcess: () {},
                    activeColor: Colors.transparent,
                    buttonWidget: Image.asset(
                      'assets/icons/cancel.jpg',
                      width: Constants.screenHeight! * 0.08,
                    ),
                    buttonText: "Swipe Down",
                    indicatorColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

_callNumber(String num) async {
  final number = num; //set the number here
  await FlutterPhoneDirectCaller.callNumber(number);
}
