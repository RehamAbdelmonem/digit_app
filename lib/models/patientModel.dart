class UserModel {
  late String name;
  late String email;
  late String age;
  late String ssn;
  late String address;
  late String uId;
  late String role;
   String? deviceToken;
  late String phone;
  late bool male;
    String? image;

  UserModel({
    required this.name,
    required this.email,
    required this.uId,
    required this.phone,
    required this.male,
    required this.role,
     this.deviceToken,
     this.image,
    required this.age,
    required this.address,
    required this.ssn,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    uId = json["uId"];
    deviceToken = json["deviceToken"];
    phone = json["phone"];
    male = json["male"];
    age = json["age"];
    role = json["role"];
    image = json["image"];
    address = json["address"];
    ssn = json["ssn"];
  }

  Map<String, dynamic> toMaP() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "uId": uId,
      "deviceToken": deviceToken,
      "male": male,
      "age": age,
      "image": image,
      "address": address,
      "role": role,
      "ssn": ssn,

    };
  }
}
