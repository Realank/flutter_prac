import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('TextPage'),
        ),
        body: new Column(children: <Widget>[
          new Text('Text Page'),
          new Container(
            color: Theme.of(context).accentColor,
            child: new Text(
              'Text with a background color',
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ]));
  }
}
