import 'package:health_care/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final String name;

  final String image;
  const ContactCard({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    Constants().init(context);
    return Container(
      margin: EdgeInsets.only(right: 20),
      height: Constants.screenHeight! * 0.1,
      width: Constants.screenWidth! * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: Constants.screenWidth! * 0.04),
                ),
              ],
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              child: GestureDetector(
                  onTap: () {},
                  child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(Icons.call_rounded))),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}
