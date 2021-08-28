class Wind {
  Wind({this.speed, this.deg});

  factory Wind.fromJson(dynamic json) {
    if (json == null) {
      return Wind();
    }

    return Wind(
      speed: double.parse(json['speed'].toString()),
      deg: json['deg'],
    );
  }

  final int deg;
  final double speed;
}
