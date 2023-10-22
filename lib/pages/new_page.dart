import 'package:flutter/material.dart';
import 'package:sportstracker/widgets/list_tile.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black
          ),
          child: ListView(
            children: [
              SizedBox(height: 70.0,),
              ListTileFav(text: "Basketball", url: 'basketball',),
              ListTileFav(text: "Football",url: 'football',),
              //ListTileFav(text: "Rugby"),
              ListTileFav(text: "Formula 1", url: 'formula-1'),
            ],
          )
        ),
      ),
    );
  }
}
