import 'package:flutter/material.dart';
import 'TextPage.dart';
import 'ImagePage.dart';
import 'CustomTheme.dart';
import 'LayoutPage.dart';
import 'GridViewPage.dart';
import 'ListPage.dart';
import 'StackPage.dart';

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
  var listDict = {
    '文本': Icons.text_fields,
    '图片': Icons.wallpaper,
    '布局': Icons.widgets,
    '网格': Icons.grid_on,
    'List': Icons.list,
    'Stack': Icons.star,
  };
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('功能列表'),
      ),
      body: new ListView(
          children: listDict.keys.map((String name) {
        return new ListTile(
            leading: new Icon(listDict[name]),
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
      case '布局':
        jumpPage(new LayoutPage());
        break;
      case '网格':
        jumpPage(new GridViewPage());
        break;
      case 'List':
        jumpPage(new ListPage());
        break;
      case 'Stack':
        jumpPage(new StackPage());
        break;
    }
  }

  void jumpPage(StatelessWidget widget) {
    Navigator.of(context).push(
          new MaterialPageRoute(builder: (context) => widget),
        );
  }
}
