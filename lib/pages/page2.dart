import 'package:flutter/material.dart';
import 'package:managing_flutter_status/models/user.dart';
import 'package:managing_flutter_status/services/user_services.dart';
import 'package:provider/provider.dart';

class Page2 extends StatelessWidget {
  static final String routeName = 'page2';

  @override
  Widget build(BuildContext context) {
    final UserService userService = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
          title: userService.userExist
              ? Text(userService.user.name)
              : Text('Page 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              child: Text('Set user', style: TextStyle(color: Colors.white)),
              onPressed: () {
                User newUser = User(
                    name: 'Leo',
                    age: 28,
                    professions: ['Flutter Developer', 'Python Developer']);
                userService.user = newUser;
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('Change age', style: TextStyle(color: Colors.white)),
              onPressed: () {
                userService.changeAge(30);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child:
                  Text('Add profession', style: TextStyle(color: Colors.white)),
              onPressed: () {
                userService.addProfession();
              },
            ),
          ],
        ),
      ),
    );
  }
}
