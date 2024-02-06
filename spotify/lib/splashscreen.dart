import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotify/Home/Homepage.dart';
import 'package:spotify/Login/Loginpage.dart';
import 'package:spotify/Login/verification.dart';
import 'package:spotify/utils/Streambuilder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  // Stream stream1 = Stream();

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => AuthStreamBuilder(),
          ),
        );
    });
  }



  Widget build(BuildContext context) {
    // Timer(Duration(seconds: 4), () {
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Verification(),));
    // });
    return Column(
      children: [
        SizedBox(
          height: 350,
        ),
        SizedBox(
            height: 210,
            width: 210,
            child: Image.asset('assets/images/Spotify.png'))
      ],
    );
  }
}

// class Stream {
//   void streamauth(BuildContext context) {
//     final FirebaseAuth auth = FirebaseAuth.instance;
//     final user = auth.currentUser;

//     if (user != null) {
//       Timer(Duration(seconds: 2), () {
//         Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => HomePage(),
//             ));
//       });
//     } else {
//       Timer(Duration(seconds: 2), () {
//         Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => LoginPage(),
//             ));
//       });
//     }
//   }
// }
