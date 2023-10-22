import 'package:flutter/material.dart';
import 'package:sportstracker/functions/select.dart';
import 'package:sportstracker/pages/search.dart';

class ListTileFav extends StatelessWidget {
  final String? text;
  final String? url;

  const ListTileFav({super.key, required this.text, required this.url,});

  @override
  Widget build(BuildContext context) {
    String? team;
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
                child: Row(
                  children: [
                    SizedBox(width: 10.0,),
                    Expanded(child: Text(
                      text!,
                      style: TextStyle(
                        color: Colors.white
                      ),
                    )),
                    Expanded(child: SizedBox()),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchTeam(url: url),
                            ),
                          );
                        },
                        icon: Icon(
                            Icons.navigate_next,
                            color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
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
    );
  }
}
