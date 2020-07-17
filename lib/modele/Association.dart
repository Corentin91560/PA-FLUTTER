class Association{
  int id;
  String name;

  Association(this.id, this.name);

  factory Association.fromJson(Map<String, dynamic> json) {
    return Association(
      json["idassociation"],
      json["name"],
    );
  }

}