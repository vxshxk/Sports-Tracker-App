import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sportstracker/models/models.dart';
import 'package:sportstracker/widgets/data_tile.dart';

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
    final model = TeamModel(
        name: result["name"], id: result["id"].toString(), sport: url2);
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
    print(widgetsList);
    print(model);
    print(result);
  }
}