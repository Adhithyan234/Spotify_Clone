import 'package:flutter/material.dart';
import 'package:spotify/Data.dart';
import 'package:spotify/audio.dart';

class Playlists extends StatelessWidget {
  const Playlists({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
        physics: ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 16 / 5.5,
        ),
        children: Data().playlist.map((val) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return AudioPlayerPro(
                      audioURL: val['audio'].toString(),
                      image: val['image'].toString(),
                      name: val['name'].toString());
                },
              ));
            },
            child: Card(
              color: Color.fromRGBO(49, 58, 55, 1),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(val['image'].toString()))),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        child: Text(
                      val['name'].toString(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))
                  ],
                ),
              ),
            ),
          );
        }).toList());
  }
}
