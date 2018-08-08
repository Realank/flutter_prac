import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void _showAlert(BuildContext context, String content) {
  showDialog(
    context: context,
    builder: (context) {
      return new CupertinoAlertDialog(
        title: new Text('Alert'),
        content: new Text(content),
        actions: <Widget>[
          new CupertinoDialogAction(
            child: new Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); //dismiss
            },
          ),
        ],
      );
    },
  );
}

class AppleStylePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
        navigationBar: new CupertinoNavigationBar(
          middle: new Text('苹果风格'),
          trailing: new RightButton(),
        ),
        child: SafeArea(
          child: new Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            new CupertinoActivityIndicator(
              animating: true,
            ),
            new CupertinoButton(
                color: CupertinoColors.activeBlue,
                minSize: 30.0,
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 15.0, right: 15.0),
                child: new Text('Alert'),
                onPressed: () {
                  _showAlert(context, 'Button Click');
                }),
            new SliderWidget(
              initialValue: 0.2,
//              onChanged: (double value) {
//                print('changed $value');
//              },
              onChangeEnd: (double value) {
                print('slider end $value');
              },
            ),
            new SwitchWidget(
              initialValue: true,
              onChanged: (bool value) {
                print('switch to $value');
              },
            ),
            _buildPicker(['a', 'b', 'c'], 1, (index) {
              print(index);
            }),
          ]),
        ));
  }
}

class RightButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CupertinoButton(
      padding: EdgeInsets.zero,
      child: const Text('Exit'),
      onPressed: () {
        // The demo is on the root navigator.
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
  }
}

class SliderWidget extends StatefulWidget {
  final double initialValue;
  final ValueChanged<double> onChanged;
  final ValueChanged<double> onChangeEnd;
  SliderWidget({@required this.initialValue, this.onChanged, this.onChangeEnd});
  @override
  _SliderWidgetState createState() => new _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double value;
  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new CupertinoSlider(
        value: value,
        min: 0.0,
        max: 1.0,
        onChanged: (double newValue) {
          setState(() {
            value = newValue;
          });
          if (widget.onChanged != null) {
            widget.onChanged(newValue);
          }
        },
        onChangeEnd: (double newValue) {
          if (widget.onChangeEnd != null) {
            widget.onChangeEnd(newValue);
          }
        });
  }
}

class SwitchWidget extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;
  SwitchWidget({@required this.initialValue, this.onChanged});
  @override
  _SwitchWidgetState createState() => new _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool value = true;
  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new CupertinoSwitch(
        value: value,
        onChanged: (bool newValue) {
          setState(() {
            value = newValue;
          });
          if (widget.onChanged != null) {
            widget.onChanged(newValue);
          }
        });
  }
}

Widget _buildPicker(List<String> names, int initialIndex, ValueChanged<int> indexChanged) {
  final FixedExtentScrollController scrollController =
      new FixedExtentScrollController(initialItem: initialIndex < names.length ? initialIndex : 0);

  return new Container(
    height: 216.0,
    color: CupertinoColors.white,
    child: new DefaultTextStyle(
      style: const TextStyle(
        color: CupertinoColors.black,
        fontSize: 22.0,
      ),
      child: new CupertinoPicker(
        scrollController: scrollController,
        itemExtent: 32.0,
        backgroundColor: CupertinoColors.white,
        onSelectedItemChanged: (int index) {
          if (indexChanged != null) {
            indexChanged(index);
          }
        },
        children: new List<Widget>.generate(names.length, (int index) {
          return new Center(
            child: new Text(names[index]),
          );
        }),
      ),
    ),
  );
}
