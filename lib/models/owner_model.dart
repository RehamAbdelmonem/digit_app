class OwnerLabModel {
  late String name;
  late String email;
  late String address;
  late String uId;
  late String role;
  String? deviceToken;
  late String phone;
  late bool male;
  String? image;
  late String labId;

  OwnerLabModel({
    required this.name,
    required this.email,
    required this.uId,
    required this.phone,
    required this.male,
    required this.role,
    required this.address,
    required this.labId,
    this.deviceToken,
    this.image,
  });

  OwnerLabModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    uId = json["uId"];
    deviceToken = json["deviceToken"];
    phone = json["phone"];
    male = json["male"];
    role = json["role"];
    image = json["image"];
    address = json["address"];
    labId = json["labId"];
  }

  Map<String, dynamic> toMaP() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "uId": uId,
      "deviceToken": deviceToken,
      "male": male,
      "role": role,
      "image": image,
      "address": address,
      "labId": labId,

    };
  }
}


class LabModel {
  late String labName;
  late String labAddress;
  late String labId;
  late String ownerId;
  late String labPhone;
  late bool homeService;
  List<String>? laboratory;
  List<String>? radiology;
  late String labImage;
  late String subTitle;

  LabModel({
    required this.labName,
    required this.labAddress,
    required this.labId,
     required this.homeService,
    required this.labPhone,
    required this.labImage,
    required this.ownerId,
    required this.subTitle,
    this.laboratory,
    this.radiology,
  });

  LabModel.fromJson(Map<String, dynamic> json) {
    labName = json["labName"];
    labAddress = json["labAddress"];
    labId = json["labId"];
    labPhone = json["labPhone"];
    labImage = json["labImage"];
    laboratory = List.from(json["laboratory"]??[]);
    radiology = List.from(json["radiology"]??[]);
    homeService = json["homeService"];
    ownerId = json["ownerId"];
    subTitle = json["subTitle"];

  }

  Map<String, dynamic> toMaP() {
    return {
      "labName": labName,
      "labAddress": labAddress,
      "labPhone": labPhone,
      "labId": labId,
      "labImage": labImage,
      "laboratory": laboratory,
      "radiology": radiology,
      "homeService": homeService,
      "ownerId": ownerId,
      "subTitle": subTitle,
    };
  }
}

/*
class LabTypeModel {
  late String laboratory;
  late String radiology;

  LabTypeModel({
    required this.laboratory,
    required this.radiology,
  });

  LabTypeModel.fromJson(Map<String, dynamic> json) {
    laboratory = json["laboratory"];
    radiology = json["radiology"];
  }

  Map<String, dynamic> toMaP() {
    return {
      "laboratory": laboratory,
      "radiology": radiology,
    };
  }
}
*/
