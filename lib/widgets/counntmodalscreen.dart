import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:health_care/service/procupine_service.dart';

import 'package:health_care/utils/const.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CountDownPage extends StatelessWidget {
  const CountDownPage({super.key});
  // void urlcall() async
  // {
  // }

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
                        // Text(
                        //   "Calling Ruhi...",
                        //   style: TextStyle(
                        //     fontSize: Constants.screenHeight! * 0.05,
                        //     color: Colors.red,
                        //   ),
                        // ),
                        SizedBox(
                          height: Constants.screenHeight! * 0.05,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: CircularCountDownTimer(
                            onComplete: () {
                              // When countdown is complete, stop the service and navigate to the home screen
                              //urlcall();
            
                              PPService.b.value = 0;
                              //PPService.porcupineManager.stop();
                              launchUrlString("whatsapp://voice?phone=+918317072134");
                              Navigator.of(context).popAndPushNamed('/home');
                            },
                            isReverse: true,
                            width: Constants.screenWidth! * 0.7,
                            height: Constants.screenHeight! * 0.4,
                            duration: 7,
                            fillColor: Colors.red,
                            strokeWidth:15 ,
                            ringColor: Constants.lightAccent,
                            textStyle: TextStyle(
                              fontSize: Constants.screenHeight! * 0.2,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Constants.screenHeight! * 0.12,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                               // Cancel countdown when tapping on the cancel button
                                PPService.b.value = 0;
                                PPService.porcupineManager.stop();
                              Navigator.of(context).popAndPushNamed('/home');
                            },
                            child: Image.asset(
                              'assets/icons/cancel.jpg',
                              width: Constants.screenWidth! * 0.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
}
}

// class CountDownPage extends StatelessWidget {
//   const CountDownPage({Key? key}) : super(key: key);

//   @override
//  Widget build(BuildContext context) {
//     Constants().init(context);
  
//                 return SafeArea(
//                   child: Scaffold(
//                     body: Column(
//                       children: [
//                         SizedBox(
//                           height: Constants.screenHeight! * 0.05,
//                         ),
//                         // Text(
//                         //   "Calling Ruhi...",
//                         //   style: TextStyle(
//                         //     fontSize: Constants.screenHeight! * 0.05,
//                         //     color: Colors.red,
//                         //   ),
//                         // ),
//                         SizedBox(
//                           height: Constants.screenHeight! * 0.05,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(10),
//                           child: CircularCountDownTimer(
//                             isReverse: true,
//                             width: Constants.screenWidth! * 0.4,
//                             height: Constants.screenHeight! * 0.4,
//                             duration: 7,
//                             fillColor: Colors.red,
//                             strokeWidth: 20,
//                             ringColor: Constants.lightAccent,
//                             textStyle: TextStyle(
//                               fontSize: Constants.screenHeight! * 0.2,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: Constants.screenHeight! * 0.12,
//                         ),
//                         Center(
//                           child: GestureDetector(
//                             onTap: () {
//                                // Cancel countdown when tapping on the cancel button
//                                 PPService.b.value = 0;
//                                 PPService.porcupineManager.stop();
//                               Navigator.of(context).popAndPushNamed('/home');
//                             },
//                             child: Image.asset(
//                               'assets/icons/cancel.jpg',
//                               width: Constants.screenWidth! * 0.2,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//                 }
             
//               }

