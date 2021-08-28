class Weather {
  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(dynamic json) {
    if (json == null) {
      return Weather();
    }

    return Weather(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon']);
  }

  final String description;
  final String icon;
  final int id;
  final String main;
}
