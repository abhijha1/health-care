import 'dart:typed_data';

import 'package:health_care/backend/getimage.dart';
import 'package:health_care/screens/contactscreen.dart';
import 'package:health_care/utils/contacts.dart';
import 'package:health_care/widgets/contact_circle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/const.dart';
import '../widgets/card_items.dart';
import '../widgets/card_main.dart';
import '../widgets/card_section.dart';
import '../widgets/custom_clipper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Uint8List _image;
  bool isImage = false;
  @override
  void initState() {
    super.initState();
  }

  void setImage(ImageSource source) async {
    Uint8List finalimage = await getImage(source);

    setState(() {
      _image = finalimage;
      isImage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
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
          Positioned(
            right: -45,
            top: -30,
            child: ClipOval(
              child: Container(
                color: Colors.black.withOpacity(0.05),
                height: 220,
                width: 220,
              ),
            ),
          ),

          // BODY
          Padding(
            padding: EdgeInsets.all(Constants.paddingSide),
            child: ListView(
              children: <Widget>[
                // Header - Greetings and Avatar
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Good Morning,\nPatient",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                    ),
                    Stack(
                      children: [
                        isImage
                            ? CircleAvatar(
                                radius: 40.0,
                                backgroundImage: MemoryImage(_image),
                              )
                            : const CircleAvatar(
                                radius: 40.0,
                                backgroundImage: AssetImage(
                                    'assets/icons/profile_picture.png')),
                        Positioned(
                            bottom: 6,
                            child: GestureDetector(
                              onTap: () => setImage(ImageSource.gallery),
                              child: Icon(
                                Icons.draw_outlined,
                                size: 30,
                                weight: 20,
                                color: Colors.black,
                              ),
                            ))
                      ],
                    )
                  ],
                ),

                SizedBox(height: 50),

                // Main Cards - Heartbeat and Blood Pressure
                Container(
                  height: 140,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      CardMain(
                        image: AssetImage('assets/icons/heartbeat.png'),
                        title: "Hearbeat",
                        value: "66",
                        unit: "bpm",
                        color: Constants.lightGreen,
                      ),
                      CardMain(
                          image: AssetImage('assets/icons/blooddrop.png'),
                          title: "Blood Pressure",
                          value: "66/123",
                          unit: "mmHg",
                          color: Constants.lightYellow)
                    ],
                  ),
                ),

                // Section Cards - Daily Medication
                SizedBox(height: 50),

                Row(
                  children: [
                    Text(
                      "YOUR DAILY MEDICATIONS",
                      style: TextStyle(
                        color: Constants.textPrimary,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("add button");
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),

                SizedBox(height: 20),

                Container(
                    height: 125,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        CardSection(
                          image: AssetImage('assets/icons/capsule.png'),
                          title: "Metforminv",
                          value: "2",
                          unit: "pills",
                          time: "6-7AM",
                          isDone: false,
                        ),
                        CardSection(
                          image: AssetImage('assets/icons/syringe.png'),
                          title: "Trulicity",
                          value: "1",
                          unit: "shot",
                          time: "8-9AM",
                          isDone: true,
                        )
                      ],
                    )),

                SizedBox(height: 50),

                Row(
                  children: [
                    Text(
                      "YOUR FAVOURITE CONTACT",
                      style: TextStyle(
                          color: Constants.textPrimary,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("add button");
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: contact.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ContactScreen(
                                        imagee: contact[index]['image']!,
                                        name: contact[index]['name']!,
                                        number: contact[index]['number']!,
                                      ))),
                          child: ContactCard(
                              image: contact[index]['image']!,
                              name: contact[index]['name']!));
                    },
                  ),
                ),
                SizedBox(height: 50),

                // Scheduled Activities

                Row(
                  children: [
                    Text(
                      "SCHEDULED ACTIVITIES",
                      style: TextStyle(
                          color: Constants.textPrimary,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("add button");
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),

                SizedBox(height: 20),

                Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      CardItems(
                        image: Image.asset(
                          'assets/icons/Walking.png',
                        ),
                        title: "Walking",
                        value: "750",
                        unit: "steps",
                        color: Constants.lightYellow,
                        progress: 30,
                      ),
                      CardItems(
                        image: Image.asset(
                          'assets/icons/Swimming.png',
                        ),
                        title: "Swimming",
                        value: "30",
                        unit: "mins",
                        color: Constants.lightBlue,
                        progress: 0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
