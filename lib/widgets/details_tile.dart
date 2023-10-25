import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportstracker/models/models.dart';

import '../main.dart';

class DetailTile extends StatelessWidget {
  final StatModel model;
  const DetailTile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    if(model.sport=="football"){
      return Container(
        height: MediaQuery.of(context).size.height * 2 / 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                child: Text("${model.form}",
                  style: TextStyle(
                    color: Colors.amber
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }else if(model.sport=="formula-1"){
      return Container(
        height: MediaQuery.of(context).size.height * 2 / 3,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            color: Colors.blue[800]!,
            width: 2.0,
          ),
          //borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text("${model.director}"),
      );
    }else{
      return Container(
        height: MediaQuery.of(context).size.height * 2 / 3,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            color: Colors.blue[800]!,
            width: 2.0,
          ),
          //borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text("${model.points}"),
      );
    }
  }
}
