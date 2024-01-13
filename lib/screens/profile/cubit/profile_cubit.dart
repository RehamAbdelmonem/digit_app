import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/owner_model.dart';
import 'package:graduation_project/models/patientModel.dart';
import 'package:graduation_project/screens/profile/cubit/profile_state.dart';
import 'package:graduation_project/shared/components/constants.dart';
import 'package:async/async.dart';
import '../../../shared/network/local/cache_helper.dart';



class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);

  Future<void> getOwnerProfileData() async {
    await FirebaseFirestore.instance.collection("owner")
        .doc(myId)
        .get()
        .then((value) {
            ownerModel = OwnerLabModel.fromJson(value.data()!);
            CacheHelper.saveData(key: "role", value: ownerModel!.role);
            emit(ProfileGetOwnerDataSuccess());
            getLabData();
    }).catchError((error){
      emit(ProfileGetOwnerDataError());
    });



  }

  Future<void> getPatientProfileData() async {
    if(myId!=null) {
      await FirebaseFirestore.instance.collection("patient")
        .doc(myId)
        .get()
        .then((value) {
        patientModel = UserModel.fromJson(value.data()!);
        CacheHelper.saveData(key: "role", value: patientModel!.role);
      emit(ProfileGetPatientDataSuccess());
    }).catchError((error){
      emit(ProfileGetPatientDataError());
    });
    }



  }

  Future<void> updatePatientProfileData() async {
    await FirebaseFirestore.instance.collection("patient")
        .doc(myId)
        .update(patientModel!.toMaP())
        .then((value) async {
          await getPatientProfileData();
      emit(ProfileUpdatePatientDataSuccess());
    });


  }

  Future<void> updateLabProfileData() async {
    await FirebaseFirestore.instance.collection("labs")
        .doc(labModel!.labId)
        .update(labModel!.toMaP())
        .then((value) async {
           await getLabData();
      emit(ProfileUpdateLabDataSuccess());
    });


  }


  Future<void> getLabData() async {

   await FirebaseFirestore.instance.collection("labs")
        .doc(ownerModel!.labId)
        .get()
        .then((value) {
      labModel = LabModel.fromJson(value.data()!);
      emit(ProfileGetLapDataSuccess());
    });
  }

  CancelableOperation? operation;


  @override
  Future<void> close() {
    operation = CancelableOperation.fromFuture(uploadImage(null));
    operation?.cancel();
    return super.close();
  }

  Future<void> uploadImage(File? image) async {
if(image!=null) {
  await firebase_storage.FirebaseStorage.instance
        .ref()
        .child('data/$myId/${Uri.file(image!.path).pathSegments.last}')
        .putFile(image)
        .then((value) async {
      await value.ref.getDownloadURL().then((value) async {
        if(patientModel!=null) {
          patientModel!.image = value;
          await updatePatientProfileData();
        }else{
          labModel!.labImage=value;
          await updateLabProfileData();
        }
        emit(UploadImageSuccessState());
      });
    });
}
  }



}
