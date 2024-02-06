import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends StatelessWidget {
  
  int _currentIndex;
  BottomBar(this._currentIndex);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(40, 40, 40, 1)
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
            Colors.transparent,
             Colors.transparent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
          )
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            if (value == 0) {
              Navigator.of(context).popAndPushNamed('/home');
            }
             if (value == 1) {
              Navigator.of(context).popAndPushNamed('/search');
            }
            
             if (value == 2) {
              Navigator.of(context).popAndPushNamed('/library');
            }

            if (value == 3) {
              Navigator.of(context).popAndPushNamed('/premium');
            }
          },
          selectedItemColor: Colors.white,
          unselectedItemColor:Color.fromRGBO(179, 179, 179, 1),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled,size: 30),
              label: 'Home'
              ),
               BottomNavigationBarItem(
              icon: Icon(Icons.saved_search_outlined,size: 30),
              label: 'Search'
              ),
               BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.gripLinesVertical,size: 30),
              label: 'Your Library'
              ),
               BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.spotify,size: 30),
              label: 'Premium'
              )
          ],
          ),
      )
      );
  }
}