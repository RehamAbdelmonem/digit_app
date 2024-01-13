class Test {
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

  const Test(
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

List<Test> Tests = [
  Test(
      labID: 1,
      typeID: 1,
      trn: "323564779941234",
      ownerSSN: "20887433240647",
      name: " المختبر",
      subTitle: " نتائج تحاليل بدقة عالية",
      email: "Almokhtaber@email.com",
      image: "assets/images/almokhtaber.jpg",
      description: "معمل تحاليل",
      phone: "0133272905",
      location: " بنها - شارع الشهيد فريد ندا -\n امام مستشفى الايمان الخيرى"),
  Test(
      labID: 2,
      typeID: 1,
      trn: "323564779941234",
      ownerSSN: "20887433240647",
      name: " الفا",
      subTitle: " نتائج تحاليل بدقة عالية",
      email: "Alfa@email.com",
      image: "assets/images/alfaLAB.jpg",
      description: "معمل تحاليل",
      phone: "01220003459",
      location: " محطه العدلى -\n 29 سعد زغلول - قسم بنها "),
  Test(
    labID: 3,
    typeID: 1,
    trn: "323564779941234",
    ownerSSN: "20887433240647",
    name: " الفؤاد",
    subTitle: " نتائج تحاليل بدقة عالية",
    email: "Elfouad@email.com",
    image: "assets/images/elfouadLAB.jpg",
    description: "معمل تحاليل",
    phone: "01090907515",
    location: " بنها - ميدان الإشارة \n أمام مستشفى بنها الجامعي",
  ),
  Test(
      labID: 4,
      typeID: 1,
      trn: "323564779941234",
      ownerSSN: "20887433240647",
      name: " وليد فتحي",
      subTitle: " نتائج تحاليل بدقة عالية",
      email: "WalidFathey@email.com",
      image: "assets/images/walid2.png",
      description: "معمل تحاليل",
      phone: "01003030040",
      location: " بنها - شارع الشهيد فريد ندا -\n خلف عجيبة"),
];


//Rehaaaaaaaaaam
// مودل بيانات كل معمل تحاليل