import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class AppleScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTextStyle(
      style: const TextStyle(
        fontFamily: '.SF UI Text',
        inherit: false,
        fontSize: 20.0,
        color: CupertinoColors.black,
      ),
      child: new CupertinoPageScaffold(
        child: new CustomScrollView(
          slivers: <Widget>[
            const CupertinoSliverNavigationBar(
              largeTitle: const Text('苹果导航/列表'),
            ),
            new CupertinoRefreshControl(
              onRefresh: () {
                print('refresh');
                return new Future<void>.delayed(const Duration(seconds: 2));
              },
            ),
            new SliverSafeArea(
              top: false, // Top safe area is consumed by the navigation bar.
              sliver: new SliverList(
                delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                        padding: EdgeInsets.only(left: 8.0, top: 8.0),
                        height: 60.0,
                        decoration: UnderlineTabIndicator(
                            borderSide: BorderSide(width: 0.5, color: Colors.grey)),
                        child: new Text('item'));
                  },
                  childCount: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
