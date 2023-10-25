import 'package:flutter/material.dart';

import '../models/models.dart';

class BasketballWidget extends StatelessWidget {
  final Basketball basketball;

  BasketballWidget({required this.basketball});

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
                    backgroundImage: NetworkImage("${basketball.logo}"),
                    radius: 60.0,
                  )
              ),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          child: Text(
                            "${basketball.name}",
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              SizedBox(height: 35.0,),
              Expanded(
                  flex: 1,
                  child: Container(
                    child: Text(
                      "WINS",
                      style: TextStyle(
                        fontSize: 40.0,
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
                                'Home',
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
                                basketball.homeWins!,
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
                                'Away',
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
                                basketball.awayWins!,
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
              Expanded(
                  flex: 2,
                  child: Center(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex:1,
                            child: Text(
                              'Total Points',
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
                              basketball.points!,
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 60.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
