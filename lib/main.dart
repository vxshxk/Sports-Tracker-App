import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportstracker/Pages/new_page.dart';
import 'package:sportstracker/bloc/sport_bloc.dart';
import 'package:sportstracker/functions/select.dart';
import 'package:sportstracker/pages/search.dart';
import 'package:bloc/bloc.dart';

import 'Pages/home.dart';
List<Widget> widgetsList=[Center(child: Text("Click on the + to add teams!",style: TextStyle(color: Colors.amber),))];
final SportBloc sport =SportBloc();
void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Colors.black,
        initialRoute: '/',
        routes: {
          '/': (context) => BlocProvider.value(
                   value: sport,
                   child: Home(),
                    ) ,

          '/new': (context) => BlocProvider.value(
            value: sport,
            child: NewPage(),
          ) ,

         // '/search': (context) => SearchTeam(),
        },
      );
  }
}


