import 'package:flutter/material.dart';
import 'package:spotify/Bottomnavigation.dart';
import 'package:spotify/Search/Widgets/SearchWidget.dart';
import 'package:spotify/Search/Widgets/topgenres.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(18, 18, 18, 80),
        body: Container(
          child: ListView(
            children: [
              Text(
                "Search",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'LibreFranklin'),
              ),
              SearchWidget(),
              TopGenre()
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(1),
      ),
    );
  }
}
