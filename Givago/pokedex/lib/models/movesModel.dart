class MovesModel {
  String name;
  int learnLevel;
  String type;

  MovesModel.fromJson(Map<String, dynamic> json) : assert(json != null) {
    name = json['name'];
    learnLevel = json['learnLevel'];
    type = json['type'];
  }
}
