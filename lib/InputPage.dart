import 'package:flutter/material.dart';

void _buttonAction(BuildContext context, String content) {
  showDialog(
    context: context,
    builder: (context) {
      return new AlertDialog(
        title: new Text('Button Pressed'),
        content: new Text(content),
        actions: <Widget>[
          new FlatButton(
            child: new Text(
              'OK',
              style: Theme.of(context).textTheme.button,
            ),
            onPressed: () {
              Navigator.of(context).pop(); //dismiss
            },
          )
        ],
      );
    },
  );
}

class InputPage extends StatelessWidget {
  static final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text('输入&按钮'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text('Form&FormField'),
          new Divider(),
          new Text('Checkbox'),
          new Divider(),
          new Text('DropdownButton'),
          new Divider(),
          new Text('IconButton'),
          new Divider(),
          new Text('Radio'),
          new Divider(),
          new RaisedButtonExample(),
          new Divider(),
          new Text('Slider'),
          new Divider(),
          new Text('Switch'),
          new Divider(),
          new Text('TextField'),
          new TextFieldExample(),
          new Divider(),
          new InkWellButtonExample(),
          new Divider(),
          new PopupMenuButton<String>(
            onSelected: (String result) {
              print('select $result');
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'a',
                    child: const Text('Working a lot harder'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'b',
                    child: const Text('Being a lot smarter'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'c',
                    child: const Text('Being a self-starter'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'd',
                    child: const Text('Placed in charge of trading charter'),
                  ),
                ],
          )
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
//          _buttonAction(context, 'Floating Action Button');
          _scaffoldKey.currentState.showSnackBar(const SnackBar(content: const Text("snack bar")));
        },
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}

class RaisedButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      child: new Text('Raised Button'),
      onPressed: () {
        _buttonAction(context, 'Raised Button');
      },
    );
  }
}

class TextFieldExample extends StatefulWidget {
  TextFieldExample({Key key}) : super(key: key);

  @override
  _TextFieldExampleState createState() => new _TextFieldExampleState();
}

/// State for [TextFieldExample] widgets.
class _TextFieldExampleState extends State<TextFieldExample> {
  final TextEditingController _controller = new TextEditingController();
  @override
  void initState() {
    _controller.addListener(() {
      print('input ${_controller.text}');
    });
    super.initState();
  }

  @override
  void dispose() {
    print('dispose text field');
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Expanded(
          child: new TextField(
            controller: _controller,
            maxLength: 30,
            decoration: new InputDecoration(
              hintText: 'Type something',
            ),
          ),
        ),
        new RaisedButton(
          onPressed: () {
            _buttonAction(context, _controller.text);
          },
          child: new Text('DONE'),
        ),
      ],
    );
  }
}

class InkWellButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Ink(
      color: Colors.lightGreen,
      child: new InkWell(
        highlightColor: Colors.green,
        splashColor: Colors.red,
        onTap: () {
//          _buttonAction(context, '水波纹按钮');
        },
        child: new Ink(
//          color: Colors.lightBlue,
          padding: new EdgeInsets.all(12.0),
          child: new Text(
            '水波纹按钮',
          ),
        ),
      ),
    );
  }
}
