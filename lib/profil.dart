import 'package:betreuer_app/drawer.dart';
import 'package:betreuer_app/lectures.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile page')),
      drawer: createdrawer(context),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: 250,
                  height: 250,
                  child: Image.asset('assets/images/profileavatar.png'),
                ),
                Text(
                  "Name Surname",
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          )),
    );
  }
}
