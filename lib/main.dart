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
  String newName='Yalova';
  String baslik1='baslik1';
  Map<String,dynamic> map1={'city':'izmir','number':'1234'};
  Map<String,dynamic> map2;
  String text1='text135';
  int kayitSayisi=0;

  counter() async
   {
   QuerySnapshot querySnapshot1=await FirebaseFirestore.instance.collection('data').get();
    print(querySnapshot1.docs.length);
    setState(() {
      baslik=querySnapshot1.docs.length.toString();
      text1=querySnapshot1.docs[0].get('name');
      querySnapshot1.docs.forEach((element) {
        text1=element.id;
      });
    });
      }
  Future<QuerySnapshot> querySnapshot =
  FirebaseFirestore.instance.collection('data').get();

  getCount1() async{
 FirebaseFirestore firebaseFirestore= await FirebaseFirestore.instance;
 CollectionReference veritabani=firebaseFirestore.collection("data");
 querySnapshot.then((value) => {
   print('querySnapshot'),
   value.docs.forEach((element) {
     print(element.id);
   })
 });
  }

  getCount() async {
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('data').get();
    querySnapshot.docs.forEach((element) {
    });
    print("record ");
    return record;
  }

 Future<int> getData() async {
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('data').get();
    print(querySnapshot.docs[0].id);
    record1 = querySnapshot.docs.length;
    querySnapshot.docs.forEach((element) {
      userIdx = element.id;
      print(userIdx);
    });
    return record1;
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
            Expanded (
              child: Text(kayitSayisi.toString(),style: TextStyle(fontSize: 30.0),
              ),
            ),
            Text(text1,style: TextStyle(fontSize: 30.0),),
            ElevatedButton  (
                onPressed:() async {
                int deger=await getData();
                    print(deger);
                    setState(() {
                      baslik=deger.toString();
                      kayitSayisi=deger;
                    });
                }
                , child: Text('Deneme',style: TextStyle(fontSize: 30.0),)),
          ],
        ),
      ),
    );
  }
}
