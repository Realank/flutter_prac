import 'package:flutter/material.dart';

List<Container> _buildGridTileList(int count) {
  return new List<Container>.generate(
      count, (int index) => new Container(child: new Image.asset('images/dubai.jpg')));
}

Widget buildGrid() {
  return new GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(5.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: _buildGridTileList(8));
}

Widget buildGrid2() {
  return new GridView.extent(
      maxCrossAxisExtent: 150.0,
      padding: const EdgeInsets.all(5.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: _buildGridTileList(14));
}

class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('网格'),
      ),
      body: SafeArea(
        child: new Row(
//          mainAxisSize: MainAxisSize.min,
//          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              child: buildGrid(),
            ),
            new Expanded(
              child: buildGrid2(),
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
