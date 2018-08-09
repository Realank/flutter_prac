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
import 'AnimationPage.dart';
import 'FileIOPage.dart';
import 'NetworkPage.dart';
import 'FlipNumberPage.dart';
import 'TimerPage.dart';
import 'AppleStylePage.dart';
import 'ScrollTabPage.dart';
import 'AppleScrollPage.dart';
import 'DrawerPage.dart';
import 'PaintPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: _Features(), theme: customTheme);
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
    '输入&按钮': Icons.input,
    '手势': Icons.gesture,
    '动画': Icons.motorcycle,
    '文件读取': Icons.insert_drive_file,
    '网络': Icons.settings_ethernet,
    '第三方动画': Icons.flip,
    '定时器': Icons.extension,
    '苹果风格': Icons.phone_iphone,
    '苹果导航/列表': Icons.navigate_before,
    '滚动TabBar': Icons.inbox,
    '侧滑抽屉': Icons.keyboard_tab,
    '绘图': Icons.format_paint,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('功能列表'),
      ),
      body: ListView(
          children: listDict.keys.map((String name) {
        return ListTile(
            leading: Icon(listDict[name]),
            title: Text(name),
            onTap: () {
              goNext(name, context);
            });
      }).toList()),
    );
  }

  void goNext(page, BuildContext context) {
    switch (page) {
      case '文本':
        jumpPage(TextPage(), context);
        break;
      case '图片':
        jumpPage(ImagePage(), context);
        break;
      case '布局':
        jumpPage(LayoutPage(), context);
        break;
      case '网格':
        jumpPage(GridViewPage(), context);
        break;
      case '列表':
        jumpPage(ListPage(), context);
        break;
      case 'Stack':
        jumpPage(StackPage(), context);
        break;
      case '卡片':
        jumpPage(CardPage(), context);
        break;
      case '状态管理':
        jumpPage(StateManage(), context);
        break;
      case '输入&按钮':
        jumpPage(InputPage(), context);
        break;
      case '手势':
        jumpPage(GesturePage(), context);
        break;
      case '动画':
        jumpPage(AnimationPage(), context);
        break;
      case '文件读取':
        jumpPage(FileIOPage(), context);
        break;
      case '网络':
        jumpPage(NetworkPage(), context);
        break;
      case '第三方动画':
        jumpPage(FlipNumberPage(), context);
        break;
      case '定时器':
        jumpPage(TimerPage(), context);
        break;
      case '苹果风格':
        jumpPage(AppleStylePage(), context);
        break;
      case '苹果导航/列表':
        jumpPage(AppleScrollPage(), context);
        break;
      case '滚动TabBar':
        jumpPage(ScrollTabPage(), context);
        break;
      case '侧滑抽屉':
        jumpPage(DrawerPage(), context);
        break;
      case '绘图':
        jumpPage(PaintPage(), context);
    }
  }

  void jumpPage(StatelessWidget widget, BuildContext context) {
    Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => widget),
        );
  }
}
