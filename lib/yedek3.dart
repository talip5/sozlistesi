import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_listtile_demo/model/listtilemodel.dart';
import 'models/checkBoxListTileModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: CheckBoxListTileDemo(
    ),
  ));
}
class CheckBoxListTileDemo extends StatefulWidget {
  @override
  CheckBoxListTileDemoState createState() => new CheckBoxListTileDemoState();
}

class CheckBoxListTileDemoState extends State<CheckBoxListTileDemo> {

  String baslik = 'CheckBox ListTile Demo35';
  bool check1=true;
  String userIdx='';

  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    Future<QuerySnapshot> querySnapshot= FirebaseFirestore.instance.collection('data').get();
    querySnapshot.then((value){
      print(value.docs[2].id);
      Map<String,dynamic> baslik1=value.docs[2].data();
      print(baslik1.isEmpty);
      print(baslik1.entries.first);
      print(baslik1.values.first);
      print(baslik1.values.elementAt(0));
      baslik=baslik1.values.elementAt(0);
    });
  }

  getData() async{
    QuerySnapshot querySnapshot=await FirebaseFirestore.instance.collection('data').get();
    print(querySnapshot.docs[0].id);
    querySnapshot.docs.forEach((element) {
      userIdx=element.id;
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
      body: Column(
        children: [
          RaisedButton(
            child: Text('Data'),
            color: Colors.amber,
            onPressed: (){
              getData();
            },
          ),
          Expanded(
            child: new ListView.builder(
                itemCount: getUsers.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    child: new Container(
                      padding: new EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          new CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor: Colors.pink[300],
                              dense: true,
                              //font change
                              title: new Text(
                                getUsers[index].title,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5),
                              ),
                              value: getUsers[index].isCheck,
                              secondary: Container(
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                  getUsers[index].img,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              onChanged: (bool val) {
                                itemChange(val, index);
                                setState(() {
                                  baslik = getUsers[index].userId.toString();
                                });
                              }
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  void itemChange(bool val, int index) {
    setState(() {
      getUsers[index].isCheck = val;
    });
  }

  List<CheckBoxListTileModel> getUsers = [CheckBoxListTileModel(
      userId: 1,
      img: 'assets/images/a1.jpg',
      title: "Android",
      isCheck: true),
    CheckBoxListTileModel(
        userId: 2,
        img: 'assets/images/a1.jpg',
        title: "Flutter",
        isCheck: false),
    CheckBoxListTileModel(
        userId: 3,
        img: 'assets/images/a1.jpg',
        title: "IOS",
        isCheck: false),
    CheckBoxListTileModel(
        userId: 4,
        img: 'assets/images/a1.jpg',
        title: "PHP",
        isCheck: false),
    CheckBoxListTileModel(
        userId: 5,
        img: 'assets/images/a1.jpg',
        title: "Node",
        isCheck: false),
    CheckBoxListTileModel(
        userId: 6,
        img: 'assets/images/a1.jpg',
        title: "Android",
        isCheck: true),
    CheckBoxListTileModel(
        userId: 7,
        img: 'assets/images/a1.jpg',
        title: "Flutter",
        isCheck: false),
    CheckBoxListTileModel(
        userId: 8,
        img: 'assets/images/a1.jpg',
        title: "IOS",
        isCheck: false),
    CheckBoxListTileModel(
        userId: 9,
        img: 'assets/images/a1.jpg',
        title: "PHP",
        isCheck: false),
    CheckBoxListTileModel(
        userId: 10,
        img: 'assets/images/a1.jpg',
        title: "Node",
        isCheck: false)
  ];
}