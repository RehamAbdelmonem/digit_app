import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/admin/conversationList.dart';
import 'package:graduation_project/widgets/admin/searchfield.dart';
import 'package:graduation_project/models/admin/ChatUsersModel.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "سلمي رافت",
        messageText: "التقارير وصلت ",
        imageURL: "assets/images/image1.png",
        time: "Now"),
    ChatUsers(
        name: "ريهام عبدالمنعم",
        messageText: "تمام",
        imageURL: "assets/images/image1.png",
        time: "Yesterday"),
    ChatUsers(
        name: "رضوي جمال",
        messageText: "التحاليل هتوصل امتي؟",
        imageURL: "assets/images/image1.png",
        time: "31 Mar"),
    ChatUsers(
        name: "ايمان السيد",
        messageText: "العرض حلو جدا",
        imageURL: "assets/images/image1.png",
        time: "Now"),
    ChatUsers(
        name: "سهيلة جمال",
        messageText: "التقارير تمام",
        imageURL: "assets/images/image1.png",
        time: "Yesterday"),
    ChatUsers(
        name: "ندي عبدالمنعم",
        messageText: "تمام",
        imageURL: "assets/images/image1.png",
        time: "28 Mar"),
    ChatUsers(
        name: "احمد طه",
        messageText: "تمام",
        imageURL: "assets/images/image1.png",
        time: "23 Mar"),
    ChatUsers(
        name: "احمد طه",
        messageText: "تمام",
        imageURL: "assets/images/image1.png",
        time: "23 Mar"),
    ChatUsers(
        name: "احمد طه",
        messageText: "تمام",
        imageURL: "assets/images/image1.png",
        time: "23 Mar"),
     ChatUsers(
        name: "احمد طه",
        messageText: "تمام",
        imageURL: "assets/images/image1.png",
        time: "23 Mar"),
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
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 75.0),
                      child: Text(
                        ' الرسائل',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 75.0),
                    //   child: Container(
                    //     padding: const EdgeInsets.only(
                    //         left: 8, right: 8, top: 2, bottom: 2),
                    //     height: 38,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(30),
                    //       color: Colors.black12,
                    //     ),
                    //     child: Row(
                    //       children: <Widget>[
                    //         IconButton(
                    //           onPressed: () {},
                    //           icon: const Icon(Icons.add,
                    //               color: Colors.pink, size: 20),
                    //         ),
                    //         const Text(
                    //           "اضافة",
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontSize: 14,
                    //               fontWeight: FontWeight.bold),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // )
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
                      return ConversationList(
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
