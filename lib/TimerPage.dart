import 'package:flutter/material.dart';
import 'dart:async';

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('FoundationPage'),
      ),
      body: new Column(
        children: <Widget>[
          new Text('日期时间：${DateTime.now()}'),
          new TimerWidget(),
        ],
      ),
    );
  }
}

class TimerWidget extends StatefulWidget {
  @override
  _TimerWidgetState createState() => new _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  var now = DateTime.now();
  Timer timer;
  @override
  void initState() {
    timer = new Timer(Duration(milliseconds: 100), update);
    super.initState();
  }

  void update() {
    print('update');

    setState(() {
      timer = new Timer(Duration(milliseconds: 100), update);
      now = DateTime.now();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Text(now.toString());
  }
}
