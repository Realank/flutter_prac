import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

class NetworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('网络'),
      ),
      body: new NetworkWidget(),
    );
  }
}

class NetworkWidget extends StatefulWidget {
  NetworkWidget({Key key}) : super(key: key);

  @override
  _NetworkWidgetState createState() => new _NetworkWidgetState();
}

class _NetworkWidgetState extends State<NetworkWidget> {
  var _ipAddress = 'Unknown';

  _getIPAddress() async {
    var url = 'https://httpbin.org/ip';
    var httpClient = new HttpClient();

    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        var data = JSON.decode(json);
        result = data['origin'];
      } else {
        result = 'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _ipAddress = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(height: 32.0);

    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('Your current IP address is:'),
          new Text('$_ipAddress.'),
          spacer,
          new RaisedButton(
            onPressed: _getIPAddress,
            child: new Text('Get IP address'),
          ),
        ],
      ),
    );
  }
}
