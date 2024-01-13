// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'package:jiffy/jiffy.dart';

import '../../models/person.dart';
import '../../shared/components/constants.dart';
import 'app_images.dart';
import 'chat_item.dart';


class ChatsScreen extends StatefulWidget {
  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  List<String> personIds = [];
  List<Person> person=[];

  bool isEmpty=false;
  String from='patient';
  String to='labs';
  String myDocId=myId!;


  @override
  void initState() {
    _checkFromTo();
    _getPersonsIds();
    super.initState();
  }

  void _checkFromTo(){
    if(isLab()) {
      from='labs';
      to='patient';
      myDocId=labModel!.labId;
    }
    else{
      from='patient';
      to='labs';
      myDocId=myId!;
    }

  }
  void _getPersonsIds(){
    personIds=[];
    FirebaseFirestore.instance
        .collection(from)
        .doc(myDocId)
        .collection('chats')
        .snapshots()
        .listen((event) {
          for (var element in event.docs) {
            personIds.add(element.id);
          }
          _getPersons(personIds);
    });

  }
void _getPersons(List<String> personIds){
    print("===$from========$to===============$myDocId==============");
    print("===$from========$to===============$myDocId==============");
  FirebaseFirestore.instance
      .collection(to)
      .get()
      .then((value) {
        person=[];///
        if(to=="patient") {
          for (var doc in value.docs) {
      if (personIds.contains("${doc.id}")) {
        person.add(Person.fromPatientJson(doc.data()));
      }
    }
        }
        if(to=="labs"){
          for (var doc in value.docs) {
            if (personIds.contains(doc.id)) {
              person.add(Person.fromLabJson(doc.data()));
            }
          }
        }

    if(person.isEmpty){
      isEmpty=true;
    }
    setState(() {});
  });
}

  @override
  Widget build(BuildContext context) {
    print("==$from============$to============$myDocId=================================");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("الرسائل",style: TextStyle(color: Colors.white,fontSize: 25)),
        backgroundColor: Colors.blue.shade800,
        leading: IconButton(
          onPressed: (){
           Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ConditionalBuilder(
        condition: person.isNotEmpty,
        builder:(context) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index)=>streamBuildChatItem(context, person[index]),
              separatorBuilder: (context, index) => SizedBox(
              height: 20,
            ),
            itemCount: person.length,
          ),
        ),
        fallback:(context) =>Center(
            child: isEmpty?Text('Empty'): CircularProgressIndicator(),
        ),
      ),
    );
  }

bool isLab(){
  if (patientModel !=null&&patientModel!.uId==myId) {
  return false;
  }
  else if(labModel!=null&&ownerModel!.uId==myId) {
    return true;
  }else{
    throw Exception();
  }

  }

  Widget streamBuildChatItem(context,Person person) {

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatItemScreen(person),));
      },
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(from)
            .doc(myDocId)
            .collection('chats')
            .doc(person.uId)
            .collection("messages")
            .where('senderId', isEqualTo: person.uId)
            .snapshots(),
        builder: (context, snapshot) {
          String text = '';
          String lastTime = '';
          int last = 0;
          if (snapshot.hasData) {
            for (var element in snapshot.data!.docs) {
              if (element.data().isNotEmpty) {
                if (int.parse(element.data()['indexMessage'].toString()) >= last) {
                  lastTime=Jiffy().from(Jiffy(element.data()['dateTime'], 'EEEE, MMMM d, yyyy h:mm a'));
                  text = element
                      .data()['text']
                      .toString()
                      .substring(0, element.data()['text'].toString().length);
                  last = int.parse(element.data()['indexMessage'].toString());
                }
              }
            }
          }
          return buildChatItem(context, person, text, lastTime);
        },
      ),
    );
  }

  Widget buildChatItem(context, person, String text, String lastTime) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.cyan.shade800,
            radius: 35.0,
            child: ClipOval(
              child: person.image!=null
              ?CachedNetworkImage(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                imageUrl: person.image!,
                errorWidget: (context, url, error) => Image.asset(
                  AppImages.profile,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
                  :Image.asset(AppImages.profile,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    person.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          text,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      if (lastTime.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          child: Container(
                            height: 8.0,
                            width: 8.0,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      Text(

                        lastTime,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
