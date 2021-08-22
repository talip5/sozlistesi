import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_listtile_demo/model/listtilemodel.dart';
import 'models/checkBoxListTileModel.dart';

void main(){
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
      body: new ListView.builder(
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