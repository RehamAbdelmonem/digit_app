import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/components/componants.dart';
import 'package:graduation_project/screens/auth/signup/register_cubit/register_states.dart';

import '../../../../models/patientModel.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/network/local/cache_helper.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(InitializeRegisterState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  void changeVisibility() {
    isPassword = !isPassword;
    emit(ChangeVisibilityState());
  }
  bool isMale=true;
  void changeGender(bool gender) {
    isMale = gender;
    emit(ChangeGenderState());
  }


  void registerNewAccount({
    required String email,
    required String password,
    required bool isOwner,
     File? image,
  }) {
    emit(LoadingRegisterState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      if(isOwner){
        myId=value.user!.uid;
        CacheHelper.saveData(key: "myId", value: myId);
        ownerModel!.uId=value.user!.uid;
        labModel!.ownerId=myId!;
        labModel!.labId=myId!.substring(0,(myId!.length/2).ceil());
        ownerModel!.labId=labModel!.labId;
        if(image!=null) {
          uploadImage(image);
        }else{
          createLab();
        }
      }
      else{
      myId=value.user!.uid;
      patientModel!.uId=value.user!.uid;
      CacheHelper.saveData(key: "myId", value: myId);
      createPatient();
      }

    }).catchError((error) {
      showToast(message: error.message.toString(), state: ToastState.error);
      emit(ErrorRegisterState(error.toString()));
    });
  }


  void createPatient() {
    FirebaseFirestore.instance
        .collection("patient")
        .doc(myId)
        .set(patientModel!.toMaP())
        .then((value){
      emit(SuccessesCreateUserState());
    }).catchError((error){
      showToast(message: error.message.toString(), state: ToastState.error);
      emit(ErrorCreateUserState(error.toString()));
    });

  }

  void createOwner() {
    FirebaseFirestore.instance
        .collection("owner").doc(myId)
        .set(ownerModel!.toMaP())
        .then((value){
      emit(SuccessesCreateOwnerState());
    }).catchError((error){
      emit(ErrorCreateOwnerState(error.toString()));
    });

  }
  void createLab() {
    FirebaseFirestore.instance
        .collection("labs")
        .doc(labModel!.labId)
        .set(labModel!.toMaP())
        .then((value){
      createLabRating();
      emit(SuccessesCreateLabState());
    }).catchError((error){
      print(error.toString());
      emit(ErrorCreateLabState(error.toString()));
    });

  }

  void createLabRating() {
    FirebaseFirestore.instance
        .collection("labs")
        .doc(labModel!.labId)
        .collection("rating")
        .add({"rate":0}).then((value){
      createOwner();
      emit(SuccessesCreateLabRatingState());
    });
  }


  Future<void> uploadImage(File? image) async {
    await firebase_storage.FirebaseStorage.instance
        .ref()
        .child('data/$myId/${Uri.file(image!.path).pathSegments.last}')
        .putFile(image)
        .then((value) async {
      await value.ref.getDownloadURL().then((value) async {
        labModel!.labImage=value;
        createLab();
        emit(UploadImageSuccessState());
      }).catchError((error) {
        emit(UploadImageErrorState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(UploadImageErrorState());
    });
  }


  List<bool> choose=[true,false,false];
  void chooseStatus(int index){
    choose=[false,false,false];
    choose[index]=true;
    emit(ChooseStatusState());
  }

}
