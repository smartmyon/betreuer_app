import 'package:betreuer_app/login.dart';
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

  var arbeiten = [
    {
      "Thema": "Analyse der Sicherheit von Cloud Computing",
      "Dozent": "Maksym Olshanskyy"
    },
    {
      "Thema":
          "Technologieauswahl und Projektplanung zur Absatzsteigerung eines Online-Shops Fallstudie Data Analytics und Big Data",
      "Dozent": "Maksym Olshanskyy"
    },
    {
      "Thema": "Programmentwurf. Spielprogramm Käsekästchen",
      "Dozent": "Maksym Olshanskyy"
    }
  ];

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
    notifyListeners();
  }

  void deletefromthetable(table, object) {
    table.removeWhere((element) {
      return mapEquals(element, object);
    });
    notifyListeners();
  }

  void deletefromthetablewithindex(table, int index) {
    table.removeAt(index);
    notifyListeners();
  }

  void entrymyself() {
    if (betreuern.contains({"Vorname": "Maksym", "Nachname": "Olshanskyy"})) {
    } else {
      entryinthetable(betreuern, {"Vorname": myname, "Nachname": mysurname});
    }
  }

  void deletemyself() {
    deletefromthetable(betreuern, {"Vorname": myname, "Nachname": mysurname});
  }
}
