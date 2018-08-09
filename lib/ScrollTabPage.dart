import 'package:flutter/material.dart';

class _Page {
  _Page({this.icon, this.text, this.content});
  final IconData icon;
  final String text;
  final Widget content;
}

List<_Page> _allPages = <_Page>[
  _Page(
      icon: Icons.grade,
      text: 'TRIUMPH',
      content: Container(color: Colors.black12, child: Center(child: Text('first page')))),
  _Page(icon: Icons.playlist_add, text: 'NOTE'),
  _Page(icon: Icons.check_circle, text: 'SUCCESS'),
  _Page(icon: Icons.question_answer, text: 'OVERSTATE'),
  _Page(icon: Icons.sentiment_very_satisfied, text: 'SATISFACTION'),
  _Page(icon: Icons.camera, text: 'APERTURE'),
];

class ScrollTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ScrollTabWidget();
  }
}

class ScrollTabWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ScrollTabState();
  }
}

class ScrollTabState extends State<ScrollTabWidget> with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = new TabController(vsync: this, length: _allPages.length);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Decoration getIndicator2() {
    return UnderlineTabIndicator(borderSide: BorderSide(width: 3.0, color: Colors.white));
  }

  Decoration getIndicator() {
    return new ShapeDecoration(
      shape: const RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
            side: const BorderSide(
              color: Colors.yellow,
              width: 2.0,
            ),
          ) +
          const RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
            side: const BorderSide(
              color: Colors.red,
              width: 4.0,
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('滚动Tab'),
        bottom: new TabBar(
          controller: _controller,
          isScrollable: true,
          indicator: getIndicator2(),
          tabs: _allPages.map((_Page page) {
            return new Tab(text: page.text, icon: new Icon(page.icon));
          }).toList(),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 40.0,
//            width: 50.0,
            child: Center(
              child: TabPageSelector(
                indicatorSize: 8.0,
                controller: _controller,
                selectedColor: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: new TabBarView(
                controller: _controller,
                children: _allPages.map((_Page page) {
                  return new SafeArea(
//              top: true,
//              bottom: true,
                    child: new Container(
                      key: new ObjectKey(page.icon),
                      padding: const EdgeInsets.all(12.0),
                      child: page.content != null ? page.content : new Text(page.text),
                    ),
                  );
                }).toList()),
          ),
        ],
      ),
      bottomNavigationBar: new Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: new TabBar(
            controller: _controller,
            isScrollable: true,
            indicator: getIndicator2(),
            tabs: _allPages.map((_Page page) {
              return new Tab(text: page.text, icon: new Icon(page.icon));
            }).toList(),
          ),
        ),
      ),
    );
  }
}
