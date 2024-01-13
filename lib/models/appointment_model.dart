class AppointmentModel {
  late String username;
  late String email;
  late String uId;
  late String phone;
  late String address;
  late String type;
  late List<String>  typeOfLab;
  late bool  homeService;
  late String  gender;
  late String  dateOfAppointment;
  late String  timeStamp;
  late int age;
   String? image;
   String? deviceToken;

  AppointmentModel({
    required this.username,
    required this.email,
    required this.uId,
    required this.phone,
    required this.type,
    required this.address,
    required this.age,
    required this.typeOfLab,
    required this.gender,
    required this.dateOfAppointment,
    required this.timeStamp,
     this.homeService=false,
    this.image,
    this.deviceToken,
  });

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    email = json["email"];
    uId = json["uId"];
    phone = json["phone"];
    address = json["address"];
    type = json["type"];
    age = json["age"];
    typeOfLab = List.from(json["typeOfLab"]);
    dateOfAppointment = json["dateOfAppointment"];
    timeStamp = json["timeStamp"];
    gender = json["gender"];
    homeService = json["homeService"];
    image = json["image"];
    deviceToken = json["deviceToken"];
  }

  Map<String, dynamic> toMaP() {
    return {
      "username": username,
      "email": email,
      "uId": uId,
      "phone": phone,
      "address": address,
      "age": age,
      "type": type,
      "typeOfLab": typeOfLab,
      "dateOfAppointment": dateOfAppointment,
      "timeStamp": timeStamp,
      "homeService": homeService,
      "gender": gender,
      "image": image,
      "deviceToken": deviceToken,
    };
  }
}

