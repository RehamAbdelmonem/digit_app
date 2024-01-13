import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/admin/conversationList.dart';
import 'package:graduation_project/widgets/admin/searchfield.dart';
import 'package:graduation_project/models/admin/ChatUsersModel.dart';

class ChatPageUser extends StatefulWidget {
  @override
  State<ChatPageUser> createState() => _ChatPageUserState();
}

class _ChatPageUserState extends State<ChatPageUser> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: " المختبر",
        messageText: " ..... ",
        imageURL: "assets/images/image1.png",
        time: "Now"),
    ChatUsers(
        name: " البرج",
        messageText: ".....",
        imageURL: "assets/images/image1.png",
        time: "Yesterday"),
    ChatUsers(
        name: " الفؤاد",
        messageText: " ....... ",
        imageURL: "assets/images/image1.png",
        time: "31 Mar"),
    ChatUsers(
        name: " سما سكان",
        messageText: "..........",
        imageURL: "assets/images/image1.png",
        time: "Now"),
         ChatUsers(
        name: " المختبر",
        messageText: " ..... ",
        imageURL: "assets/images/image1.png",
        time: "Now"),
    ChatUsers(
        name: " البرج",
        messageText: ".....",
        imageURL: "assets/images/image1.png",
        time: "Yesterday"),
    ChatUsers(
        name: " الفؤاد",
        messageText: " ....... ",
        imageURL: "assets/images/image1.png",
        time: "31 Mar"),
    ChatUsers(
        name: " سما سكان",
        messageText: "..........",
        imageURL: "assets/images/image1.png",
        time: "Now"),
    
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final color = Colors.black12;
    const iconcolor = Colors.black;
    const textcolor = Colors.black;
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
                        ' الرسائل',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
           
                  ])),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  searchField(size, color, iconcolor, textcolor),
                  ListView.builder(
                    itemCount: chatUsers.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 16),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return MyConversationList(
                        name: chatUsers[index].name,
                        messageText: chatUsers[index].messageText,
                        imageUrl: chatUsers[index].imageURL,
                        time: chatUsers[index].time,
                        isMessageRead:
                            (index == 0 || index == 3) ? true : false,
                      );
                    },
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
