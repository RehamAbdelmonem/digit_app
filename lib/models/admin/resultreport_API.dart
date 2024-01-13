// import 'package:gsheets/gsheets.dart';

// class ResultReportAPI {
//   static const _credentials = r'''

// {
//   "type": "service_account",
//   "project_id": "gsheet-378819",
//   "private_key_id": "43a243453350fca6a697a3cd64514e432803ea05",
//   "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCXan4omdI/rXG7\no4gfqfHGGfqkjCBeW8yh8sGmqrdhcIqfLDa5I0DDzeV206Vk3gs8rInvjQ4tAp1Z\noSehXVIAb8HsXYZuD4y5tbiGiNWIXD6eC0owGjN/8en+lLCYP8jhpGySVwqQC12U\np9qHd9TsIQaVXGhIo2ALuaAps2dILPWkCAwbYDD25YZYO2GRWGYw1nw+mAkJ1IV9\nhFG9qa2MAGXtd83klP5ww8eW5riBkueAh7jv+XO58E31ogAtBLqUnr6BxhyJRRU2\nXiQMsLNH+DrhYlOizV8UlxRzbl+IfZFe2UsYzBq1YuWkUtRevr9d6tNuEcn791M1\n63TjJBf7AgMBAAECggEAO/ln8CABacyDBI4hIF2ZkNyAbUW9mnJlCu6TKrdq/HLt\nzV9fa5SdlhELZzYsyFe0/rrexd5Ks6RZ/AL7pgxHKzoZB00CLr0FAhgK92rinWjg\nOoyBPa1bIb4J75conZ2CLXIJuSs12VlPH08fHVJnKYJpT6by/XaM2AgV+v5/FdRw\n81iLB6+WEuB/sJ1IhOHfaJz8S/avbKXSplUVcegDFfMV0XoN4bpACS6qpnqwtK3j\n5UbTAJJGwWhDqLmWFEj5agOI6+hqafYqcl9GtXeYyGO7xNQDO69pKB92/D15OOtd\n6MtCMC/M79xrs+et7Zb3/CGyCjmQrj56q3ji+XWwcQKBgQDOLMCzqwYodPwwThiU\n3kPhwBOlRAvT5DrQuf4/76arCiYp5B/NZyfYXYUe/PLr3yYi/JsYKg4suOfZT2xm\nS1MfTIjxGBW7sk9mE0FbvUUwQtr+D2lBYHgjsF6Th8teUp4zJmwviWAswhvZLClh\nZ0ss3pyqoid2CD/InIIRGG9eKwKBgQC8AgVUxyFat3IwXvfdUfOPmrHl3aC7N09Y\nMEnKeUdeGtpozdBNuv9v/uSK0SfnITagBlDuPAHv0C6Tf1ORgphRlrRm6zJtyN3D\n14JKRxp22v+zG6xLvf1kxs8S7cClIEToZhXKZbsFSrRjDHYY7gZFqs3p4OF1RbZM\nth/AZsYVcQKBgDzlUQGASTBX5UjrOC14PLqH/gV5RLkQFyMhXGxL/4FTXRRQceg8\nSLOKY9BUS/fJED2TOMf5W/hvoOM5pz3Lj8CV3XjAcWLf9r2igFJ1Y+MuS/pwWNlb\nggCgjj6rBDFW260l8xxTShnON2V8urgvRy/4jHOFs3wUUaqSN4SPIA3DAoGAfPHS\n3S6hagp0JtVWYI1wEkW6aItLoF/3qSIeSCMlXNL3x6LQBnh5/dIlzGOH40DdbqgD\n7O+QUfHGoluCDDgARmijZ6pzDyboyphUjEyIt+h++mcvr/6Jggnl4CyFVLgHU3NU\nk/fbvH6TNyg27AZzwKTsx7ud2jQEHSMEIveqOOECgYBH96Z455n/AAIxXtwfPumq\nNLJSBWnzxJBzS9EEWYGpXN7G0NVGrpsOdoTG10K1kJRt72P/aQqG/mukMf7Hd2Q4\nvi/lPZDvN1hd3l3lKy+XQFZBV9GvKpHAzFVSV2MlBI5eHY+h4WKtQmukKpWWXVwm\no15X/lolmy2rIW8uWYmVnw==\n-----END PRIVATE KEY-----\n",
//   "client_email": "gsheet@gsheet-378819.iam.gserviceaccount.com",
//   "client_id": "105188010595197682582",
//   "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//   "token_uri": "https://oauth2.googleapis.com/token",
//   "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//   "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheet%40gsheet-378819.iam.gserviceaccount.com"
// }
// ''';
//   static final _spreadsheetId = '10w63t3_YwX1so_EF1QBFngXbh_Ha5znurV40EdAYMt8';
//   static final _gsheets = GSheets(_credentials);
//   static Worksheet? _resultReportsheet;
//   static Future init()async{
//     final spreadsheet=await _gsheets.spreadsheet(_spreadsheetId);
//      _resultReportsheet=await _getWorkSheet(spreadsheet,title:'result report');
//   }
//   static Future <Worksheet>_getWorkSheet(
//     Spreadsheet spreadsheet,
//     {  required String title,
//     })async{
//     try{
//       return await spreadsheet.addWorksheet(title);
//     }catch(e){
//      return spreadsheet.worksheetByTitle(title)!; 
//     }
//   }
// }


