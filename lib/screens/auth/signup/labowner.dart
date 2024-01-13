import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/components/componants.dart';
import 'package:graduation_project/models/owner_model.dart';
import 'package:graduation_project/models/scansTypes.dart';
import 'package:graduation_project/screens/auth/signup/register_cubit/register_cubit.dart';
import 'package:graduation_project/shared/components/constants.dart';
import 'package:graduation_project/shared/network/local/cache_helper.dart';
import 'package:graduation_project/widgets/admin/myButton.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../../models/testsTypes.dart';
import '../../home/cubit/home_patint_cubit.dart';
import '../../lab/AddScans.dart';
import '../../lab/AddTests.dart';
import '../../home/admin_main.dart';
import '../../profile/cubit/profile_cubit.dart';
import 'register_cubit/register_states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class OwnerRegister extends StatefulWidget {
  OwnerRegister({this.scroll = false, Key? key}) : super(key: key);
  bool? scroll = false;

  @override
  State<OwnerRegister> createState() => _OwnerRegisterState();
}

class _OwnerRegisterState extends State<OwnerRegister> {
  final ScrollController scrollController = ScrollController();
  final GlobalKey myWidgetKey = GlobalKey();

  void scroll() {
    final RenderObject? renderObject =
        myWidgetKey.currentContext?.findRenderObject();
    if (renderObject != null) {
      final RenderAbstractViewport viewport =
          RenderAbstractViewport.of(renderObject);
      scrollController.animateTo(
        viewport.getOffsetToReveal(renderObject, 0.0).offset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  var formKey = GlobalKey<FormState>();
  var secformKey = GlobalKey<FormState>();
  bool _isValid = false;
  bool isDone = false;

  bool isHomeService = false;
  bool isClicked = false;

  //////////نوع المعمل////////////////
  var labcategory = ["تحاليل", "اشعة"];
  bool isvisible = false;
  bool isvisible_scan = false;

  //  void _viewOption() {
  //  setState(() {
  //   isClicked = false;
  //  labType = isClicked;});

  // }

/////image picker

  File? _image;

  final imagePicker = ImagePicker();

  Future getImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = File(image.path);
      }
    });
  }

  bool isSecurePassword = true;
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _special = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  void _fromCached() {
    _userName.text = CacheHelper.getData(key: "_userName") ?? "";
    _email.text = CacheHelper.getData(key: "_email") ?? "";
    _phone.text = CacheHelper.getData(key: "_phone") ?? "";
    _special.text = CacheHelper.getData(key: "_special") ?? "";
    _address.text = CacheHelper.getData(key: "_address") ?? "";
    _password.text = CacheHelper.getData(key: "_password") ?? "";
    _confirmPassword.text = CacheHelper.getData(key: "_confirmPassword") ?? "";
    _labName.text = CacheHelper.getData(key: "_labName") ?? "";
    _labSubTitle.text = CacheHelper.getData(key: "_labSubTitle") ?? "";
    _labPhone.text = CacheHelper.getData(key: "_labPhone") ?? "";
    _labNumOfRegister.text =
        CacheHelper.getData(key: "_labNumOfRegister") ?? "";
    _labAddressGov.text = CacheHelper.getData(key: "_labAddressGov") ?? "";
    _labAddressCity.text = CacheHelper.getData(key: "_labAddressCity") ?? "";
    _labAddressStreet.text =
        CacheHelper.getData(key: "_labAddressStreet") ?? "";
    isvisible = CacheHelper.getData(key: "laboratory") != null;
    isvisible_scan = CacheHelper.getData(key: "radiology") != null;
    isHomeService = CacheHelper.getData(key: "isHomeService") ?? false;
    isClicked = CacheHelper.getData(key: "isClicked") ?? false;
  }

  @override
  void initState() {
    _fromCached();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.scroll!) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        scroll();
        widget.scroll = false;
      });
    }

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
              controller: scrollController,
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            'اصنع لمعملك \nمستقبل افضل',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Archivo',
                              color: Color.fromARGB(248, 61, 116, 233),
                            ),
                          ),
                          Spacer(),
                          Image(
                            image:
                                AssetImage('assets/images/icons8-like-100.png'),
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'بيانات المالك',
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
                      controller: _userName,
                      decoration: const InputDecoration(
                        labelText: "اسم المالك",
                        hintText: "الاسم",
                        labelStyle:
                            TextStyle(fontSize: 24, color: Colors.black),
                      ),
                      keyboardType: TextInputType.name,
                      onChanged: (value) {
                        CacheHelper.saveData(key: "_userName", value: value);
                      },
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
                    TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(
                        labelText: "البريد الالكتروني",
                        hintText: "البريد",
                        labelStyle:
                            TextStyle(fontSize: 24, color: Colors.black),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        CacheHelper.saveData(key: "_email", value: value);
                      },
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
                      controller: _phone,
                      decoration: const InputDecoration(
                        labelText: " رقم الهاتف",
                        hintText: "رقم",
                        labelStyle:
                            TextStyle(fontSize: 24, color: Colors.black),
                      ),
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        CacheHelper.saveData(key: "_phone", value: value);
                      },
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }

                        // using regular expression
                        if (!RegExp(r'^[0-9]{11}$').hasMatch(value)) {
                          return "Please enter a valid phone number ";
                        }

                        // the email is valid
                        return null;
                      }),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _special,
                      decoration: const InputDecoration(
                        labelText: "التخصص ",
                        hintText: "تخصص",
                        labelStyle:
                            TextStyle(fontSize: 24, color: Colors.black),
                      ),
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        CacheHelper.saveData(key: "_special", value: value);
                      },
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }

                        if (!RegExp(r'^[a-z A-z أ-ي]+$').hasMatch(value)) {
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
                      controller: _address,
                      decoration: const InputDecoration(
                        labelText: "العنوان ",
                        hintText: "عنوان",
                        labelStyle:
                            TextStyle(fontSize: 24, color: Colors.black),
                      ),
                      keyboardType: TextInputType.streetAddress,
                      onChanged: (value) {
                        CacheHelper.saveData(key: "_address", value: value);
                      },
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }

                        if (!RegExp(r'^[a-z A-z أ-ي]+$').hasMatch(value)) {
                          return "Please enter a valid email address";
                        }

                        // the email is valid
                        return null;
                      }),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'كلمة السر',
                        suffixIcon: togglePassword(),
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      controller: _password,
                      obscureText: isSecurePassword,
                      onChanged: (value) {
                        CacheHelper.saveData(key: "_password", value: value);
                      },
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }

                        // if (!RegExp(r'^[أ-ى]|\w|\s+$')
                        //     .hasMatch(value)) {
                        //   return "Please enter a valid  password";
                        // }

                        return null;
                      }),
                    ),
                    /////////////////////////////////////////
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'تأكيد كلمة السر',
                        suffixIcon: togglePassword(),
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      controller: _confirmPassword,
                      obscureText: isSecurePassword,
                      onChanged: (value) {
                        CacheHelper.saveData(
                            key: "_confirmPassword", value: value);
                      },
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'please re-enter your password';
                        }

                        if (!RegExp(r'^[أ-ى]|\w|\s+$').hasMatch(value)) {
                          return "Please enter a valid  password";
                        }
                        if (_password.text != _confirmPassword.text) {
                          return "password not match";
                        }

                        return null;
                      }),
                    ),
                    /////////////////////////////////////////

                    const SizedBox(height: 15),
                    _labData(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  final TextEditingController _labName = TextEditingController();
  final TextEditingController _labPhone = TextEditingController();
  final TextEditingController _labNumOfRegister = TextEditingController();
  final TextEditingController _labAddressGov = TextEditingController();
  final TextEditingController _labAddressCity = TextEditingController();
  final TextEditingController _labAddressStreet = TextEditingController();
  final TextEditingController _labSubTitle = TextEditingController();

  Widget _labData() => Column(
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
            controller: _labName,
            decoration: const InputDecoration(
              labelText: "اسم المعمل",
              hintText: "معمل",
              labelStyle: TextStyle(fontSize: 24, color: Colors.black),
            ),
            keyboardType: TextInputType.text,
            validator: ((value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              if (!RegExp(r'^[a-z A-z أ-ي]+$').hasMatch(value)) {
                return "Please enter a valid  name";
              }
              return null;
            }),
            onChanged: (value) {
              CacheHelper.saveData(key: "_labName", value: value);
            },
          ),
          TextFormField(
            controller: _labSubTitle,
            decoration: const InputDecoration(
              labelText: "وصف المعمل",
              hintText: "مثل دقة عالية..",
              labelStyle: TextStyle(fontSize: 24, color: Colors.black),
            ),
            keyboardType: TextInputType.text,
            onChanged: (value) {
              CacheHelper.saveData(key: "_labSubTitle", value: value);
            },
          ),
          SizedBox(
            key: myWidgetKey,
            height: 30,
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_drop_down_sharp),
                  onPressed: () {
                    setState(() {
                      isClicked = !isClicked;
                      CacheHelper.saveData(key: "isClicked", value: isClicked);
                    });
                  },
                ),
                const Text(
                  'نوع المعمل',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            visible: isClicked,
            child: Column(
              children: [
                // ignore: prefer_const_constructors
                const SizedBox(
                  height: 12,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  isvisible = !isvisible;
                                  isvisible_scan = false;
                                });
                              },
                              child: const Text(
                                'تحاليل',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue),
                              )),
                          Visibility(
                            maintainAnimation: true,
                            maintainSize: true,
                            maintainState: true,
                            visible: isvisible,
                            child: MyClick(
                              text: ' إضافة تحاليل',
                              color: const Color.fromARGB(248, 61, 116, 233),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddTestsScreen(
                                            testTypes: TestTypes,
                                          )),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(
                      //   height: 2,
                      // ),
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  isvisible_scan = !isvisible_scan;
                                  isvisible = false;
                                });
                              },
                              child: const Text(
                                'أشعة',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue),
                              )),
                          Visibility(
                            maintainAnimation: true,
                            maintainSize: true,
                            maintainState: true,
                            visible: isvisible_scan,
                            child: MyClick(
                              text: ' إضافةأشعة',
                              color: const Color.fromARGB(248, 61, 116, 233),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddScansScreen(
                                            scanTypes: scanTypes,
                                          )),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isvisible_scan = true;
                                    isvisible = true;
                                  });
                                },
                                child: const Text(
                                  'أشعة و تحاليل',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue),
                                )),
                          ),
                          const SizedBox(
                            width: 66,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextButton(
                                    onPressed: () {
                                      CacheHelper.removeData(key: "laboratory");
                                      CacheHelper.removeData(key: "radiology");
                                      CacheHelper.removeData(
                                          key: "isCheckedListTest");
                                      CacheHelper.removeData(
                                          key: "isCheckedListScan");
                                      setState(() {
                                        isvisible_scan = false;
                                        isvisible = false;
                                      });
                                    },
                                    child: const Text(
                                      'حذف',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue),
                                    )),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text('العنوان',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
          ),
          TextFormField(
            controller: _labAddressGov,
            decoration: const InputDecoration(
              hintText: 'المحافظة',
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.streetAddress,
            onChanged: (value) {
              CacheHelper.saveData(key: "_labAddressGov", value: value);
            },
            validator: ((value) {
              // Check if this field is empty
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }

              // using regular expression
              if (!RegExp(r'^[أ-ي A-z a-z]+$').hasMatch(value)) {
                return "Please enter a valid email address";
              }

              return null;
            }),
          ),
          TextFormField(
            controller: _labAddressCity,
            decoration: const InputDecoration(
              hintText: 'المدينة',
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.streetAddress,
            onChanged: (value) {
              CacheHelper.saveData(key: "_labAddressCity", value: value);
            },
            validator: ((value) {
              // Check if this field is empty
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }

              // using regular expression
              if (!RegExp(r'^[أ-ي A-z a-z]+$').hasMatch(value)) {
                return "Please enter a valid email address";
              }

              return null;
            }),
          ),
          TextFormField(
            controller: _labAddressStreet,
            decoration: const InputDecoration(
              hintText: 'الشارع',
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.streetAddress,
            onChanged: (value) {
              CacheHelper.saveData(key: "_labAddressStreet", value: value);
            },
            validator: ((value) {
              // Check if this field is empty
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }

              // the email is valid
              return null;
            }),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: _labPhone,
            decoration: const InputDecoration(
              labelText: " رقم الهاتف",
              hintText: "رقم",
              labelStyle: TextStyle(fontSize: 24, color: Colors.black),
            ),
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              CacheHelper.saveData(key: "_labPhone", value: value);
            },
            validator: ((value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }

              // using regular expression
              if (!RegExp(r'^01[1-3,5]{1}[0-9]{7,8}$').hasMatch(value)) {
                return "Please enter a valid phone number ";
              }

              return null;
            }),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text(
                'خدمات منزلية',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
              ),
              trailing: Checkbox(
                checkColor: Colors.white,
                value: isHomeService,
                onChanged: (bool? value) {
                  setState(() {
                    isHomeService = value!;
                    CacheHelper.saveData(key: "isHomeService", value: value);
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
            controller: _labNumOfRegister,
            decoration: const InputDecoration(
              labelText: "رقم التسجيل الضريبي",
              hintText: "تسجيل ضريبي",
              labelStyle: TextStyle(fontSize: 24, color: Colors.black),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              CacheHelper.saveData(key: "_labNumOfRegister", value: value);
            },
            validator: ((value) {
              // Check if this field is empty
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }

              // using regular expression
              if (!RegExp(r'^[\d]+$').hasMatch(value)) {
                return "Please enter a valid email address";
              }

              // the email is valid
              return null;
            }),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            ' ارفق صورة لمعملك',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: 359,
                      width: 268,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(30)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: _image == null
                            ? IconButton(
                                onPressed: () {
                                  getImage();
                                },
                                icon: const Icon(Icons.camera_enhance),
                                color: Colors.red.shade600,
                              )
                            : Image.file(_image!),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          getImage();
                        },
                        child: const Text(
                          'تغيير',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.red),
                        )),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 45),
          BlocProvider(
                  create: (context) => RegisterCubit(),
                  child: BlocConsumer<RegisterCubit, RegisterStates>(
                    listener: (context, state) {
                      if (state is SuccessesCreateOwnerState) {
                        homeOwnerCubit = HomeCubit();
                        profileAdminCubit =ProfileCubit();
                      CacheHelper.clear();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  AdminMain(),
                            ),
                        (route) => false,);
                      }
                    },
                    builder: (context, state) {
                      return condition(
                          condition:state is!LoadingRegisterState,
                        child: TextButton(
                          onPressed: () {
                            bool labList =
                                CacheHelper.getData(key: "laboratory") != null;
                            bool scaList =
                                CacheHelper.getData(key: "radiology") != null;
                            _isValid = formKey.currentState!.validate() &&
                                _image != null &&
                                (labList || scaList);
                            if (_isValid) {
                              _register(context);
                            }
                          },
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(248, 61, 116, 233),
                              foregroundColor: Colors.white),
                          child: const Text('تاكيد بياناتي'),
                        ),
                      );
                    },
                  ),
                ),
          const SizedBox(height: 45),

        ],
      );

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          isSecurePassword = !isSecurePassword;
        });
      },
      icon: isSecurePassword
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
      color: Colors.grey,
    );
  }

  Future<void> _register(context) async {
    labModel = LabModel(
      labName: _labName.text,
      ownerId: "",
      labAddress:
          "${_labAddressGov.text}-${_labAddressCity.text}-${_labAddressStreet.text}",
      labId: "",
      homeService: isHomeService,
      labPhone: _labPhone.text,
      labImage: "",
      subTitle: _labSubTitle.text.isNotEmpty?_labSubTitle.text:"دقة عالية",
      laboratory: await CacheHelper.getData(key: "laboratory"),
      radiology: await CacheHelper.getData(key: "radiology"),
    );

    ownerModel = OwnerLabModel(
      name: _userName.text,
      email: _email.text,
      labId: "",
      uId: "",
      phone: _email.text,
      male: true,
      role: "owner",
      address: _address.text,
      deviceToken: deviceToken,
    );
    print("===================");

    RegisterCubit.get(context).registerNewAccount(
        email: _email.text,
        password: _password.text,
        isOwner: true,
        image: _image);
  }
}
