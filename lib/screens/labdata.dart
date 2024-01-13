import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/admin/myButton.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class LabRegister extends StatefulWidget {
  const LabRegister({Key? key}) : super(key: key);

  @override
  State<LabRegister> createState() => _LabRegisterState();
}

class _LabRegisterState extends State<LabRegister> {
  var formKey = GlobalKey<FormState>();
  var secformKey = GlobalKey<FormState>();
  String name = "";
  File? _image;
  bool _isValid = false;
  // bool _isValidsec = false;
  bool isChecked = false;
  bool isClicked = false;
  //////////نوع المعمل////////////////
  var labcategory=["تحاليل","اشعة"];
  bool isvisible=false;

  void _saveForm() {
    setState(() {
      _isValid = formKey.currentState!.validate();
    });
    // setState(() {
    //   _isValidsec = secformKey.currentState!.validate();
    // });
  }

/////image picker

  final imagePicker = ImagePicker();
  Future getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue.shade900,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Column(
                children: [
                 SizedBox(height: 20,),
                  Form(
                    key: secformKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'بيانات المعمل',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Archivo',
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "اسم المعمل",
                            hintText: "معمل",
                            labelStyle:
                                TextStyle(fontSize: 24, color: Colors.black),
                          ),
                          keyboardType: TextInputType.text,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }

                            if (!RegExp(r'^[a-z A-z أ-ي]+$').hasMatch(value)) {
                              return "Please enter a valid  name";
                            }

                            // the email is valid
                            return null;
                          }),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          child: Column(
                            children: [
                              // ignore: prefer_const_constructors
                              Padding(
                                padding: const EdgeInsets.only(left:190.0,top: 12,right: 1),
                                child: Row(
                                  
                                  children: [
                                    const Text('اختر نوع معملك',
                                    style:
                                      TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w400),),
                                  ],
                                ),
                              ),
                                const SizedBox(height:12,),
                                
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      MyClick(text: 'تحاليل',color: const Color.fromARGB(248, 61, 116, 233),),
                                      SizedBox(width: 40,),
                                      MyClick(text: 'أشعة',color: const Color.fromARGB(248, 61, 116, 233),)
                                    ],
                                  ),
                                )



                            ],
                          ),
                        ),
                    
                    

                //         Container(
                //   decoration: BoxDecoration(
                //     color: Color(0xffE1F5FE),
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: Column(
                //     children: [
                //       Row(
                //         children: [
                //           Checkbox(
                //             value: isChecked,
                //             onChanged: (value) {
                //               setState(() {
                //                 isChecked = value ?? false;
                //                 labType = isChecked;
                //               });
                //             },
                //           ),
                //           Text(
                //             'خدمة منزلية ',
                //             style: TextStyle(
                //               fontSize: 20,
                //               color: Color(0xff5D666A),
                //             ),
                //           ),
                //         ],
                //       ),
                //       if (labType)
                //         const TextField(
                //           decoration: InputDecoration(
                //             hintText: 'أدخل العنوان هنا',
                //             border: OutlineInputBorder(),
                //           ),
                //           style: TextStyle(
                //             fontSize: 16,
                //             color: Color(0xff5D666A),
                //           ),
                //         ),
                //     ],
                //   ),
                // ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "الموقع ",
                            hintText: "موقع",
                            labelStyle:
                                TextStyle(fontSize: 24, color: Colors.black),
                          ),
                          keyboardType: TextInputType.streetAddress,
                          validator: ((value) {
                            // Check if this field is empty
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }

                            // using regular expression
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return "Please enter a valid email address";
                            }

                            // the email is valid
                            return null;
                          }),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: " رقم الهاتف",
                            hintText: "رقم",
                            labelStyle:
                                TextStyle(fontSize: 24, color: Colors.black),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }

                            // using regular expression
                            if (!RegExp(r'^01[0125][0-9]{8}$')
                                .hasMatch(value)) {
                              return "Please enter a valid phone number ";
                            }

                            // the email is valid
                            return null;
                          }),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: const Text(
                              'خدمات منزلية',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 22),
                            ),
                            trailing: Checkbox(
                              checkColor: Colors.white,
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'التحقق من التسجيل الضريبي',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Archivo',
                            color: Colors.red.shade600,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                            decoration: const InputDecoration(
                              labelText: "رقم التسجيل الضريبي",
                              hintText: "تسجيل ضريبي",
                              labelStyle:
                                  TextStyle(fontSize: 24, color: Colors.black),
                            ),
                            keyboardType: TextInputType.phone,
                            validator: ((value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }

                              // using regular expression
                              if (!RegExp(r'^01[0125][0-9]{8}$')
                                  .hasMatch(value)) {
                                return "Please enter a valid phone number ";
                              }

                              // the email is valid
                              return null;
                            })),
                        const SizedBox(
                          height: 55,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    height: 400,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: ClipRRect(
                                      child: _image == null
                                          ? IconButton(
                                              onPressed: () {
                                                getImage();
                                              },
                                              icon: const Icon(
                                                  Icons.camera_enhance),
                                              color: Colors.red.shade600,
                                            )
                                          : Image.file(_image!),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 45),
                        TextButton(
                          onPressed: _saveForm,
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(248, 61, 116, 233),
                              foregroundColor: Colors.white),
                          child: const Text('تاكيد بياناتي'),
                        ),
                        const SizedBox(height: 25),
                        _isValid
                            ? const Image(
                                image: AssetImage(
                                    'assets/gifs/icons8-verified-account.gif'),
                                fit: BoxFit.cover,
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
