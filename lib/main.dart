import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  void loginfunction() {}

  void gotosingupfunction() {}
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
            height: 50,
            width: 120,
            child: ElevatedButton(
                onPressed: () {
                  appState.loginfunction();
                },
                child: Text("Einlogen")),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 20,
            child: Text("oder"),
          ),
          SizedBox(height: 5),
          TextButton(
              onPressed: () {
                appState.gotosingupfunction();
              },
              child: Text(
                "registrieren",
              )),
        ],
      ),
    ));
  }
}
