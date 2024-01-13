import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/componants.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/network/local/cache_helper.dart';
import 'login_states.dart';

 class LoginCubit extends Cubit<LoginStates>{
   LoginCubit():super(InitializeLoginState());
   static LoginCubit get(context)=>BlocProvider.of(context);

   bool isPassword=true;
   void changeVisibility(){
     isPassword=!isPassword;
     emit(ChangeVisibilityState());
   }
   void login({
     required String email,
     required String password,
     required bool isPatient,
   }) {
     emit(LoadingLoginState());
     FirebaseAuth.instance.signInWithEmailAndPassword(
       email: email,
       password: password,
     ).then((value) {
       myId=value.user!.uid;
       if(isPatient) {
         FirebaseFirestore.instance
           .collection("patient")
       .where("uId",isEqualTo: myId)
       .get()
       .then((value){
         if(value.size>0) {
           CacheHelper.saveData(key: "myId", value: myId).then((value){
           emit(SuccessesLoginState());
         });
         }  else{
            showToast(message: "This Email Use as Owner No as Patient", state: ToastState.warning);
            emit(ErrorLoginState("error"));

         }
       });
         
       }
       else{
         FirebaseFirestore.instance
             .collection("owner")
             .where("uId",isEqualTo: myId)
             .get()
             .then((value){
           if(value.size>0) {
             CacheHelper.saveData(key: "myId", value: myId).then((value){
               emit(SuccessesLoginState());
             });
           }  else{
             showToast(message: "This Email Use as Patient No as Owner", state: ToastState.warning);
             emit(ErrorLoginState("error"));

           }
         });
       }
         }).catchError((error){
       showToast(message: error.message.toString(), state: ToastState.error);
       emit(ErrorLoginState(error.toString()));
     });
   }

   bool forgotPassword=false;
   void changeForgotPassword(){
     forgotPassword=!forgotPassword;
     emit(LoginChangeForgotPasswordState());

   }

   void resetPassword({
   required String email,
 }){
     FirebaseAuth.instance.sendPasswordResetEmail(email:email).then((value){
       emit(LoginResetPasswordSuccessState());

     }).catchError((error){
       emit(LoginResetPasswordErrorState(error.toString().split(']')[1]));
     });
   }


void jumpTo(){
     emit(JumpToState());
}


 }