import 'package:database_demo/BL/UserMethod.dart';
import 'package:database_demo/DAL/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:database_demo/PL/AddEditScreen.dart';

/// الصفحة الرئيسية --> أول حاجة هتظهر للمستخدم
class ListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ListScreen();
  }
}

class _ListScreen extends State<ListScreen>{
  List users = new List(); // اللي هنحط فيها العناصر اللي هنجيبها
  void refreshScreen() {
    UserMethod.getAllUsers().then((vals) {
      setState(() {
        users = vals;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshScreen();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Database Demo'),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Expanded(
                child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int position){
                  return new Card(
                    child: new ListTile(
                      title: new Text(users[position]['username'].toString()),
                    ),
                  );
                })
            ),
          ],
        ),
      ),

      /// نضغط عليه للذهاب لصفحة التعديل
      floatingActionButton: new FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(
          // 'add' will be stored in 'command'
            builder: (context) => AddEditScreen('add','','')));
          },
          child: new Icon(Icons.add)),
    );
  }

}