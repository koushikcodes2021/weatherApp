class Clouds {
  Clouds({this.all});

  factory Clouds.fromJson(dynamic json) {
    if (json == null) {
      return Clouds();
    }

    return Clouds(
      all: json['all'],
    );
  }

  final int all;
}
