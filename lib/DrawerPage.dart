import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('DrawerPage'),
        actions: <Widget>[
          const BackButton(),
        ],
      ),
      body: new Text('DrawerPage'),
      drawer: new Drawer(
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              new Text("this is a drawer"),
              Divider(),
              new Text("line1"),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
