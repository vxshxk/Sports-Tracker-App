class TeamModel{
  String? name;
  String? id;
  String? sport;
  String? logo;



  TeamModel({
    required this.name,
    required this.id,
    required this.sport,
    required this.logo
  });
}
abstract class StatModel{
  String? sport;
  String? logo;
  String? id;
  String? base;
  String? entry;
  String? highest;
  String? championships;
  String? fastest;
  String? engine;
  String? tyres;
  String? director;
  String? fixtures;
  String? goals;
  String? form;
  String? homeWins;
  String? awayWins;
  String? points;
}

class F1 extends StatModel{
  String? name;
  String? logo;
  String? id;
  String? sport;
  String? base;
  String? entry;
  String? highest;
  String? championships;
  String? fastest;
  String? engine;
  String? tyres;
  String? director;
  F1({
    required this.name,
    required this.id,
    required this.logo,
    required this.sport,
    required this.base,
    required this.entry,
    required this.highest,
    required this.championships,
    required this.fastest,
    required this.engine,
    required this.tyres,
    required this.director,
});

}

class Football extends StatModel{
  String? name;
  String? sport;
  String? logo;
  String? id;
  String? fixtures;
  String? goals;
  String? form;
  Football({
    required this.name,
    required this.id,
    required this.logo,
    required this.sport,
    required this.fixtures,
    required this.goals,
    required this.form,
});
}

class Basketball extends StatModel{
   String? name;
    String? sport;
    String? logo;
    String? id;
    String? homeWins;
    String? awayWins;
    String? points;
    Basketball({
      required this.id,
      required this.name,
      required this.logo,
      required this.sport,
      required this.homeWins,
      required this.awayWins,
      required this.points,
});

}


