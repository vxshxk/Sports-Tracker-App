import 'package:flutter/material.dart';
import 'package:sportstracker/functions/select.dart';
import 'package:sportstracker/models/models.dart';
import 'package:sportstracker/pages/search.dart';

class DataTile extends StatelessWidget {
  final TeamModel model;
  const DataTile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Expanded(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.blue[800]!,
                    width: 2.0,
                  ),
                  //borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text("${model.name}",style: TextStyle(
                  color: Colors.amber
                ),)
              ),
              SizedBox(
                height: 10.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );;
  }
}
