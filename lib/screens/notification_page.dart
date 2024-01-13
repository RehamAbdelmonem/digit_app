import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:graduation_project/widgets/admin/listwidget.dart';
import 'package:graduation_project/models/admin/ModelClass.dart';

class MyNotificationPage extends StatefulWidget {
  const MyNotificationPage({Key? key}) : super(key: key);

  @override
  State<MyNotificationPage> createState() => _MyNotificationPage();
}

class _MyNotificationPage extends State<MyNotificationPage> {
  List<Result> result = [];
  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var responsedata = await http
        .get(Uri.parse("https://pokeapi.co/api/v2/pokemon?offset=0&limit=10"));
    print(responsedata.body);
    ListModel modelclass = ListModel.fromJson(jsonDecode(responsedata.body));
    result = result + modelclass.results;
    setState(() {
      result;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'الإشعارات',
                style: TextStyle(fontFamily: 'Archivo', color: Colors.white),
              ),
              backgroundColor: Colors.blue.shade800,
            ),
            //drawer: const NaviationDrawer(),//////////////////////////////////
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 10,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: result.length,
                      itemBuilder: (context, index) {
                        return MyList(
                          child: result[index],
                          icon: Icon(
                            Icons.notifications_none_outlined,
                            color: Colors.blue.shade800,
                          ),
                          color: Colors.amberAccent,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// class NaviationDrawer extends StatelessWidget {
//   const NaviationDrawer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) => Drawer(
//     child: SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           buildHearder(context),
//           buildMenuItem(context),
//         ]),
//     ),  
//     );
//     Widget buildHearder(BuildContext context)=>Container(
//       padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
//     );
//     Widget buildMenuItem(BuildContext context)=>Container(
//       padding: EdgeInsets.all(24),
//       child: Wrap(
//         runSpacing: 16,
//         children: [
//           ListTile(
//             leading: Icon(Icons.home_outlined,color: Colors.grey.shade100) ,
//             title: Text('home'),
//             onTap: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const Aprofile(),
//             )),
//           ),
//           ListTile(
//             leading: Icon(Icons.person_outline,color: Colors.grey.shade100) ,
//             title: Text('profile'),
//             onTap: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const Aprofile(),
//             )),
//           ),
//           ListTile(
//             leading: Icon(Icons.home_outlined,color: Colors.grey.shade100) ,
//             title: Text('services'),
//             onTap: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const Aprofile(),
//             )),
//           ),
//           ListTile(
//             leading: Icon(Icons.mail_outline,color: Colors.grey.shade100) ,
//             title: Text('reqests'),
//             onTap: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const Aprofile(),
//             )),
//           ),
//           Divider(color: Colors.black54,),
//           ListTile(
//             leading: Icon(Icons.delete,color: Colors.grey.shade100) ,
//             title: Text('trash'),
//             onTap: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const Aprofile(),
//             )),
//           ),
//         ],
//       ),
//     );
// }
