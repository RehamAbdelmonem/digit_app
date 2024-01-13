import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/screens/profile/ProfileScreen.dart';
import 'package:graduation_project/screens/profile/cubit/profile_cubit.dart';
import 'package:graduation_project/screens/profile/cubit/profile_state.dart';
import 'package:graduation_project/shared/components/constants.dart';
import 'package:graduation_project/shared/components/constants.dart';
import 'package:graduation_project/shared/components/constants.dart';
import 'package:graduation_project/shared/components/constants.dart';
import 'package:image_picker/image_picker.dart';

class AdminUpdateProfile extends StatefulWidget {
  const AdminUpdateProfile({Key? key}) : super(key: key);

  @override
  State<AdminUpdateProfile> createState() => _AdminUpdateProfileState();
}

class _AdminUpdateProfileState extends State<AdminUpdateProfile> {

  TextEditingController labName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  bool isObSecurePassword = true;

  File? _image;

  final imagePicker = ImagePicker();
  bool uploadImage=false;
  Future getImage(bool fromCamera) async {
    if (fromCamera) {
      final image = await imagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        if (image != null) {
          _image = File(image.path);
        }
      });
    } else {
      final image = await imagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (image != null) {
          _image = File(image.path);
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    labName.text=labModel!.labName;
    address.text=labModel!.labAddress;
    phone.text=labModel!.labPhone;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue.shade900,
              automaticallyImplyLeading: false,
              flexibleSpace: SafeArea(
                  child: Container(
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
                      'الصفحة الشخصية',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ]),
              )),
            ),
            body: Container(
              padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: ListView(
                  children: [
                    if(uploadImage)
                      const LinearProgressIndicator(),
                    Center(
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.blue,
                            child: CircleAvatar(
                              radius: 67.0,
                              child: ClipOval(
                                child: _image == null
                                    ? CachedNetworkImage(
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                  imageUrl: labModel!.labImage,
                                  errorWidget: (context, url, error) => Image.asset(
                                    'assets/images/ProfileImage.png',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                )
                                    : Image.file(
                                  _image!,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          addPic(context),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: labName,
                      keyboardType: TextInputType.text,
                      decoration:  InputDecoration(
                          labelText: "اسم المعمل",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          hintStyle: const TextStyle(
                              color: Colors.grey, fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: phone,
                      keyboardType: TextInputType.phone,
                      decoration:  InputDecoration(
                          labelText: "الرقم",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          hintStyle: const TextStyle(
                              color: Colors.grey, fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: address,
                      keyboardType: TextInputType.phone,
                      decoration:  InputDecoration(
                          labelText: "العنوان",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          hintStyle: const TextStyle(
                              color: Colors.grey, fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.black12,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: const Text(
                            'الغاء',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15,),
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: BlocProvider.value(
                              value:  profileCubit,
                              child: BlocConsumer<ProfileCubit, ProfileState>(
                                listener: (context, state) async {
                                  if(state is ProfileGetLapDataSuccess){
                                    Navigator.pop(context);
                                  }
                                },
                                builder: (context, state) {
                                  return ElevatedButton(
                                    onPressed: () {
                                      labModel!.labName = labName.text;
                                      labModel!.labPhone = phone.text;
                                      labModel!.labAddress = address.text;
                                      setState(() {
                                        uploadImage=true;
                                      });
                                      if (_image != null) {
                                        ProfileCubit.get(context)
                                            .uploadImage(_image);
                                      } else {
                                        ProfileCubit.get(context)
                                            .updateLabProfileData();
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue.shade900,
                                        side: BorderSide.none,
                                        shape: const StadiumBorder()),
                                    child: const Text(
                                      'حفظ',
                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }


  Widget addPic(
      context,
      ) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
            radius: 16.0,
            backgroundColor: Colors.blue,
            child: IconButton(
                color: Colors.white,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(.9),
                      shadowColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(
                          color: Theme.of(context).iconTheme.color!,
                        ),
                      ),
                      actionsOverflowAlignment: OverflowBarAlignment.center,
                      actionsPadding: const EdgeInsets.all(20.0),
                      elevation: 20.0,
                      title: Text(
                        'Choose Source :',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        OutlinedButton(
                          child: Row(
                            children: [
                              Icon(
                                Icons.photo,
                                color: Theme.of(context).iconTheme.color!,
                              ),
                              const SizedBox(
                                width: 30.0,
                              ),
                              Text(
                                "From Gallery",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          onPressed: () {
                            getImage(false);
                            Navigator.pop(context);
                          },
                        ),
                        OutlinedButton(
                          child: Row(
                            children: [
                              Icon(
                                Icons.camera_alt,
                                color: Theme.of(context).iconTheme.color!,
                              ),
                              const SizedBox(
                                width: 30.0,
                              ),
                              Text(
                                "From Camera",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          onPressed: () {
                            getImage(true);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.white,
                  size: 16.0,
                ))),
      );


}
