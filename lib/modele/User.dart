class User{
  int id;
  String name;

  User(this.id, this.name);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json["iduser"],
      json["firstname"],
    );
  }
}