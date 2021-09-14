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

  Future<QuerySnapshot> querySnapshot =
  FirebaseFirestore.instance.collection('data').get();
  //FirebaseFirestore.instance.collection('sourceData').get();

  getCount1() async{
 FirebaseFirestore firebaseFirestore= await FirebaseFirestore.instance;
 CollectionReference veritabani=firebaseFirestore.collection("data");
 //veritabani.doc('1').set({'name':'Yalova1'});
 //veritabani.add({'name':'xxxxxxx'});
 Future<DocumentSnapshot> doc1=veritabani.doc('4').get();
 doc1.then((value) => print('bbbb'+value.id));
 print('işlem tamam');
  }

  getCount() async {
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('data').get();
    //record = querySnapshot.docs.last.id.toString();
    //record=querySnapshot.size.toString();
    //record=querySnapshot.runtimeType.toString();
    //record=querySnapshot.docs.runtimeType.toString();
    querySnapshot.docs.forEach((element) {
      //print(element.id.toString());
      //print(element.get("name"));
    });
    print("record ");
    return record;
  }

  List <CheckBoxListTileModel> getUsers=[
    CheckBoxListTileModel(
    userId:1,
    title:'ahmet1'),
    CheckBoxListTileModel(
    userId:2,
    title:'ahmet2'),
    CheckBoxListTileModel(
      userId:3,
      title:'ahmet3')
  ];
  List <CheckBoxListTileModel> getUser1=[CheckBoxListTileModel(
    userId:1,
    title:'ali',
  )];

  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    querySnapshot.then((value) {
      //print(value.size);
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
Future<void> upDate() async{
    await FirebaseFirestore.instance.collection('data').doc('6').update({'name':'Yalova35'});
  }

  Future<void> delete() async{
    await FirebaseFirestore.instance.collection('data').doc('6').delete();
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
            ElevatedButton (
              child: Text('Future'),
              onPressed: (){
                setState(() {
                 String newName1=getUsers.last.userId.toString();
                 print(newName1+"xxx350");
                 baslik=newName1;
                 //upDate();
                  delete();
                  print('kayıt silindi');
                });
                print(getUsers.last.userId.toString());
                print('getUsers');
              /*onPressed:()  async {
                await getCount1();*/
               //String isim= await getCount1();
              // print(isim);
              },
            ),
            ElevatedButton (
                onPressed:() {
                  getCount1();
                  print('buton');
                }
                , child: Text('Deneme',style: TextStyle(fontSize: 30.0),)),
            Expanded(
              child: ListView.builder(
                itemCount: getUsers.length,
                itemBuilder: (context,index){
                  return Text(getUsers[index].title+getUsers[index].userId.toString(),style: TextStyle(fontSize: 30.0),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
