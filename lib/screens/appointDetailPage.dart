import 'package:flutter/material.dart';
import 'package:graduation_project/models/appointment_model.dart';

class AppointDetailPage extends StatefulWidget {
  late AppointmentModel model;
   AppointDetailPage(this.model,{Key? key}) : super(key: key);

  @override
  State<AppointDetailPage> createState() => _AppointDetailPageState();
}

class _AppointDetailPageState extends State<AppointDetailPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: ((context, child) {
        return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue.shade900,
                automaticallyImplyLeading: false,
                flexibleSpace: SafeArea(
                    child: Row(children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        ////////////////لو احط ارو بيرجع
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 75.0),
                        child: Text(
                          'تفاصيل الموعد',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                    ])),
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all( 6),
                child: Column(children: [
                  const SizedBox(height: 25,),
                  ListTile(
                    leading: const Text(
                      '  اسم المريض',style:TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Archivo')
                    ),
                    trailing: Container(
                      height: 70,
                      width: 230,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(widget.model.username,
                      style: const TextStyle(
                        fontSize: 16,
                      ),),
                    ),
                  ),
                 const SizedBox(
                    height: 25,
                  ),
                  ListTile(
                    title: const Text(
                      'نوع العملية',style:TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Archivo')
                    ),
                    trailing: Container(
                      height: 70,
                      width: 230,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(widget.model.type,
                        style: const TextStyle(
                          fontSize: 16,
                        ),),
                    ),
                  ),
                 const SizedBox(
                    height: 25,
                  ),
                  ListTile(
                    title: const Text(
                      '  تاريخ الموعد',style:TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Archivo')
                    ),
                    trailing: Container(
                      height: 70,
                      width: 230,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(widget.model.dateOfAppointment,
                        style: const TextStyle(
                          fontSize: 16,
                        ),),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ListTile(
                    title: const Text(
                        '  تاريخ الموعد',style:TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Archivo')
                    ),
                    trailing: Container(
                      height: 70,
                      width: 230,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(widget.model.phone,
                        style: const TextStyle(
                          fontSize: 16,
                        ),),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ListTile(
                    title: const Text(
                        '  تاريخ الموعد',style:TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Archivo')
                    ),
                    trailing: Container(
                      height: 70,
                      width: 230,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(widget.model.email,
                        style: const TextStyle(
                          fontSize: 16,
                        ),),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ListTile(
                    title: const Text(
                        '  تاريخ الموعد',style:TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Archivo')
                    ),
                    trailing: Container(
                      height: 70,
                      width: 230,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(widget.model.gender,
                        style: const TextStyle(
                          fontSize: 16,
                        ),),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ListTile(
                    title: const Text(
                      '  الدكتور المسؤول',style:TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Archivo')
                    ),
                    trailing: Container(
                      height: 70,
                      width: 230,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ListTile(
                    title: const Text(
                      ' المعمل المختص',style:TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Archivo') ,
                    ),
                    trailing: Container(
                      height: 70,
                      width: 230,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ListTile(
                    title: const Text('خدمة منزلية',style:TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Archivo')),
                    trailing: Padding(
                      padding: const EdgeInsets.only(left:78.0),
                      child: Checkbox(
                        checkColor: Colors.white,
                        value: widget.model.homeService,
                        onChanged: (bool? value) {
                        },
                      ),
                    ),
                  ),
                  if(widget.model.homeService)
                  const SizedBox(
                    height: 25,
                  ),
                  if(widget.model.homeService)
                    ListTile(
                    title: const Text(
                        'عنوان المنزل',style:TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Archivo')
                    ),
                    trailing: Container(
                      height: 70,
                      width: 230,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(widget.model.address,
                        style: const TextStyle(
                          fontSize: 16,
                        ),),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Container(
                      width: 280,
                      padding: const EdgeInsetsDirectional.all(10),
                      margin: const EdgeInsetsDirectional.only(end: 10),
                      alignment: AlignmentDirectional.centerStart,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(widget.model.typeOfLab.join("\n"),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                ]),
              ),
            ));
      }),
    );
  }
}
