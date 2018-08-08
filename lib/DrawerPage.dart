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
      body: Column(
        children: <Widget>[Text('DrawerPage'), Expanded(child: Text('hello'))],
      ),
      drawer: new Drawer(
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              new Text("this is a drawer"),
              Divider(
                height: 0.5,
              ),
              new Text("line1"),
              Divider(
                height: 0.5,
              ),
              new Container(
                height: 44.0,
                color: Colors.blue,
                child: Center(
                    child: FlatButton(
                        onPressed: () {
                          Navigator.maybePop(context);
                        },
                        child: Text('back'))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
