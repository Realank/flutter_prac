import 'package:flutter/material.dart';

Widget createCard() {
  return new SizedBox(
    height: 210.0,
    child: new Card(
      child: new Column(
        children: [
          new ListTile(
            title: new Text('1625 Main Street', style: new TextStyle(fontWeight: FontWeight.w500)),
            subtitle: new Text('My City, CA 99984'),
            leading: new Icon(
              Icons.restaurant_menu,
              color: Colors.blue[500],
            ),
          ),
          new Divider(),
          new ListTile(
            title: new Text('(408) 555-1212', style: new TextStyle(fontWeight: FontWeight.w500)),
            leading: new Icon(
              Icons.contact_phone,
              color: Colors.blue[500],
            ),
          ),
          new ListTile(
            title: new Text('costa@example.com'),
            leading: new Icon(
              Icons.contact_mail,
              color: Colors.blue[500],
            ),
          ),
        ],
      ),
    ),
  );
}

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('卡片'),
      ),
      body: Center(child: createCard()),
    );
  }
}
