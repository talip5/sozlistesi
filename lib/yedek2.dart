import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//import 'package:flutter_listtile_demo/model/listtilemodel.dart';
import 'models/checkBoxListTileModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: CheckBoxListTileDemo(),
  ));
}

class CheckBoxListTileDemo extends StatefulWidget {

  @override
  CheckBoxListTileDemoState createState() => new CheckBoxListTileDemoState();
}

class CheckBoxListTileDemoState extends State<CheckBoxListTileDemo> {
  String baslik = 'CheckBox ListTile Demo35';
  bool check1 = true;
  String userIdx = '';
  String record = '';
  int record1=0;

  Future<QuerySnapshot> querySnapshot =
  FirebaseFirestore.instance.collection('data').get();

  getCount() async {
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('data').get();
    record = querySnapshot.docs[1].toString();
    print(record);
    return record;
  }

  List <CheckBoxListTileModel> getUsers=[CheckBoxListTileModel(
    userId:1,
    title:'ahmet25',
  )];

  List <CheckBoxListTileModel> getUser1=[CheckBoxListTileModel(
    userId:1,
    title:'ali',
  )];

  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    querySnapshot.then((value) {
      print(value.size);
      //print(value.docs[2].id);
      /*Map<String,dynamic> baslik1=value.docs[2].data();
  print(baslik1.isEmpty);
  print(baslik1.entries.first);
  print(baslik1.values.first);
  print(baslik1.values.elementAt(0));
  setState(() {
    baslik=baslik1.values.elementAt(0);
  });
*/
    });
  }

  getData() async {
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('data').get();
    print(querySnapshot.docs[0].id);
    record1 = querySnapshot.docs.length;
    querySnapshot.docs.forEach((element) {
      userIdx = element.id;
      print(userIdx);
    });
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: new Text(baslik,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body:Center(
        child: Column(
          children: [
            RaisedButton(
              child: Text('Future'),
              color: Colors.green,
              onPressed:(){
                print(getCount().hashCode);
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: getUsers.length,
                itemBuilder: (context,index){
                  return Text(getUsers[index].title,style: TextStyle(fontSize: 30.0),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
