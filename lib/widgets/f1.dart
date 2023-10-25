import 'package:flutter/material.dart';

import '../models/models.dart';

class F1StatCard extends StatelessWidget {
  final F1 f1;

  F1StatCard({required this.f1});

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
              SizedBox(height: 20.0,),
              Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("${f1.logo}"),
                    radius: 60.0,
                  )
              ),
              SizedBox(height: 10.0,),
              Expanded(
                  flex: 1,
                  child: Center(
                    child: Container(
                      child: Text(
                        "${f1.name}",
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  )
              ),
              SizedBox(height: 50.0,),
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
                                'Base',
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
                                f1.base!.split(", ")[0],
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 65.0,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex:1,
                              child: Text(
                                'Entry',
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
                                f1.entry!,
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold
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
                                'Highest Wins',
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
                                f1.highest!,
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 40.0,
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
                                'Championships',
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
                                f1.championships!,
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 40.0,
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
                                'Fastest Laps',
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
                                f1.fastest!,
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 40.0,
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
                                'Director',
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
                                f1.director!.split(",")[0],
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold
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
                                'Engine',
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
                                f1.engine!,
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 40.0,
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
                                'Tyres',
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
                                f1.tyres!,
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 40.0,
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
