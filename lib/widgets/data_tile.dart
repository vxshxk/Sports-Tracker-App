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
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: [
                        Expanded(flex: 2, child: Image.network("https://media.api-sports.io/${model.sport}/teams/${model.id}.png"),),
                        SizedBox(width: 10.0,),
                        Expanded(flex: 6, child: Text("${model.name}",style: TextStyle(
                          color: Colors.amber
                        ),))
                      ],
                    )
                  ),
                  trailing: Text("${model.sport}",style: TextStyle(
                      color: Colors.amber
                  )),
                )
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
