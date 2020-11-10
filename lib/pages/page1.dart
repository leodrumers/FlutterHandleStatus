import 'package:flutter/material.dart';
import 'package:managing_flutter_status/models/user.dart';
import 'package:managing_flutter_status/services/user_services.dart';
import 'package:provider/provider.dart';

class Page1 extends StatelessWidget {
  static String routeName = '/loadingPage';
  @override
  Widget build(BuildContext context) {
    final UserService userService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              userService.deleteUser();
            },
          ),
        ],
      ),
      body: userService.userExist
          ? UserInformation(userService.user)
          : Center(child: Text('There\'s no user selected')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.forward),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
      ),
    );
  }
}

class UserInformation extends StatelessWidget {
  final User user;
  UserInformation(this.user);

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
      child: Column(
        children: [
          Text('General', style: _titleStyle),
          Divider(),
          ListTile(
            title: Text(
              'Name:',
              style: _listTileStyle,
            ),
            subtitle: Text(user.name, style: TextStyle(fontSize: 18)),
          ),
          ListTile(
            title: Text('Age:', style: _listTileStyle),
            subtitle: Text(
              user.age.toString(),
              style: TextStyle(fontSize: 18),
            ),
          ),
          Divider(),
          Text('Profession', style: _titleStyle),
          Divider(),
          ...user.professions
              .map((profession) => ListTile(
                    title: Text(profession),
                  ))
              .toList(),
          //ListTile(title: Text('Profession1:', style: _listTileStyle)),
        ],
      ),
    );
  }
}
