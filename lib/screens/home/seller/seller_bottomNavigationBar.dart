import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SellerBottomNavigationBar extends StatefulWidget {
  SellerBottomNavigationBar({Key key}) : super(key: key);

  @override
  _SellerbottomNavigationBarState createState() => _SellerbottomNavigationBarState();
}

class _SellerbottomNavigationBarState extends State<SellerBottomNavigationBar> {
  
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(9.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0.0, 1.0),
            spreadRadius: 0.5,
            blurRadius: 2.0,
          )
        ]
      ),
      child: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            if (_currentIndex == 2) {
              Navigator.of(context).pushNamed('chatListPage');
            }
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            label: 'Inicio'
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.plusCircle),
            label: 'Publicar'
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidCommentDots),
            label: 'Chat'
          )
        ],
      ),
    );
  }
}