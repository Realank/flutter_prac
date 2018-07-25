import 'package:flutter/material.dart';
import 'TextPage.dart';
import 'ImagePage.dart';
import 'CustomTheme.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new FeatureList(), theme: customTheme);
  }
}

class FeatureList extends StatefulWidget {
  @override
  createState() => new _FeatureListState();
}

class _FeatureListState extends State<FeatureList> {
  var list = ['文本', '图片'];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('功能列表'),
      ),
      body: new ListView(
          children: list.map((String name) {
        return new ListTile(
            leading: new Icon(Icons.school),
            title: new Text(name),
            onTap: () {
              goNext(name);
            });
      }).toList()),
    );
  }

  void goNext(page) {
    switch (page) {
      case '文本':
        jumpPage(new TextPage());
        break;
      case '图片':
        jumpPage(new ImagePage());
        break;
    }
  }

  void jumpPage(StatelessWidget widget) {
    Navigator.of(context).push(
          new MaterialPageRoute(builder: (context) => widget),
        );
  }
}
