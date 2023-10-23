import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sportstracker/models/models.dart';
import 'package:sportstracker/widgets/data_tile.dart';

import '../Pages/home.dart';
import '../main.dart';
import 'package:bloc/bloc.dart';


part 'sport_event.dart';
part 'sport_state.dart';
List<Widget> widgetsList=[Center(child: Text("Click on the + to add teams!",style: TextStyle(color: Colors.amber),))];
class SportBloc extends Bloc<SportEvent, SportState> {
  SportBloc() : super(SportInitial()) {
    on<AddSport>((event, emit) {
      emit(AddNew());
    });
    on<AddedSport>((event, emit) {
      emit(AddedNew());
    });
  }

  Future<void> sportfun(String? team,String? url2, BuildContext context) async {
    final apiKey = '63e1534efc4b7aa08dd3b6f9a38d71a0'; // Replace with your actual API key
    emit(Loading());
    // Check for null values in team and url2
    try{
      if(url2=='basketball'){
        final url = Uri.parse(
            "https://v1.basketball.api-sports.io/teams?search=$team"); // Use the 'team' parameter passed to the function
        final headers = {
          'x-rapidapi-host': 'v1.basketball.api-sports.io',
          'x-rapidapi-key': apiKey, // Include your API key here
        };
        final response = await http.get(url, headers: headers);
        final result = jsonDecode(response.body)["response"][0];
        final model = TeamModel(
            name: result["name"], id: result["id"].toString(), sport: url2);
        widgetsList.add(DataTile(model: model));
        Navigator.of(context).popUntil((route) => false);
        BlocProvider.of<SportBloc>(context).add(AddedSport());
        Navigator.of(context).pushNamed("/");
      }else if(url2=='football'){
        final url = Uri.parse(
            "https://v3.football.api-sports.io/teams?search=$team"); // Use the 'team' parameter passed to the function
        final headers = {
          'x-rapidapi-host': 'v3.football.api-sports.io',
          'x-rapidapi-key': apiKey, // Include your API key here
        };
        final response = await http.get(url, headers: headers);
        final result = jsonDecode(response.body)["response"][0];
        final model = TeamModel(
            name: result["name"], id: result["id"].toString(), sport: url2);
        widgetsList.add(DataTile(model: model));
        Navigator.of(context).popUntil((route) => false);
        BlocProvider.of<SportBloc>(context).add(AddedSport());
        Navigator.of(context).pushNamed("/");
      }else if(url2=='formula-1'){
        final url = Uri.parse(
            "https://v1.formula-1.api-sports.io/teams?search=$team"); // Use the 'team' parameter passed to the function
        final headers = {
          'x-rapidapi-host': 'v1.formula-1.api-sports.io',
          'x-rapidapi-key': apiKey, // Include your API key here
        };
        final response = await http.get(url, headers: headers);
        final result = jsonDecode(response.body)["response"][0];
        final model = TeamModel(
            name: result["name"], id: result["id"].toString(), sport: url2);
        widgetsList.add(DataTile(model: model));
        Navigator.of(context).popUntil((route) => false);
        BlocProvider.of<SportBloc>(context).add(AddedSport());
        Navigator.of(context).pushNamed("/");
      }else {
        Navigator.of(context).popUntil((route) => false);
        emit(Error(message: 'Team or URL is null. Cannot make the request.'));
        Navigator.of(context).pushNamed("/");
      }
    }catch(e){
      emit(Error(message: e.toString()));
      Navigator.of(context).popUntil((route) => false);
      Navigator.of(context).pushNamed("/");
    }
  }

}






