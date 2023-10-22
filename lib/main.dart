import 'package:flutter/material.dart';
import 'package:sportstracker/Pages/new_page.dart';
import 'package:sportstracker/functions/select.dart';
import 'package:sportstracker/pages/search.dart';

import 'Pages/home.dart';
List<Widget> widgetsList=[Center(child: Text("Click on the + to add teams!",style: TextStyle(color: Colors.amber),))];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/new': (context) => NewPage(),
       // '/search': (context) => SearchTeam(),
      },
    );
  }
}


