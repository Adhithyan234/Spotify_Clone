import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotify/Home/Homepage.dart';
import 'package:spotify/Login/Loginpage.dart';

class AuthStreamBuilder extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Loading state
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else {
          if (snapshot.hasData) {
            // User is signed in
            return HomePage();
          } else {
            // User is not signed in
            return LoginPage();
          }
        }
      },
    );
  }
}
