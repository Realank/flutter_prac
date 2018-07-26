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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('InputPage'),
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
          new TextFieldExample()
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          _buttonAction(context, 'Floating Action Button');
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
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Expanded(
          child: new TextField(
            controller: _controller,
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
