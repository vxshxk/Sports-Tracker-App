import 'package:flutter/material.dart';
import 'package:sportstracker/Pages/new_page.dart';
import 'package:sportstracker/functions/select.dart';
import 'package:sportstracker/widgets/data_tile.dart';
import 'package:sportstracker/main.dart';
import 'package:sportstracker/models/models.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          title: Text("Sports Tracker"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: (() {
                Navigator.of(context).pushNamed('/new');
              }),
            )

          ],
        ),
        backgroundColor: Colors.black,
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: widgetsList,
            )

        )

    );
  }
}
