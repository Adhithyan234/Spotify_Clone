import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.deepOrange,
            child: Text(
              'S',
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
         
          Padding(
            padding: const EdgeInsets.only(right: 100),
            child: Text(
              'Your Library',
              style: TextStyle(
                  fontFamily: 'LibreFranklin',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Row(

            children: [
              Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              )
            ],
          )
        ],
      ),
    );
  }
}
