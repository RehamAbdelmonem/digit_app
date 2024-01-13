class Person {
  late String name;
  late String email;
  late String uId;
  late String phone;
  late String address;
  late String age;
   String? image;
   String? deviceToken;

  Person({
    required this.name,
    required this.email,
    required this.uId,
    required this.phone,
    required this.address,
    required this.age,
    this.image,
    this.deviceToken,
  });

  Person.fromPatientJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    uId = json["uId"];
    phone = json["phone"];
    address = json["address"];
    age = json["age"];
    image = json["image"];
    deviceToken = json["deviceToken"];
  }
  Person.fromLabJson(Map<String, dynamic> json) {
    name = json["labName"];
    uId = json["labId"];
    phone = json["labPhone"];
    address = json["labAddress"];
    image = json["labImage"];
  }

  Map<String, dynamic> toMaP() {
    return {
      "name": name,
      "email": email,
      "uId": uId,
      "phone": phone,
      "address": address,
      "age": age,
      "image": image,
      "deviceToken": deviceToken,
    };
  }
}

