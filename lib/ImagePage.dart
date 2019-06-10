import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('图片'),
        ),
        body: new Column(
          children: <Widget>[
            _sizedContainer(
                new Image.network(
                  'https://www.baidu.com/img/bd_logo1.png',
                ),
                Colors.grey),
            _sizedContainer(
                new CachedNetworkImage(
                  placeholder: (BuildContext context, String url) {
                    return CircularProgressIndicator();
                  },
                  imageUrl: 'https://www.baidu.com/img/bd_logo1.png',
                  errorWidget:
                      (BuildContext context, String url, Object error) {
                    return Icon(Icons.error);
                  },
                ),
                Colors.green),
            new Image.asset(
              'images/dubai.jpg',
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ],
        ));
  }
}

Widget _sizedContainer(Widget child, Color color) {
  return new SizedBox(
//    width: 300.0,
    height: 150.0,
    child: new Container(
      child: new Center(child: child),
      color: color,
    ),
  );
}
