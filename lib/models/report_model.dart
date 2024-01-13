class ReportModel {
   late String id;
   late String patientName;
   late String doctorName;
   late String labName;
   late String analysisName;
   late String analysisPercent;
   late String analysisReport;
   late String date;
   late String image;
   late String typeOfLab;
   late String labId;
   ReportModel({
    required this.id,
    required this.patientName,
    required this.doctorName,
    required this.labName,
    required this.analysisName,
    required this.analysisPercent,
    required this.date,
    required this.analysisReport,
    required this.image,
    required this.typeOfLab,
    required this.labId,
  });
   ReportModel.fromJson(Map<String, dynamic> json) {
     patientName = json["patientName"];
     id = json["id"];
     doctorName = json["doctorName"];
     labName = json["labName"];
     analysisName = json["analysisName"];
     analysisPercent = json["analysisPercent"];
     analysisReport = json["analysisReport"];
     image = json["image"];
     date = json["date"];
     typeOfLab = json["typeOfLab"];
     labId = json["labId"];
   }

   Map<String, dynamic> toMaP() {
     return {
       "patientName": patientName,
       "id": id,
       "analysisPercent": analysisPercent,
       "doctorName": doctorName,
       "labName": labName,
       "analysisName": analysisName,
       "analysisReport": analysisReport,
       "image": image,
       "date": date,
       "typeOfLab": typeOfLab,
       "labId": labId,
     };
   }
}