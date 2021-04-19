import 'package:app/src/provider/user_notifier.dart';
import 'package:app/src/models/users.dart';
import 'package:app/src/widget/button.dart';
import 'package:app/src/widget/labelText.dart';
import 'package:app/src/widget/userList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String _name;
  String _id;
  String _symbol;

  List<User> userList = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    UserNotifier userNotifier = Provider.of<UserNotifier>(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, bottom: 60, right: 20, top: 80),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LabelText(
                labelText: 'Id',
                onSaved: (String value) {
                  _id = value;
                },
              ),
              SizedBox(height: 16),
              LabelText(
                labelText: 'Name',
                onSaved: (String value) {
                  _name = value;
                },
              ),
              SizedBox(height: 16),
              LabelText(
                labelText: 'Symbol',
                onSaved: (String value) {
                  _id = value;
                },
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Botton(
                    text: 'Add',
                    onPressed: () {
                      if (!_formKey.currentState.validate()) return;

                      _formKey.currentState.save();
                      userNotifier
                          .addUser(User(id: _id, name: _name, symbol: _symbol));
                      Toast.show("Agrego a ${_name}", context,
                          duration: Toast.LENGTH_LONG);
                    },
                  ),
                  SizedBox(width: 10),
                  Botton(
                    text: 'list',
                    onPressed: () {
                      userNotifier.listUser();
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              UserList(),
            ],
          ),
        ),
      ),
    );
  }
}
