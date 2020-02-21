class PokemonModel {
  String id;
  String name;
  String image;
  List<dynamic> types;

  PokemonModel.fromJson(Map<String, dynamic> json) : assert(json != null) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    types = json['types'];
  }
}
