import 'package:app/src/provider/user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserNotifier userNotifier = Provider.of<UserNotifier>(context);
    return SingleChildScrollView(
        child: ListView.builder(
      shrinkWrap: true,
      itemCount: userNotifier.userList.length,
      itemBuilder: (BuildContext context, int index) => new Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<UserNotifier>(
                    builder: (_, notifier, __) => Text(
                      '${notifier.userList[index].name}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Consumer<UserNotifier>(
                    builder: (_, notifier, __) => Text(
                      '${notifier.userList[index].id}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Consumer<UserNotifier>(
                    builder: (_, notifier, __) => Text(
                      '${notifier.userList[index].symbol}',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
              Consumer<UserNotifier>(
                builder: (_, notifier, __) => Ink(
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(),
                    color: Color(0xffDA9CD1),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.delete),
                    color: Colors.white,
                    highlightColor: Color(0xffDA9CD1).withOpacity(0.5),
                    onPressed: () => notifier.removeUser(index),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
