import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/user.dart';
import 'package:graduation_project/screens/profile/UpdateProfileScreen.dart';
import 'package:graduation_project/screens/profile/cubit/profile_cubit.dart';
import 'package:graduation_project/screens/profile/cubit/profile_state.dart';
import 'package:graduation_project/shared/components/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../screens/profile/ProfileScreen.dart';

class UpdateProfilebody extends StatefulWidget {
  UpdateProfilebody({
    super.key,
  });

  @override
  State<UpdateProfilebody> createState() => _UpdateProfilebodyState();
}

class _UpdateProfilebodyState extends State<UpdateProfilebody> {
  TextEditingController userName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();


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
    userName.text=patientModel!.name;
    email.text=patientModel!.email;
    address.text=patientModel!.address;
    phone.text=patientModel!.phone;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            if(uploadImage)
            const LinearProgressIndicator(),
            Stack(
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
                              imageUrl: patientModel!.image!,
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
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: userName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)),
                  prefixIconColor: Colors.blue.shade900,
                  floatingLabelStyle: TextStyle(color: Colors.blue.shade900),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide:
                          BorderSide(width: 2, color: Colors.blue.shade900)),
                  label: const Text("الاسم"),
                  prefixIcon: const Icon(LineAwesomeIcons.user)),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              enabled: false,
              controller: email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)),
                  prefixIconColor: Colors.blue.shade900,
                  floatingLabelStyle: TextStyle(color: Colors.blue.shade900),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide:
                          BorderSide(width: 2, color: Colors.blue.shade900)),
                  label: const Text("الابريد الالكتروني"),
                  prefixIcon: const Icon(LineAwesomeIcons.envelope_1)),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)),
                  prefixIconColor: Colors.blue.shade900,
                  floatingLabelStyle: TextStyle(color: Colors.blue.shade900),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide:
                          BorderSide(width: 2, color: Colors.blue.shade900)),
                  label: const Text("الهاتف"),
                  prefixIcon: const Icon(LineAwesomeIcons.phone)),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: address,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)),
                  prefixIconColor: Colors.blue.shade900,
                  floatingLabelStyle: TextStyle(color: Colors.blue.shade900),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide:
                          BorderSide(width: 2, color: Colors.blue.shade900)),
                  label: const Text("العنوان"),
                  prefixIcon: const Icon(LineAwesomeIcons.location_arrow)),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 200,
              height: 40,
              child: BlocProvider.value(
                value:  profileCubit,
                child: BlocConsumer<ProfileCubit, ProfileState>(
                  listener: (context, state) async {
                    if(state is ProfileGetPatientDataSuccess){
                      Navigator.pop(
                        context,);
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        patientModel!.name = userName.text;
                        patientModel!.phone = phone.text;
                        patientModel!.address = address.text;
                        setState(() {
                          uploadImage=true;
                        });
                        if (_image != null) {
                          ProfileCubit.get(context)
                              .uploadImage(_image);
                        } else {
                          ProfileCubit.get(context)
                              .updatePatientProfileData();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade900,
                          side: BorderSide.none,
                          shape: const StadiumBorder()),
                      child: const Text(
                        'حفظ البيانات',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
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

//Rehaaaaaaaaaam
