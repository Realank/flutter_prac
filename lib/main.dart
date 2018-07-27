import 'package:flutter/material.dart';
import 'TextPage.dart';
import 'ImagePage.dart';
import 'CustomTheme.dart';
import 'LayoutPage.dart';
import 'GridViewPage.dart';
import 'ListPage.dart';
import 'StackPage.dart';
import 'CardPage.dart';
import 'StateManage.dart';
import 'InputPage.dart';
import 'GesturePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new _Features(), theme: customTheme);
  }
}

class _Features extends StatelessWidget {
  final listDict = {
    '文本': Icons.text_fields,
    '图片': Icons.wallpaper,
    '布局': Icons.widgets,
    '网格': Icons.grid_on,
    '列表': Icons.list,
    'Stack': Icons.star,
    '卡片': Icons.credit_card,
    '状态管理': Icons.touch_app,
    '输入': Icons.input,
    '手势': Icons.gesture,
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
              goNext(name, context);
            });
      }).toList()),
    );
  }

  void goNext(page, BuildContext context) {
    switch (page) {
      case '文本':
        jumpPage(new TextPage(), context);
        break;
      case '图片':
        jumpPage(new ImagePage(), context);
        break;
      case '布局':
        jumpPage(new LayoutPage(), context);
        break;
      case '网格':
        jumpPage(new GridViewPage(), context);
        break;
      case '列表':
        jumpPage(new ListPage(), context);
        break;
      case 'Stack':
        jumpPage(new StackPage(), context);
        break;
      case '卡片':
        jumpPage(new CardPage(), context);
        break;
      case '状态管理':
        jumpPage(new StateManage(), context);
        break;
      case '输入':
        jumpPage(new InputPage(), context);
        break;
      case '手势':
        jumpPage(new GesturePage(), context);
        break;
    }
  }

  void jumpPage(StatelessWidget widget, BuildContext context) {
    Navigator.of(context).push(
          new MaterialPageRoute(builder: (context) => widget),
        );
  }
}
