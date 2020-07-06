class User {
  final String lastName;
  final String firstName;
  final String address;

  User(this.lastName, this.firstName, this.address);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json["lastName"],
      json["firstName"],
      json["address"],
    );
  }
}