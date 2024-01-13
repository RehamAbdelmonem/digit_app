import 'package:flutter/material.dart';

class TestOfLabScreen extends StatefulWidget {
  final List<String> typeOfLabs;

  const TestOfLabScreen({
    Key? key,
    required this.typeOfLabs,
  }) : super(key: key);

  @override
  State<TestOfLabScreen> createState() => _TestOfLabScreenState();
}

class _TestOfLabScreenState extends State<TestOfLabScreen> {
  final TextEditingController _searchController=TextEditingController();

  List<String> searchList=[];
  void _search(){
    _searchController.addListener(() {
      searchList=[];
      searchList=List.from(widget.typeOfLabs.where((element) => element
          .toLowerCase()
          .contains(
          _searchController.text)));
      setState(() {

      });
    });

  }

  @override
  Widget build(BuildContext context) {
    _search();
    return Scaffold(
      appBar: AppBar(
        title: const Text('تحاليل المعمل '),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: Colors.blue.shade900.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child:  TextFormField(
              controller: _searchController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  icon: Icon(Icons.search),
                  hintText: 'بحث',
                  hintStyle: TextStyle(color: Colors.black, fontSize: 20)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchList.isEmpty
                  ? widget.typeOfLabs.length
              :searchList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    searchList.isEmpty
                        ? widget.typeOfLabs[index]
                    :searchList[index],
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



  //Rehaaaaaaaaaam


  //TestOfLabScreen 
  //appbar( تحاليل المعمل ) => دي شاشة المستخدم بيشوف التحاليل المتاحه في المعمل 


  // (///////  Backend needed for this screen  ////////)
  //1) المفروض  التحاليل دي تيجي من داتا المعمل   


  //3) model name => testOFlab => ( دا اللي فيه  بيانات أنواع التحاليل  )

