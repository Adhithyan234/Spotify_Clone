import 'package:flutter/material.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/getwidget.dart';

class Tiles extends StatelessWidget {
  Tiles({Key? key, required this.title, required this.shape}) : super(key: key);
  String title;
  GFAvatarShape shape;

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      shadow: BoxShadow(
        color: Color.fromRGBO(18, 18, 18, 1),
      ),
      avatar: GFAvatar(
        radius: 30,
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.white54,
        ),
        backgroundColor: Colors.grey[900],
        shape: shape,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
