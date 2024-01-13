import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/user.dart';
import 'package:graduation_project/screens/profile/ProfileScreen.dart';
import 'package:graduation_project/screens/profile/UpdateProfileScreen.dart';
import 'package:graduation_project/screens/profile/cubit/profile_cubit.dart';
import 'package:graduation_project/screens/profile/cubit/profile_cubit.dart';
import 'package:graduation_project/screens/profile/cubit/profile_state.dart';
import 'package:graduation_project/shared/components/constants.dart';
import 'package:graduation_project/shared/components/constants.dart';
import 'package:graduation_project/shared/components/constants.dart';
import 'package:graduation_project/shared/components/constants.dart';
import 'package:graduation_project/shared/components/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class DetailsInfo extends StatelessWidget {
  const DetailsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text(
          ' المعلومات الشخصية',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: BlocProvider.value(
            value:profileCubit,
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: patientModel!.image != null
                                ? CachedNetworkImage(
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    imageUrl: patientModel!.image!,
                                    errorWidget: (context, url, error) =>
                                        const Image(
                                      image: AssetImage(
                                          'assets/images/ProfileImage.png'),
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const Image(
                                    image: AssetImage(
                                        'assets/images/ProfileImage.png')),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    InputDecorator(
                      decoration: InputDecoration(
                          labelText: 'الاسم',
                          labelStyle: const TextStyle(
                              color: Colors.black, fontSize: 27),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                                width: 2, color: Colors.blue.shade900),
                          ),
                          prefixIcon: const Icon(LineAwesomeIcons.user)),
                      child: Text(
                        patientModel!.name,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    InputDecorator(
                      decoration: InputDecoration(
                          labelText: 'البريد الإلكتروني',
                          labelStyle: const TextStyle(
                              color: Colors.black, fontSize: 27),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                                width: 2, color: Colors.blue.shade900),
                          ),
                          prefixIcon: const Icon(LineAwesomeIcons.envelope_1)),
                      child: Text(
                        patientModel!.email,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    InputDecorator(
                      decoration: InputDecoration(
                          labelText: 'الهاتف',
                          labelStyle: const TextStyle(
                              color: Colors.black, fontSize: 27),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                                width: 2, color: Colors.blue.shade900),
                          ),
                          prefixIcon: const Icon(LineAwesomeIcons.phone)),
                      child: Text(
                        patientModel!.phone,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    InputDecorator(
                      decoration: InputDecoration(
                          labelText: 'العنوان',
                          labelStyle: const TextStyle(
                              color: Colors.black, fontSize: 27),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                                width: 2, color: Colors.blue.shade900),
                          ),
                          prefixIcon:
                              const Icon(LineAwesomeIcons.location_arrow)),
                      child: Text(
                        patientModel!.address,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UpdateProfileScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade900,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text(
                          'تعديل البيانات',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

//Rehaaaaaaaaaam
