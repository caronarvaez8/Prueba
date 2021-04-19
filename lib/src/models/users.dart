class User {
  String name;
  String id;
  String symbol;

  User({this.name, this.id, this.symbol});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json['id'], name: json['name'], symbol: json['symbol']);
  }
}
