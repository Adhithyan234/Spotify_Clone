import 'package:flutter/material.dart';
import 'package:spotify/Bottomnavigation.dart';
import 'package:spotify/Home/Widgets/HeaderActios.dart';
import 'package:spotify/Home/Widgets/JumpIn.dart';
import 'package:spotify/Home/Widgets/Playlists.dart';
import 'package:spotify/Home/Widgets/RecentlyPlayed.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(57, 90, 81, 1),
            Color.fromRGBO(46, 71, 65, 1),
            Color.fromRGBO(43, 64, 59, 1),
            Color.fromRGBO(18, 18, 18, 1),
          ], stops: [
            0.01,
            0.03,
            0.06,
            0.2
          ])),
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Good evening",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'LibreFranklin'),
                    ),
                  ),
                  HeaderActions(),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 210,
                child:const Playlists(),
              ),
              SizedBox(
                height: 10,
              ),
              RecentlyPlayed(),
              JumpIn(),

            ],
          ),
        ),
        bottomNavigationBar: BottomBar(0),
      ),
    );
  }
}
