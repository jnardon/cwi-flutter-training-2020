class Stats {
  String name;
  int value;

  Stats(this.name, this.value);

  Stats.fromJSON(Map json)
      : name = json['name'],
        value = json['value'];
}
