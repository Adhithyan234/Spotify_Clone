import 'package:flutter/material.dart';
import 'package:spotify/Data.dart';
import 'package:spotify/Search/Widgets/tiles.dart';

class TopGenre extends StatelessWidget {
  const TopGenre({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          'Your top genres',
          style: TextStyle(
              fontFamily: 'LibreFranklin',
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Tiles(
          something: Data().genres,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Browse ALL',
          style: TextStyle(
              fontFamily: 'LibreFranklin',
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        SizedBox(height: 10,),
        Tiles(something: Data().browseall)
      ],
    );
  }
}
