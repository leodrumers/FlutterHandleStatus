import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  static final String routeName = 'page2';

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                'Change age',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
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
