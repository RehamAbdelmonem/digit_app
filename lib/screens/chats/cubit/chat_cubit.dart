import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiffy/jiffy.dart';
import 'package:meta/meta.dart';

import '../../../models/message_model.dart';
import '../../../shared/components/constants.dart';


part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  static ChatCubit get(context)=>BlocProvider.of(context);
  void typing(){
    emit(ChatTypingState());
  }

@override
  Future<void> close() {
  if (patientModel !=null&&patientModel!.uId==myId) {
    streamPatientMessage.cancel();
  }
  else if(labModel!=null&&ownerModel!.uId==myId) {
    streamOwnerMessage.cancel();
  }
return super.close();
  }


  void typeComment(){
    emit(CommentTypingState());
  }

  void sendMessage({
    required String receiverId,
    required String text ,
    String? image,
  }){
    MessageModel message=MessageModel(
      senderId: myId!,
      text: text,
      dateTime: Jiffy().yMMMMEEEEdjm,
      receiverId: receiverId,
      indexMessage:messages.length,
      image: image,

    );
    if (patientModel !=null&&patientModel!.uId==myId) {
      patientToLab(receiverId,message);
    }
    else if(labModel!=null&&ownerModel!.uId==myId) {
      labToPatient(receiverId,message);
    }
  }

  Future<void> patientToLab(String labId,MessageModel message) async {
    await FirebaseFirestore.instance
        .collection("patient")
        .doc(myId)
        .collection("chats")
        .doc(labId)
        .collection("messages")
        .add(message.toMap()).then((value){
      emit(SendMessageSuccessState());

    });

    await FirebaseFirestore.instance
        .collection("labs")
        .doc(labId)
        .collection("chats")
        .doc(myId)
        .collection("messages")
        .add(message.toMap()).then((value){
      emit(SendMessageSuccessState());

    });
  }

  Future<void> labToPatient(String patientId,MessageModel message) async {
    await FirebaseFirestore.instance
        .collection("labs")
        .doc(labModel!.labId)
        .collection("chats")
        .doc(patientId)
        .collection("messages")
        .add(message.toMap()).then((value){
      emit(SendMessageSuccessState());

    });

    await FirebaseFirestore.instance
        .collection("patient")
        .doc(patientId)
        .collection("chats")
        .doc(labModel!.labId)
        .collection("messages")
        .add(message.toMap()).then((value){
      emit(SendMessageSuccessState());

    });
  }



  String friendId='';
  List<MessageModel> messages=[];
  late StreamSubscription<QuerySnapshot> streamPatientMessage;
  late StreamSubscription<QuerySnapshot> streamOwnerMessage;

 void getMessage(String sederId){

   if (patientModel !=null&&patientModel!.uId==myId) {
     fromPatient(sederId);
   }
   else if(labModel!=null&&ownerModel!.uId==myId) {
     fromLab(sederId);
   }


  }

 void fromPatient(String labId){
      streamPatientMessage= FirebaseFirestore.instance
        .collection("patient")
        .doc(myId)
        .collection('chats')
        .doc(labId)
        .collection('messages')
        .orderBy('indexMessage')
        .snapshots()
        .listen((event) {
      messages=[];
      for (var messageId in event.docs) {
        messages.add(MessageModel.fromJson(messageId.data()));
      }
      emit(ReceiveMessageSuccessState());
    });

  }
 void fromLab(String patientId){

   streamOwnerMessage= FirebaseFirestore.instance
        .collection("labs")
        .doc(labModel!.labId)
        .collection('chats')
        .doc(patientId)
        .collection('messages')
        .orderBy('indexMessage')
        .snapshots()
        .listen((event) {
      messages=[];
      for (var messageId in event.docs) {
        messages.add(MessageModel.fromJson(messageId.data()));
      }
      emit(ReceiveMessageSuccessState());
    });

  }

  final picker = ImagePicker();
  File? chatImage;

  Future getChatImage(isGallery) async {
    ImageSource source;
    if (isGallery) {
      source = ImageSource.gallery;
    } else {
      source = ImageSource.camera;
    }
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      chatImage = File(pickedFile.path);
      emit(ChatGetImageSuccessState());
    } else {
      print('no image selected');
      emit(ChatGetImageErrorState());
    }
  }

  bool isUploadChatImageCompleted=true;
  void uploadChatImage({
    required String receiverId,
    String? text,
  }) {
    isUploadChatImageCompleted=false;
    emit(ChatUploadImageLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('chats/${Uri
        .file(chatImage!.path)
        .pathSegments
        .last}')
        .putFile(chatImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        sendMessage(
          receiverId: receiverId,
          text: text!,
          image: value,
        );
        chatImage=null;
        isUploadChatImageCompleted=true;
        emit(ChatUploadImageSuccessState());
      }).catchError((error) {
        emit(ChatUploadImageErrorState());
      });
    }).catchError((error) {
      emit(ChatUploadImageErrorState());
    });
  }

  void removeChatImage(){
    chatImage=null;
    emit(ChatRemoveImageState());
  }
}
