import 'package:betreuer_app/main.dart';
import 'package:betreuer_app/profil.dart';
import 'package:betreuer_app/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 20,
            child: Text("Dozent:in oder Student:in"),
          ),
          SizedBox(
            height: 40,
            child: Switch(
              value: appState.user == "student",
              activeColor: Colors.red,
              onChanged: (bool value) {
                appState.changeuser();
              },
            ),
          ),
          SizedBox(
            height: 40,
            width: 120,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                child: Text("Einlogen")),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 20,
            child: Text(
              "oder",
            ),
          ),
          SizedBox(
            height: 40,
            width: 120,
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                child: Text("Registrieren")),
          ),
        ],
      ),
    ));
  }
}
