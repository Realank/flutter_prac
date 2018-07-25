import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('StackPage'),
      ),
      body: Center(
        child: new Stack(
          alignment: Alignment.bottomCenter - Alignment(0.0, 0.1),
          children: [
            new CircleAvatar(
              backgroundImage: new AssetImage('images/dubai.jpg'),
              radius: 100.0,
            ),
            new Container(
              decoration: new BoxDecoration(
                color: Colors.black45,
              ),
              child: new Text(
                'Mia B',
                style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
