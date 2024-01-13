class Scan {
  final int labID, typeID;
  final String trn,
      ownerSSN,
      name,
      subTitle,
      email,
      image,
      description,
      phone,
      location;

  const Scan(
      {required this.labID,
      required this.typeID,
      required this.trn,
      required this.ownerSSN,
      required this.name,
      required this.subTitle,
      required this.email,
      required this.image,
      required this.description,
      required this.phone,
      required this.location});
}

List<Scan> Scans = [
  const Scan(
      labID: 1,
      typeID: 2,
      trn: "33254697138108",
      ownerSSN: "22013449755789",
      name: "الفؤاد",
      subTitle: " دقة عالية",
      email: "Elfouad@email.com",
      image: "assets/images/elfouadCENTER.jpg",
      description: " مركز اشعة",
      phone: "01090907515",
      location: " بنها - ميدان الإشارة \n أمام مستشفى بنها الجامعي"),
  Scan(
      labID: 2,
      typeID: 2,
      trn: "33254697138108",
      ownerSSN: "22013449755789",
      name: " سما سكان",
      subTitle: "دقة عالية",
      email: "SamaScan@email.com",
      image: "assets/images/samascan.jpg",
      description: " مركز اشعة",
      phone: "01208552255",
      location:
          " خلف استقبال مستشفى الجامعة \n- امام مدرسة ناصر - بنها الجديدة"),
  Scan(
      labID: 3,
      typeID: 2,
      trn: "33254697138108",
      ownerSSN: "22013449755789",
      name: " أحمد فريد ",
      subTitle: "دقة عالية",
      email: "AhmedFarid@email.com",
      image: "assets/images/ahmedFarid.jpeg",
      description: " مركز اشعة",
      phone: "0133253001",
      location: " ميدان سعد زغلول عمارة البلدية المثلثة"),
];

//Rehaaaaaaaaaam
// مودل بيانات كل مركز أشعة