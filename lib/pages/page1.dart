import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managing_flutter_status/bloc/user/user_cubit.dart';
import 'package:managing_flutter_status/models/user.dart';

class Page1 extends StatelessWidget {
  static String routeName = '/loadingPage';
  @override
  Widget build(BuildContext context) {
    UserCubit userCubit = context.watch<UserCubit>();
    return Scaffold(
      appBar: AppBar(title: Text('Page1'), actions: [
        IconButton(
            icon: Icon(Icons.exit_to_app), onPressed: () => userCubit.logOut()),
      ]),
      body: BuildUserInformation(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.forward),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
      ),
    );
  }
}

class BuildUserInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (_, state) {
      if (state is UserInitialState) {
        return Center(child: Text('There\'s no user information'));
      } else if (state is ActiveUser) {
        return UserInformation((state).user);
      } else {
        return Center(child: Text('No hay estado valido'));
      }
    });
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
      child: Column(
        children: [
          Text('General', style: _titleStyle),
          Divider(),
          ListTile(
            title: Text('Name:', style: _listTileStyle),
            subtitle: Text(user.name),
          ),
          ListTile(
            title: Text('Age:', style: _listTileStyle),
            subtitle: Text(user.age.toString()),
          ),
          Divider(),
          Text('Professions', style: _titleStyle),
          Divider(),
          ...user.professions
              .map((profession) => ListTile(title: Text(profession)))
              .toList()
        ],
      ),
    );
  }
}
