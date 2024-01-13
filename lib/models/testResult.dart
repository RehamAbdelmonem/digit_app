class Tresult {
  final int id, labId, doctorId, typeId;
  final String name, pSSN, date, typeName, labName, resultImage, testReport;

  const Tresult({
    required this.id,
    required this.labId,
    required this.doctorId,
    required this.typeId,
    required this.name,
    required this.pSSN,
    required this.date,
    required this.typeName,
    required this.labName,
    required this.resultImage,
    required this.testReport,
  });
}

List<Tresult> Tresults = [
  Tresult(
      id: 1,
      labId: 1,
      doctorId: 22,
      typeId: 14,
      name: "ريهام عبدالمنعم",
      pSSN: "332147985641027981",
      date: "22-7-2023",
      typeName: "تحليل فيتامين د",
      labName: "معمل المختبر",
      resultImage: "assets/images/test-D-min.jpg",
      testReport:
          "مستوى فيتامين د غير كافي: أي أن المريض يفتقر إلى فيتامين د  "),
  Tresult(
      id: 2,
      labId: 4,
      doctorId: 22,
      typeId: 14,
      name: "ريهام عبدالمنعم",
      pSSN: "332147985641027981",
      date: "22-7-2023",
      typeName: "تحليل  فقر الدم",
      labName: "معمل الفا",
      resultImage: "assets/images/test-D-min.jpg",
      testReport:
          "مستوى فيتامين د غير كافي: أي أن المريض يفتقر إلى فيتامين د  "),
  Tresult(
      id: 3,
      labId: 3,
      doctorId: 22,
      typeId: 14,
      name: "ريهام عبدالمنعم",
      pSSN: "332147985641027981",
      date: "22-7-2023",
      typeName: "تحليل الغدة",
      labName: "معمل الفؤاد",
      resultImage: "assets/images/test-D-min.jpg",
      testReport:
          "مستوى فيتامين د غير كافي: أي أن المريض يفتقر إلى فيتامين د  "),
  Tresult(
      id: 4,
      labId: 2,
      doctorId: 22,
      typeId: 14,
      name: "ريهام عبدالمنعم",
      pSSN: "332147985641027981",
      date: "22-7-2023",
      typeName: "تحليل الهيموجلوبين السكرى",
      labName: "معمل الفا",
      resultImage: "assets/images/test-D-min.jpg",
      testReport:
          "مستوى فيتامين د غير كافي: أي أن المريض يفتقر إلى فيتامين د  "),
];

//Rehaaaaaaaaaam
// مودل بيانات كل نتيجة أشعة
