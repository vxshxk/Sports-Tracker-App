import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportstracker/bloc/sport_bloc.dart';

import '../main.dart';

class SearchTeam extends StatelessWidget{
  final String? url;
  SearchTeam({super.key, required this.url});


  String? team;

  @override
  Widget build(BuildContext context) {

    return BlocProvider.value(
      value: sport,
      child: Material(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: Container(
                      margin: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue[800]!,
                          width: 3.0,
                        ),
// borderRadius: BorderRadius.circular(25.0)
                      ),
                      child: TextField(
                        onChanged: (val) async {
                          team = val;
                        },
                        style: TextStyle(
                          color: Colors.amber,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0,
                              horizontal: 15.0),
                          hintText: 'Enter Team Name',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Builder(
                        builder: (context) {
                          return IconButton(
                            color: Colors.blue[800]!,
                            iconSize: 30.0,
                            onPressed: () async {
                              await BlocProvider.of<SportBloc>(context).sport(team,url,context);
                            },
                            icon: Icon(Icons.search),
                          );
                        }
                    ),
                  ),
                  SizedBox(
                    width: 25.0,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


