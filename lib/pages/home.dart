import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportstracker/Pages/new_page.dart';
import 'package:sportstracker/bloc/sport_bloc.dart';
import 'package:sportstracker/functions/select.dart';
import 'package:sportstracker/widgets/data_tile.dart';
import 'package:sportstracker/main.dart';
import 'package:sportstracker/models/models.dart';

class Home extends StatelessWidget {

  Home({super.key});
  String? url;
  String? team;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          title: Text("Sports Tracker"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.sports_soccer),
              onPressed: (() {
                url="football";
                BlocProvider.of<SportBloc>(context).sportfun(team, url, context);
              }),
            ),
            IconButton(
              icon: Icon(Icons.sports_basketball),
              onPressed: (() {
                url="basketball";
                BlocProvider.of<SportBloc>(context).sportfun(team, url, context);
              }),
            ),
            IconButton(
              icon: Icon(Icons.car_crash_outlined),
              onPressed: (() {
                url="formula-1";
                BlocProvider.of<SportBloc>(context).sportfun(team, url, context);
              }),
            )
          ],
        ),
        backgroundColor: Colors.black,
        body: Column(
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

              ],
            ),
            BlocConsumer<SportBloc,SportState>(
              builder: (BuildContext context, state) {
                if (state is AddedNew) {
                  return ListView(
                    children: widgetsList,
                  );
                }else return ListView(
                  children: widgetsList,
                );

              }, listener: (BuildContext context, Object? state) {
              if (state is AddNew) {
                Navigator.of(context).pushNamed('/new');
              } else if(state is Error){
                widgetsList.add(Container(child: Text("${state.message}"),));
                BlocProvider.of<SportBloc>(context).emit(AddedNew());
              }
            },


            ),
          ],
        )

      );
  }
}

