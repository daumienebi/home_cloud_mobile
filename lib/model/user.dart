class User {
  final String username;
  final String password;
  final int numberOfUploads;

  User(
      {required this.username,
      required this.password,
      required this.numberOfUploads});

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
      numberOfUploads: int.parse(json['numberOfUploads']),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'numberOfUploads': numberOfUploads,
    };
  }
}
