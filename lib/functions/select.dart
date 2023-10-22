import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sportstracker/models/models.dart';
import 'package:sportstracker/widgets/data_tile.dart';

import '../Pages/home.dart';
import '../main.dart';



Future<void> football(String? team, String? url2, BuildContext context) async {
     final apiKey = '63e1534efc4b7aa08dd3b6f9a38d71a0'; // Replace with your actual API key

     // Check for null values in team and url2
     if (team == null) {
          print('Team or URL is null. Cannot make the request.');
          return;
     }
     final url = Uri.parse("https://v3.football.api-sports.io/teams?search=$team"); // Use the 'team' parameter passed to the function
     final headers = {
          'x-rapidapi-host': 'v3.football.api-sports.io' ,
          'x-rapidapi-key': apiKey, // Include your API key here
     };

     final response = await http.get(url, headers: headers);
     final result = jsonDecode(response.body)["response"][0];
     final model = TeamModel(name: result["name"], id: result["id"].toString(),sport: url2);
     widgetsList.add(DataTile(model: model));
     Navigator.of(context).popUntil((route) => false);
     Navigator.push(
          context,
          MaterialPageRoute(
               builder: (context) => Home(),
               settings: RouteSettings(arguments: widgetsList),
          ),
     );
     //print(response.body);
}
Future<void> f1(String? team,String? url2, BuildContext context) async {
     final apiKey = '63e1534efc4b7aa08dd3b6f9a38d71a0'; // Replace with your actual API key

     // Check for null values in team and url2
     if (team == null) {
          return; //Text('Team or URL is null. Cannot make the request.');
     }
     final url = Uri.parse("https://v1.formula-1.api-sports.io/teams?search=$team"); // Use the 'team' parameter passed to the function
     final headers = {
          'x-rapidapi-host': 'v1.formula-1.api-sports.io' ,
          'x-rapidapi-key': apiKey, // Include your API key here
     };
     final response = await http.get(url, headers: headers);
     final result = jsonDecode(response.body)["response"][0];
     final model = TeamModel(name: result["name"], id: result["id"].toString(),sport: url2);
     widgetsList.add(DataTile(model: model));
     Navigator.of(context).popUntil((route) => false);
     Navigator.push(
          context,
          MaterialPageRoute(
               builder: (context) => Home(),
               settings: RouteSettings(arguments: widgetsList),
          ),
     );

     print(widgetsList);

}
Future<void> basketball(String? team,String? url2, BuildContext context) async {
     final apiKey = '63e1534efc4b7aa08dd3b6f9a38d71a0'; // Replace with your actual API key

     // Check for null values in team and url2
     if (team == null ) {
          print('Team or URL is null. Cannot make the request.');
          return;
     }
     final url = Uri.parse("https://v1.basketball.api-sports.io/teams?search=$team"); // Use the 'team' parameter passed to the function
     final headers = {
          'x-rapidapi-host': 'v1.basketball.api-sports.io' ,
          'x-rapidapi-key': apiKey, // Include your API key here
     };

     final response = await http.get(url, headers: headers);
     final result = jsonDecode(response.body)["response"][0];
     final model = TeamModel(name: result["name"], id: result["id"].toString(),sport: url2);
     widgetsList.add(DataTile(model: model));
     print(widgetsList);
     Navigator.of(context).popUntil((route) => false);
     Navigator.push(
          context,
          MaterialPageRoute(
               builder: (context) => Home(),
               settings: RouteSettings(arguments: widgetsList),
          ),
     );
     //print(response.body);
}

