import 'package:betreuer_app/drawer.dart';
import 'package:betreuer_app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
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
                  "Maksym Olshanskyy",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 10),
                (() {
                  if (appState.user == "teacher") {
                    return Table(
                      border: TableBorder.all(),
                      columnWidths: const <int, TableColumnWidth>{
                        0: FlexColumnWidth(),
                        1: IntrinsicColumnWidth(),
                      },
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children:
                          List.generate(appState.arbeiten.length + 1, (i) {
                        if (i < appState.arbeiten.length) {
                          return TableRow(
                            children: <Widget>[
                              TableCell(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(appState.arbeiten[i]["Thema"]!),
                              )),
                              TableCell(
                                child: IconButton(
                                  icon: Icon(Icons.cancel),
                                  onPressed: () {
                                    appState.deletefromthetablewithindex(
                                        appState.arbeiten, i);
                                  },
                                ),
                              )
                            ],
                          );
                        } else {
                          final myController = TextEditingController();
                          return TableRow(children: <Widget>[
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  obscureText: false,
                                  decoration: null,
                                  controller: myController,
                                ),
                              ),
                            ),
                            TableCell(
                                child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                appState.entryinthetable(appState.arbeiten, {
                                  "Thema": myController.text,
                                  "Dozent": "Maksym Olshanskyy"
                                });
                              },
                            ))
                          ]);
                        }
                      }),
                    );
                  } else {
                    return Table(
                        border: TableBorder.all(),
                        columnWidths: const <int, TableColumnWidth>{
                          0: FlexColumnWidth(),
                        },
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: List.generate(appState.arbeiten.length, (i) {
                          return TableRow(
                            children: <Widget>[
                              TableCell(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(appState.arbeiten[i]["Thema"]!),
                              )),
                            ],
                          );
                        }));
                  }
                })(),
              ],
            ),
          )),
    );
  }
}
