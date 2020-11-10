import 'package:flutter/material.dart';
import 'package:managing_flutter_status/models/user.dart';
import 'package:managing_flutter_status/services/user_service.dart';

class Page2 extends StatelessWidget {
  static final String routeName = 'page2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: StreamBuilder(
        stream: userService.streamController,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          return snapshot.hasData
              ? Text(userService.user.name)
              : Text('Page 2', style: TextStyle(color: Colors.white));
        },
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              child: Text('Set user', style: TextStyle(color: Colors.white)),
              onPressed: () {
                userService.setUser(User(name: 'Leo', age: 28));
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Change age',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                userService.setAge(29);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Add profession',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
