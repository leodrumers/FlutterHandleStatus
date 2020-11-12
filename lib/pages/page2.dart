import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managing_flutter_status/bloc/user/user_cubit.dart';
import 'package:managing_flutter_status/models/user.dart';

class Page2 extends StatelessWidget {
  static final String routeName = 'page2';

  @override
  Widget build(BuildContext context) {
    UserCubit userCubit = context.watch<UserCubit>();

    return Scaffold(
      appBar: AppBar(title: Text('Page2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Set user',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                User user = User(
                    name: 'Leo',
                    age: 28,
                    professions: ['Android developer', 'UX developer']);
                userCubit.setUserActive(user);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Change age',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                userCubit.changeAge(30);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Add profession',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                String profession = 'Flutter Developer';
                userCubit.addProfession(profession);
              },
            ),
          ],
        ),
      ),
    );
  }
}
