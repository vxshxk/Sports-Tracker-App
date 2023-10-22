import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportstracker/Pages/new_page.dart';
import 'package:sportstracker/bloc/sport_bloc.dart';
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
                //BlocProvider.of<SportBloc>(context).add(AddSport());
              }),
            )

          ],
        ),
        backgroundColor: Colors.black,
        body: BlocConsumer<SportBloc,SportState>(
          builder: (BuildContext context, state) {
            if (state is Loading) {
              return CircularProgressIndicator();
            } else if (state is AddedNew) {
              return ListView(
                children: widgetsList,
              );
            }else return Placeholder();

          }, listener: (BuildContext context, Object? state) {
          if (state is AddNew) {
            Navigator.of(context).pushNamed('/new');
          } else if(state is Error){
            widgetsList.add(Container(child: Text("${state.message}"),));
            BlocProvider.of<SportBloc>(context).emit(AddedNew());
          }
        },


        )

    );
  }
}
