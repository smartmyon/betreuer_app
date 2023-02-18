import 'package:betreuer_app/main.dart';
import 'package:betreuer_app/profil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Vorname',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nachname',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        value: "teacher",
                        groupValue: appState.user,
                        onChanged: (value) {
                          appState.changeuserto("teacher");
                        },
                      ),
                      Text('Dozent:in'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        value: "student",
                        groupValue: appState.user,
                        onChanged: (value) {
                          appState.changeuserto("student");
                        },
                      ),
                      Text('Student:in'),
                    ],
                  )
                ],
              ),
              TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Passwort',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: 120,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()),
                        );
                      },
                      child: Text("Registriern"))),
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
                width: 160,
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Zurück zur Loginseite",
                      textAlign: TextAlign.center,
                    )),
              ),
            ])));
  }
}
