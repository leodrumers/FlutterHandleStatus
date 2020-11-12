import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:managing_flutter_status/bloc/user/user_cubit.dart';
import 'package:managing_flutter_status/pages/page1.dart';
import 'package:managing_flutter_status/pages/page2.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UserCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter status',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: Page1.routeName,
        routes: {
          Page1.routeName: (_) => Page1(),
          Page2.routeName: (_) => Page2(),
        },
      ),
    );
  }
}
