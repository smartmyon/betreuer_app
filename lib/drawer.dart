import 'package:betreuer_app/lectures.dart';
import 'package:betreuer_app/profil.dart';
import 'package:flutter/material.dart';

Widget createdrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        SizedBox(
          height: 88,
          child: DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text(
              'Menü',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Profil'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.pages),
          title: Text('Betreuer'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LecturesPage()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Ausloggen'),
          onTap: () {
            while (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
      ],
    ),
  );
}
