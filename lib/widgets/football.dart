import 'package:flutter/material.dart';

import '../models/models.dart';

class FootballStats extends StatelessWidget {
  final Football footballStat;

  FootballStats({required this.footballStat});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Icon(Icons.info,
                  color: Colors.blue[800],
                )
              ),
              Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("${footballStat.logo}"),
                    radius: 60.0,
                  )
              ),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 40.0,
                      ),
                      Container(
                        child: Text(
                          "${footballStat.name}",
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),

                    ],
                  )
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    child: Text(
                      "Form: ${footballStat.form!.substring(0, 10)}",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.amber,
                      ),
                    ),
                  )
              ),
              Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 8.0,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex:1,
                              child: Text(
                                'Goals',
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Expanded(
                              flex:3,
                              child: Text(
                                footballStat.goals!,
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 60.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 45.0,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex:1,
                              child: Text(
                                'Wins',
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Expanded(
                              flex:3,
                              child: Text(
                                footballStat.fixtures!,
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 60.0,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

