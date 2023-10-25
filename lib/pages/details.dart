import 'package:flutter/cupertino.dart';
import 'package:sportstracker/models/models.dart';
import 'package:sportstracker/widgets/details_tile.dart';

class Detail extends StatelessWidget {
  final StatModel model;
  const Detail({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return DetailTile(model: model);
  }
}
