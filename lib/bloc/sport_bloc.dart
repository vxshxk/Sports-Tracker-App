import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sportstracker/models/models.dart';
import 'package:sportstracker/pages/details.dart';
import 'package:sportstracker/widgets/basketball.dart';
import 'package:sportstracker/widgets/data_tile.dart';
import 'package:sportstracker/widgets/details_tile.dart';
import 'package:sportstracker/widgets/f1.dart';
import 'package:sportstracker/widgets/football.dart';

import '../Pages/home.dart';
import '../main.dart';


part 'sport_event.dart';
part 'sport_state.dart';

class SportBloc extends Bloc<SportEvent, SportState> {
  List<Widget> widgetsList;

  SportBloc({required this.widgetsList}) : super(SportInitial()) {
    on<AddSport>((event, emit) {
      emit(AddNew());
    });
    on<AddedSport>((event, emit) {
      emit(AddNew());
    });
  }

  Future<void> sport(String? team, String? url2,
      BuildContext context) async {
    final apiKey = '63e1534efc4b7aa08dd3b6f9a38d71a0';
    final url;
    final headers;
    emit(Loading());
    if (url2 == "football") {
      url = Uri.parse(
          "https://v3.football.api-sports.io/teams?search=$team"); // Use the 'team' parameter passed to the function
       headers = {
        'x-rapidapi-host': 'v3.football.api-sports.io',
        'x-rapidapi-key': apiKey, // Include your API key here
      };
    } else if (url2 == "formula-1") {
       url = Uri.parse(
          "https://v1.formula-1.api-sports.io/teams?search=$team"); // Use the 'team' parameter passed to the function
       headers = {
        'x-rapidapi-host': 'v1.formula-1.api-sports.io',
        'x-rapidapi-key': apiKey, // Include your API key here
      };
    } else if (url2 == "basketball") {
       url = Uri.parse(
          "https://v1.basketball.api-sports.io/teams?search=$team"); // Use the 'team' parameter passed to the function
       headers = {
        'x-rapidapi-host': 'v1.basketball.api-sports.io',
        'x-rapidapi-key': apiKey, // Include your API key here
      };
    } else {
      emit(Error(message: 'Team or URL is null. Cannot make the request.'));
      throw UnimplementedError();
    }
    getData(url, url2!, headers, context);
  }

  void getData(Uri url, String url2, Map<String, String> headers,
      BuildContext context) async {
    final response = await http.get(url, headers: headers);
    final result = jsonDecode(response.body)["response"][0];
    final model;
    if(url2=="football"){
      model = TeamModel(
          name: result["team"]["name"], logo: result["team"]["logo"].toString(), sport: url2,id: result["team"]["id"].toString());
    }else{
      model = TeamModel(
    name: result["name"], logo: result["logo"].toString(), sport: url2, id: result["id"].toString());
    }
    widgetsList.add(DataTile(model: model));
    Navigator.of(context).popUntil((route) => false);
    BlocProvider.of<SportBloc>(context).emit(AddedNew(DataTile(model: model)));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
        //settings: RouteSettings(arguments: widgetsList),
      ),
    );
    print(result);
  }

  Future<void> stats(String? url2, String? id,
      BuildContext context) async {
    final apiKey = '63e1534efc4b7aa08dd3b6f9a38d71a0';
    final url;
    final headers;
    emit(Loading());
    if (url2 == "football") {
      url = Uri.parse(
          "https://v3.football.api-sports.io/teams/statistics?league=39&team=$id&season=2019"); // Use the 'team' parameter passed to the function
      headers = {
        'x-rapidapi-host': 'v3.football.api-sports.io',
        'x-rapidapi-key': apiKey, // Include your API key here
      };
      final response = await http.get(url, headers: headers);
      final result = jsonDecode(response.body)["response"];
      final model = Football(sport: 'football', fixtures: result["fixtures"]["wins"]["total"].toString(), goals: result["goals"]["for"]["total"]["total"].toString(), form: result["form"].toString(), id: id, logo: "https://media.api-sports.io/football/teams/$id.png",name: result["team"]["name"]);
      emit(Stat(widget: FootballStats(footballStat: model,)));
    } else if (url2 == "formula-1") {
      url = Uri.parse("https://v1.formula-1.api-sports.io/teams?id=$id"); // Use the 'team' parameter passed to the function
      headers = {
        'x-rapidapi-host': 'v1.formula-1.api-sports.io',
        'x-rapidapi-key': apiKey, // Include your API key here
      };
      final response = await http.get(url, headers: headers);
      final result = jsonDecode(response.body)["response"][0];
      print(result);
      final model = F1(base: result["base"], entry: result["first_team_entry"].toString(), highest: result["highest_race_finish"]["position"].toString(), championships: result["world_championships"].toString(), fastest: result["fastest_laps"].toString(), engine: result["engine"], tyres: result["tyres"], director: result["director"], sport: "formula-1", id: id, logo: "https://media.api-sports.io/formula-1/teams/$id.png", name: result["name"]);
      print(model.engine);
      emit(Stat(widget: F1StatCard(f1: model)));
      print(model.engine);
    } else if (url2 == "basketball") {
      url = Uri.parse(
          "https://v1.basketball.api-sports.io/statistics?league=12&team=$id&season=2019-2020"); // Use the 'team' parameter passed to the function
      headers = {
        'x-rapidapi-host': 'v1.basketball.api-sports.io',
        'x-rapidapi-key': apiKey, // Include your API key here
      };
      final response = await http.get(url, headers: headers);
      final result = jsonDecode(response.body)["response"];
      final model = Basketball(sport: 'basketball', homeWins: result["games"]["wins"]["home"]["total"].toString(),awayWins: result["games"]["wins"]["away"]["total"].toString(), points: result["points"]["for"]["total"]["all"].toString(), id: id, logo: "https://media-4.api-sports.io/basketball/teams/$id.png", name: result["team"]["name"]);
      emit(Stat(widget: BasketballWidget(basketball: model,)));
    } else {
      emit(Error(message: 'Team or URL is null. Cannot make the request.'));
      throw UnimplementedError();
    }
  }





}