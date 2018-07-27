import 'package:flutter/material.dart';

class GesturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('手势'),
      ),
      body: new GestureGround(),
    );
  }
}

class GestureGround extends StatefulWidget {
  @override
  _GestureState createState() => new _GestureState();
}

class _GestureState extends State<GestureGround> {
  var _text1 = 'Multi Gesture';
  var _text2 = 'Pan';
  void _changeState1(String content) {
    setState(() {
      _text1 = content;
    });
  }

  void _changeState2(String content) {
    setState(() {
      _text2 = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        children: <Widget>[
          new Divider(),
          new GestureDetector(
            onTap: () {
              _changeState1('onTap');
            },
            onDoubleTap: () {
              _changeState1('onDoubleTap');
            },
            onLongPress: () {
              _changeState1('onLongPress');
            },
            onScaleStart: (ScaleStartDetails details) {
              _changeState1('onScaleStart');
            },
            onScaleUpdate: (ScaleUpdateDetails details) {
              _changeState1('onScaleUpdate ${details.scale}');
            },
            onScaleEnd: (ScaleEndDetails details) {
              _changeState1('onScaleEnd');
            },
            child: new Container(
              color: Colors.blue,
              width: 200.0,
              height: 200.0,
              child: new Center(child: new Text(_text1)),
            ),
          ),
          new Divider(),
          new GestureDetector(
            onPanStart: (DragStartDetails details) {
              _changeState2('onPanStart');
            },
            onPanUpdate: (DragUpdateDetails details) {
              _changeState2('onPanUpdate');
            },
            onPanEnd: (DragEndDetails details) {
              _changeState2('onPanEnd');
            },
            onPanCancel: () {
              _changeState2('onPanCancel');
            },
            child: new Container(
              color: Colors.blue,
              width: 200.0,
              height: 200.0,
              child: new Center(child: new Text(_text2)),
            ),
          ),
        ],
      ),
    );
  }
}
