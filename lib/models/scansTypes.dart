class ScanType {
  final int code, typeID;
  final String name;

  const ScanType({
    required this.code,
    required this.typeID,
    required this.name,
  });
}

List<ScanType> scanTypes = [
  const ScanType(
    code: 21,
    typeID: 2,
    name: " Echo ",
  ),
  const ScanType(
    code: 22,
    typeID: 2,
    name: " Sonar ",
  ),
  const ScanType(
    code: 23,
    typeID: 2,
    name: " Radiology ",
  ),
  const ScanType(
    code: 24,
    typeID: 2,
    name: "lab ",
  ),
  const ScanType(
    code: 25,
    typeID: 2,
    name: " doppler ",
  ),
  const ScanType(
    code: 26,
    typeID: 2,
    name: "skull AP ",
  ),
  const ScanType(
    code: 27,
    typeID: 2,
    name: " Skull AP-LAT ",
  ),
  const ScanType(
    code: 28,
    typeID: 2,
    name: " SKULL AXIAL ",
  ),
  const ScanType(
    code: 29,
    typeID: 2,
    name: " PNS AP ",
  ),
  const ScanType(
    code: 210,
    typeID: 2,
    name: "ORBIT AP ",
  ),
  const ScanType(
    code: 211,
    typeID: 2,
    name: "RIGHT  PETROUS BONE ",
  ),
  const ScanType(
    code: 212,
    typeID: 2,
    name: "LEFT PETROUS  BONE ",
  ),
  const ScanType(
    code: 213,
    typeID: 2,
    name: "BOTH PETROUS BONE ",
  ),
  const ScanType(
    code: 214,
    typeID: 2,
    name: "NECK AP ",
  ),
  const ScanType(
    code: 215,
    typeID: 2,
    name: "NECK   AP-LAT ",
  ),
  const ScanType(
    code: 216,
    typeID: 2,
    name: "LARYNX, LAT ",
  ),
  const ScanType(
    code: 217,
    typeID: 2,
    name: "LARYNX, AP, LAT ",
  ),
  const ScanType(
    code: 218,
    typeID: 2,
    name: "TMJ   AP ",
  ),
  const ScanType(
    code: 219,
    typeID: 2,
    name: "TMJ   AP  LAT ",
  ),
  const ScanType(
    code: 220,
    typeID: 2,
    name: "CERVICAL    AP ",
  ),
  const ScanType(
    code: 221,
    typeID: 2,
    name: "CERVICAL  LAT ",
  ),
  const ScanType(
    code: 222,
    typeID: 2,
    name: "CERVICAL    AP-LAT ",
  ),
  const ScanType(
    code: 223,
    typeID: 2,
    name: "CERVICAL  AP   FLEX-EXTENION",
  ),
  const ScanType(
    code: 224,
    typeID: 2,
    name: "CERVICAL  AP   LAT  FLEX-EXTENION",
  ),
  const ScanType(
    code: 225,
    typeID: 2,
    name: "CERVICAL  SPINE  AP ",
  ),
  const ScanType(
    code: 226,
    typeID: 2,
    name: "DORSAL SPINE   AP ",
  ),
  const ScanType(
    code: 227,
    typeID: 2,
    name: "DORSAL SPINE LAT ",
  ),
  const ScanType(
    code: 228,
    typeID: 2,
    name: "DORSAL SPINE AP -LAT ",
  ),
  const ScanType(
    code: 229,
    typeID: 2,
    name: "DORSAL SPINE  RIGHT OBLIQUE ",
  ),
  const ScanType(
    code: 230,
    typeID: 2,
    name: "DORSAL SPINE LEFT OBLIQUE ",
  ),
  const ScanType(
    code: 231,
    typeID: 2,
    name: "LUMBAR SPINE AP",
  ),
  const ScanType(
    code: 232,
    typeID: 2,
    name: "LUMBAR SPINE  LAT ",
  ),
  const ScanType(
    code: 233,
    typeID: 2,
    name: "LUMBAR SPINE AP-LAT ",
  ),
  const ScanType(
    code: 234,
    typeID: 2,
    name: "LUMBAR SPINE    OBLIQUE ",
  ),
  const ScanType(
    code: 235,
    typeID: 2,
    name: "LUMBAR SPINE  AP LAT FLEC EXTENSION ",
  ),
  const ScanType(
    code: 236,
    typeID: 2,
    name: "LUMBAR SPINE   AP ",
  ),
  const ScanType(
    code: 237,
    typeID: 2,
    name: "PNS  CORNAL ",
  ),
  const ScanType(
    code: 238,
    typeID: 2,
    name: "PNS   CORNAL  AXIAL ",
  ),
  const ScanType(
    code: 239,
    typeID: 2,
    name: "NECK  AP",
  ),
  const ScanType(
    code: 240,
    typeID: 2,
    name: "NECK  AP-LAT ",
  ),
  const ScanType(
    code: 241,
    typeID: 2,
    name: "CHEST AP",
  ),
  const ScanType(
    code: 242,
    typeID: 2,
    name: "CHEST LAT ",
  ),
  const ScanType(
    code: 243,
    typeID: 2,
    name: "CHEST  RIGHT OBLIQUE ",
  ),
  const ScanType(
    code: 244,
    typeID: 2,
    name: "CHEST  LEFT OBLIQUE ",
  ),
  const ScanType(
    code: 245,
    typeID: 2,
    name: "CHEST   LAT OBLIQUE ",
  ),
  const ScanType(
    code: 246,
    typeID: 2,
    name: "CHEST ",
  ),
  const ScanType(
    code: 247,
    typeID: 2,
    name: "SHOULDER PA ",
  ),
  const ScanType(
    code: 248,
    typeID: 2,
    name: "SHOULDER ",
  ),
  const ScanType(
    code: 249,
    typeID: 2,
    name: "SHOULDER  OPEN ",
  ),
  const ScanType(
    code: 250,
    typeID: 2,
    name: "SHOULDER  CLOSED ",
  ),
  const ScanType(
    code: 251,
    typeID: 2,
    name: "FORARM   LAT ",
  ),
  const ScanType(
    code: 252,
    typeID: 2,
    name: "FORARM  OBLIQUE ",
  ),
  const ScanType(
    code: 253,
    typeID: 2,
    name: "FORARM AP ",
  ),
  const ScanType(
    code: 254,
    typeID: 2,
    name: "FORARM AP LAT ",
  ),
  const ScanType(
    code: 255,
    typeID: 2,
    name: " ARM AP ",
  ),
  const ScanType(
    code: 256,
    typeID: 2,
    name: "ARM  LAT ",
  ),
  const ScanType(
    code: 257,
    typeID: 2,
    name: "ARM  OBLIQUE",
  ),
  const ScanType(
    code: 258,
    typeID: 2,
    name: "SHOULDER  LET ",
  ),
  const ScanType(
    code: 259,
    typeID: 2,
    name: "SHOULDER  OBLIQUE ",
  ),
  const ScanType(
    code: 260,
    typeID: 2,
    name: "ELBOW   AP ",
  ),
  const ScanType(
    code: 261,
    typeID: 2,
    name: "ELBOW  LAT ",
  ),
  const ScanType(
    code: 262,
    typeID: 2,
    name: "ELBOW OBLIQUE ",
  ),
  const ScanType(
    code: 263,
    typeID: 2,
    name: "ELBOW  AP-LAT ",
  ),
  const ScanType(
    code: 264,
    typeID: 2,
    name: "WRIST  AP",
  ),
  const ScanType(
    code: 265,
    typeID: 2,
    name: "WRIST LAT ",
  ),
  const ScanType(
    code: 266,
    typeID: 2,
    name: "WRIST OBLIQUE ",
  ),
  const ScanType(
    code: 267,
    typeID: 2,
    name: "WRIST SCAPHOID ",
  ),
  const ScanType(
    code: 268,
    typeID: 2,
    name: "WRIST  AP-LAT ",
  ),
  const ScanType(
    code: 269,
    typeID: 2,
    name: "WRIST AP-LAT-SCAPHOID ",
  ),
  const ScanType(
    code: 270,
    typeID: 2,
    name: "FINGER AP-LAT ",
  ),
  const ScanType(
    code: 271,
    typeID: 2,
    name: "FINGER LAT ",
  ),
  const ScanType(
    code: 272,
    typeID: 2,
    name: "FINGER  OBLIQUE ",
  ),
  const ScanType(
    code: 273,
    typeID: 2,
    name: "FINGER AP ",
  ),
  const ScanType(
    code: 274,
    typeID: 2,
    name: "HAND  AP",
  ),
  const ScanType(
    code: 275,
    typeID: 2,
    name: "HAND  LAT ",
  ),
  const ScanType(
    code: 276,
    typeID: 2,
    name: "HAND  OBLIQUE ",
  ),
  const ScanType(
    code: 277,
    typeID: 2,
    name: "HAND  AP-OBLIQUE ",
  ),
  const ScanType(
    code: 278,
    typeID: 2,
    name: "ABDOMINAL AP ",
  ),
  const ScanType(
    code: 279,
    typeID: 2,
    name: "ABDOMINAL PA ",
  ),
  const ScanType(
    code: 280,
    typeID: 2,
    name: "ABDOMINAL ERECT ",
  ),
  const ScanType(
    code: 281,
    typeID: 2,
    name: "ABDOMINAL   OBLIQUE ",
  ),
  const ScanType(
    code: 282,
    typeID: 2,
    name: "ABDOMINAL  LAT ",
  ),
  const ScanType(
    code: 283,
    typeID: 2,
    name: "PELVIS  AP ",
  ),
  const ScanType(
    code: 284,
    typeID: 2,
    name: "PELVIS  LAT",
  ),
  const ScanType(
    code: 285,
    typeID: 2,
    name: "PELVIS LEFT OBLIQUE",
  ),
  const ScanType(
    code: 286,
    typeID: 2,
    name: "PELVIS RIGHT OBLIQUE ",
  ),
  const ScanType(
    code: 287,
    typeID: 2,
    name: "CAVCUM AP ",
  ),
  const ScanType(
    code: 288,
    typeID: 2,
    name: "CAVCUM AP-LAT",
  ),
  const ScanType(
    code: 289,
    typeID: 2,
    name: "CAVCUM RIGHT OBLIQUE ",
  ),
  const ScanType(
    code: 290,
    typeID: 2,
    name: "CAVCUM LEFT OBLIQUE",
  ),
  const ScanType(
    code: 291,
    typeID: 2,
    name: "HIP JOINT AP ",
  ),
  const ScanType(
    code: 292,
    typeID: 2,
    name: "HIP JOINT LAT ",
  ),
  const ScanType(
    code: 293,
    typeID: 2,
    name: "HIP JOINT  RIGHT OBLIQUE ",
  ),
  const ScanType(
    code: 294,
    typeID: 2,
    name: "HIP JOINT LEFT OBLIGUE ",
  ),
  const ScanType(
    code: 295,
    typeID: 2,
    name: "HIP JOINT AP-LAT ",
  ),
  const ScanType(
    code: 296,
    typeID: 2,
    name: "HIP JOINT AP ",
  ),
  const ScanType(
    code: 297,
    typeID: 2,
    name: "HIP JOINT LAT ",
  ),
  const ScanType(
    code: 298,
    typeID: 2,
    name: "HIP JOINT RIGHT  OBLIQUE ",
  ),
  const ScanType(
    code: 299,
    typeID: 2,
    name: "HIP JOINT LEFT OBLIQUE",
  ),
  const ScanType(
    code: 2100,
    typeID: 2,
    name: "KNEE AP ",
  ),
  const ScanType(
    code: 2101,
    typeID: 2,
    name: "X-ray",
  ),
  const ScanType(
    code: 2102,
    typeID: 2,
    name: "CT scan",
  ),
  const ScanType(
    code: 2103,
    typeID: 2,
    name: "Ultrasound",
  ),
  const ScanType(
    code: 2104,
    typeID: 2,
    name: "MRI",
  ),
  const ScanType(
    code: 2105,
    typeID: 2,
    name: "PET CT",
  ),
  const ScanType(
    code: 2106,
    typeID: 2,
    name: "Mastology",
  ),
  const ScanType(
    code: 2107,
    typeID: 2,
    name: "Angiography",
  ),
];

//Rehaaaaaaaaaam
//مودل بجميع أنواع الأشعة