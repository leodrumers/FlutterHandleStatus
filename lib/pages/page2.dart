import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managing_flutter_status/bloc/users/user_bloc.dart';
import 'package:managing_flutter_status/models/user.dart';

class Page2 extends StatelessWidget {
  static final String routeName = 'page2';

  @override
  Widget build(BuildContext context) {
    var userBloc = BlocProvider.of<UserBloc>(context, listen: false);

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
                userBloc.add(
                  ActiveUser(User(
                    name: "leo",
                    age: 29,
                    professions: ["Flutter Developer"],
                  )),
                );
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Change age',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                userBloc.add(
                  ChangeAge(30),
                );
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Add profession',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                userBloc.add(AddProfession('Flutter'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
