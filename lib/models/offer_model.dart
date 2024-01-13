class OfferModel {
  late String id;
  late String name;
  late String offer;
   String? description;
  late String startDate;
  late String endDate;
  late String labId;


  OfferModel({
    required this.id,
    required this.name,
    required this.offer,
    required this.startDate,
    required this.endDate,
    required this.labId,
    this.description,
  });

  OfferModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    id = json["id"];
    offer = json["offer"];
    startDate = json["startDate"];
    endDate = json["endDate"];
    labId = json["labId"];
    description = json["description"];
  }

  Map<String, dynamic> toMaP() {
    return {
      "name": name,
      "id": id,
      "labId": labId,
      "offer": offer,
      "startDate": startDate,
      "endDate": endDate,
      "description": description,
    };
  }
}

