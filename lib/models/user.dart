class User {
  final int accID, patientID;
  final String ssn, name, age, email, phone, image, location, accPassword;

  const User(
      {required this.accID,
      required this.patientID,
      required this.ssn,
      required this.name,
      required this.age,
      required this.email,
      required this.phone,
      required this.image,
      required this.location,
      required this.accPassword});
}


List<User> Users = [
  User(
      accID: 1,
      patientID: 1,
      ssn: "33201574697237",
      name: "ريهام عبدالمنعم",
      age: "22",
      email: " reham@email.com",
      image: "assets/images/ProfileImage.png",
      phone: "01115941937",
      location: " بنها - ميدان الإشارة \n أمام مستشفى بنها الجامعي",
      accPassword: "************"),
];


//Rehaaaaaaaaaam
// مودل بيانات اليوزر