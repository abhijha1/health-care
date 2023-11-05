import 'package:health_care/screens/countdown.dart';
import 'package:health_care/utils/const.dart';
import 'package:health_care/widgets/custom_clipper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactScreen extends StatelessWidget {
  final String name;
  final String imagee;
  final String number;
  const ContactScreen(
      {super.key,
      required this.imagee,
      required this.name,
      required this.number});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    Constants().init(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.backgroundColor,
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: MyCustomClipper(clipType: ClipType.bottom),
              child: Container(
                color: Theme.of(context).colorScheme.secondary,
                height: Constants.headerHeight + statusBarHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Icon(
                            Icons.chevron_left_rounded,
                            size: 30,
                          ))),
                  SizedBox(
                    height: Constants.screenHeight! * 0.05,
                  ),
                  TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 250),
                      duration: Duration(seconds: 1),
                      builder: (content, size, widget) {
                        return Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: size,
                            height: size,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Constants.darkBlue,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 33, 37, 39)
                                          .withOpacity(0.1),
                                      blurRadius: size / 0.6,
                                      spreadRadius: size / 0.7)
                                ]),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(imagee),
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    height: Constants.screenHeight! * 0.02,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 218, 225, 228),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            name,
                            style: GoogleFonts.merriweather(
                                fontSize: 60, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: Constants.screenHeight! * 0.018,
                          ),
                          Text(
                            number,
                            style: GoogleFonts.lato(
                                fontSize: 40, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Constants.screenHeight! * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/icons/message.png"),
                            radius: 60),
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CountDownPage(
                                      name: name,
                                      number: number,
                                    ))),
                        child: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/icons/call.png"),
                            radius: 65),
                      ),
                    ],
                  ),

                  // Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: SizedBox(
                  //     width: double.infinity,
                  //     child: ElevatedButton(

                  //       onPressed: () {},
                  //       child: Text(
                  //         "Remove",
                  //         style: TextStyle(
                  //             color: Colors.black,
                  //             fontSize: 30,
                  //             fontWeight: FontWeight.w500),
                  //       ),
                  //       style: ElevatedButton.styleFrom(
                  //         backgroundColor: Colors.red,
                  //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
