class User {
  User({
    this.email,
    this.password,
  });

  String email;
  String password;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
