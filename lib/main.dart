import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:developer';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Betreuer-App',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: LoginPage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var user = "teacher";

  var myname = "Maksym";
  var mysurname = "Olshanskyy";

  var betreuern = [
    {"Vorname": "Johannes", "Nachname": "Schmidt"},
    {"Vorname": "Jan", "Nachname": "Mueller"}
  ];

  void loginfunction(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
  }

  void changeuser() {
    if (user == "teacher") {
      user = "student";
    } else if (user == "student") {
      user = "teacher";
    }
    notifyListeners();
  }

  void changeuserto(String usertype) {
    user = usertype;
    notifyListeners();
  }

  void entryinthetable(table, object) {
    table.add(object);
  }

  void deletefromthetable(table, object) {
    table.removeWhere((element) {
      return mapEquals(element, object);
    });
  }

  void entrymyself() {
    if (betreuern.contains({"Vorname": "Maksym", "Nachname": "Olshanskyy"})) {
    } else {
      entryinthetable(betreuern, {"Vorname": myname, "Nachname": mysurname});
      notifyListeners();
    }
  }

  void deletemyself() {
    deletefromthetable(betreuern, {"Vorname": myname, "Nachname": mysurname});
    notifyListeners();
  }
}

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
                  appState.loginfunction(context);
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
                        appState.loginfunction(context);
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

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile page')),
      drawer: Drawer(
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
                  MaterialPageRoute(builder: (context) => BetreuerPage()),
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
      ),
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

class BetreuerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      appBar: AppBar(title: const Text('Betreuern')),
      drawer: Drawer(
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
                  MaterialPageRoute(builder: (context) => BetreuerPage()),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Table(
              border: TableBorder.all(),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: List.generate(appState.betreuern.length, (i) {
                var name = appState.betreuern[i]["Vorname"];
                var surname = appState.betreuern[i]["Nachname"];
                return TableRow(
                  children: <Widget>[
                    TableCell(child: Text("$name")),
                    TableCell(
                      child: Text("$surname"),
                    )
                  ],
                );
              }),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      appState.entrymyself();
                    },
                    child: Text("sich eintragen")),
                SizedBox(width: 20),
                ElevatedButton(
                    onPressed: () {
                      appState.deletemyself();
                    },
                    child: Text("sich löschen"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
