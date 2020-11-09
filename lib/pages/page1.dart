import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  static String routeName = '/loadingPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page1')),
      body: UserInformation(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.forward),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
      ),
    );
  }
}

class UserInformation extends StatelessWidget {
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
          ListTile(title: Text('Name:', style: _listTileStyle)),
          ListTile(title: Text('Age:', style: _listTileStyle)),
          Divider(),
          Text('Profession', style: _titleStyle),
          Divider(),
          ListTile(title: Text('Profession1:', style: _listTileStyle)),
          ListTile(title: Text('Profession2:', style: _listTileStyle)),
        ],
      ),
    );
  }
}
