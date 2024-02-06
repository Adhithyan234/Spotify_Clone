import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:spotify/Bottomnavigation.dart';
import 'package:spotify/Data.dart';
import 'package:spotify/Library/Widgets/header.dart';
import 'package:spotify/Library/Widgets/roundedcards.dart';
import 'package:spotify/Library/Widgets/tiles.dart';

class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      body: ListView(
        children: [
          Header(),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              RoundedCards(text: 'Playlists'),
              SizedBox(
                width: 10,
              ),
              RoundedCards(text: 'Playlists'),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.compare_arrows_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Recently Played',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'LibreFranklin',
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Icon(
                  Icons.add_box_outlined,
                  color: Colors.white,
                  size: 20,
                )
              ],
            ),
          ),
          ...Data().library.map((val) {
            return GFListTile(
              shadow: BoxShadow(
                color: Color.fromRGBO(18, 18, 18, 1),
              ),
              avatar: GFAvatar(
                backgroundImage: AssetImage(val['image'].toString()),
                radius: 30,
                shape: val['shape'] as dynamic,
              ),
              title: Text(
                val['name'].toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              subTitle: Text(
                val['subtitle'].toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(167, 167, 167, 1),
                  fontSize: 18,
                ),
              ),
            );
          }).toList(),
          Tiles(title: 'Add Artists', shape: GFAvatarShape.circle),
          Tiles(title: 'Add Podcasts and', shape: GFAvatarShape.square)
        ],
      ),
      bottomNavigationBar: BottomBar(2),
    );
  }
}
