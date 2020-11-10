import 'package:flutter/material.dart';
import 'package:managing_flutter_status/models/user.dart';
import 'package:managing_flutter_status/services/user_service.dart';

class Page1 extends StatelessWidget {
  static String routeName = '/loadingPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page1')),
      body: StreamBuilder(
        stream: userService.streamController,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          return snapshot.hasData
              ? UserInformation(userService.user)
              : Center(
                  child: Text('There\'s no user information'),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.forward),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
      ),
    );
  }
}

class UserInformation extends StatelessWidget {
  final User user;

  const UserInformation(this.user);

  @override
  Widget build(BuildContext context) {
    TextStyle _titleStyle =
        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);
    TextStyle _listTileStyle =
        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0);
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('General',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            Divider(),
            ListTile(
              title: Text('Name:', style: _listTileStyle),
              subtitle: Text(this.user.name.toString()),
            ),
            ListTile(
              title: Text('Age:', style: _listTileStyle),
              subtitle: Text(this.user.age.toString()),
            ),
            Divider(),
            Text('Profession', style: _titleStyle),
            Divider(),
            ListTile(title: Text('Profession1:', style: _listTileStyle)),
            ListTile(title: Text('Profession2:', style: _listTileStyle)),
          ],
        ),
      ),
    );
  }
}
