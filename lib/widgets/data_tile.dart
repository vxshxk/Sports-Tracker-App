import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportstracker/bloc/sport_bloc.dart';
import 'package:sportstracker/functions/select.dart';
import 'package:sportstracker/models/models.dart';
import 'package:sportstracker/pages/search.dart';

class DataTile extends StatelessWidget {
  final TeamModel model;
  const DataTile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 5.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 15,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                              color: Colors.blue[800]!,
                              width: 2.0,
                            ),
                            //borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListTile(
                            onTap: (){
                              //Navigator.of(context).pushNamed("/details");
                              BlocProvider.of<SportBloc>(context).stats(model.sport, model.id, context);
                            },
                              onLongPress: (){
                                BlocProvider.of<SportBloc>(context).emit(Loading());
                                BlocProvider.of<SportBloc>(context).widgetsList.remove(DataTile(model: model));
                                BlocProvider.of<SportBloc>(context).emit(Deleted());
                              },
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage("${model.logo}"),
                            ),
                            trailing: Text(
                              "${model.name}",
                              style: TextStyle(
                                color: Colors.blue[800]
                              ),
                            )
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: IconButton(
                          onPressed: (){
                            BlocProvider.of<SportBloc>(context).emit(Loading());
                            BlocProvider.of<SportBloc>(context).widgetsList.remove(DataTile(model: model));
                            BlocProvider.of<SportBloc>(context).emit(Deleted());

                          },
                          icon: Icon(Icons.delete,),
                          color: Colors.blue[800],
                        ),
                      )
                    ],
                  )
                ),
                SizedBox(
                  height: 5.0,
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
      ),
    );
  }
}
