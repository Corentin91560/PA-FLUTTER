class Statistique{
  final double numberuser;
  final double numberassociation;
  final double averagepostbyevent;
  final double numbereventinprogress;
  final double numbereventnotstarted;
  final double numbereventended;
  final double averageeventperasso;

  Statistique(this.numberuser, this.numberassociation, this.averagepostbyevent, this.numbereventinprogress, this.numbereventnotstarted, this.numbereventended, this.averageeventperasso);

  factory Statistique.fromJson(Map<String, dynamic> json) {
    return Statistique(
      json["numberuser"],
      json["numberassociation"],
      json["averagepostbyevent"],
      json["numbereventinprogress"],
      json["numbereventnotstarted"],
      json["numbereventended"],
      json["averageeventperasso"],
    );
  }
}