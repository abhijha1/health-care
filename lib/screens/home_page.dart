
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../util/const.dart';
import '../util/custom_clipper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Uint8List _image;
  bool isImage = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Hello world')
      // CustomScrollView(
      //   slivers: <Widget>[
      //     SliverAppBar(
      //       expandedHeight: 200, // Adjust this value as needed
      //       floating: false,
      //       pinned: true,
      //       flexibleSpace: FlexibleSpaceBar(
      //         background: ClipPath(
      //           clipper: MyCustomClipper(clipType: ClipType.bottom),
      //           child: Container(
      //             color: Theme.of(context).colorScheme.secondary,
      //           ),
      //         ),
      //       ),
      //     ),
      //     SliverToBoxAdapter(
      //       child: Padding(
      //         padding: EdgeInsets.all(Constants.paddingSide),
      //         child: ListView(
      //           children: <Widget>[
                  
      //               Container(
      //                 height: 200,
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(20),
      //                   // image: DecorationImage(
      //                   //  image: AssetImage("assets/images/doctor.png"),
      //                   //   fit: BoxFit.cover,
      //                   // ),
      //                 ),
      //               ),
      //               Container(
      //                 height: 200,
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(20),
      //                   // image: DecorationImage(
      //                   //   image: AssetImage("assets/images/doctor.png"),
      //                   //   fit: BoxFit.cover,
      //                   // ),
      //                 ),
      //               ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}