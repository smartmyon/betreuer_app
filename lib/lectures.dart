import 'package:betreuer_app/drawer.dart';
import 'package:betreuer_app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LecturesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      appBar: AppBar(title: const Text('Betreuern')),
      drawer: createdrawer(context),
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
