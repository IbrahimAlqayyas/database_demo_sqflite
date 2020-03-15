import 'package:flutter/material.dart';
import 'package:database_demo/BL/UserMethod.dart';
import 'package:database_demo/Model/User.dart';

/// صفحة التعديل
class AddEditScreen extends StatefulWidget {
  String command; // العملية اللي هتتعمل ع الداتا
  String username;
  String password;
  AddEditScreen(this.command, this.username, this.password);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _AddEditScreen(command, username, password);
  }
}


TextEditingController txtUser = new TextEditingController(); // للتعامل مع النص اللي بداخله
TextEditingController txtPassword = new TextEditingController(); // للتعامل مع النص اللي بداخله

class _AddEditScreen extends State<AddEditScreen>{

  String command;
  String username;
  String password;
  _AddEditScreen(this.command, this.username, this.password);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Add | Edit | Demo'),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new TextField(controller: txtUser),
            new TextField(controller: txtPassword),
            new RaisedButton(
              onPressed: (){
                if (txtUser.text.length > 0 && txtPassword.text.length > 0){ // لو مش فاضيين
                  if (command == 'add'){
                    UserMethod.addUser(
                        new User(0, txtUser.text, txtPassword.text)
                    );
                    txtUser.text= '';
                    txtPassword.text = '';
                  }
                }
              },
              child: new Text('Add')
            ),
          ],
        ),
      ),
    );
  }

}















