import 'package:flutter/material.dart';

Widget createMovieTile(String title, String subTitle) {
  return new Container(
    color: Colors.white,
    child: new ListTile(
      title: new Text(title, style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
      subtitle: new Text(subTitle),
      leading: new Icon(
        Icons.theaters,
        color: Colors.blue[800],
      ),
    ),
  );
}

List<Widget> createList() {
  return <Widget>[
    createMovieTile('CineArts at the Empire', '85 W Portal Ave'),
    createMovieTile('The Castro Theater', '429 Castro St'),
  ];
}

const double kColorItemHeight = 48.0;

class Palette {
  Palette({this.name, this.primary, this.accent, this.threshold = 900});

  final String name;
  final MaterialColor primary;
  final MaterialAccentColor accent;
  final int threshold; // titles for indices > threshold are white, otherwise black

  bool get isValid => name != null && primary != null && threshold != null;
}

class ColorItem extends StatelessWidget {
  const ColorItem({
    Key key,
    @required this.index,
    @required this.color,
    this.prefix = '',
  })  : assert(index != null),
        assert(color != null),
        assert(prefix != null),
        super(key: key);

  final int index;
  final Color color;
  final String prefix;

  String colorString() => "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";

  @override
  Widget build(BuildContext context) {
    return new Semantics(
      container: true,
      child: new Container(
        height: kColorItemHeight,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        color: color,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text('$prefix$index'),
            new Text(colorString()),
          ],
        ),
      ),
    );
  }
}

class PaletteTabView extends StatelessWidget {
  static const List<int> primaryKeys = <int>[50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
  static const List<int> accentKeys = <int>[100, 200, 400, 700];

  PaletteTabView({
    Key key,
    @required this.colors,
  })  : assert(colors != null && colors.isValid),
        super(key: key);

  final Palette colors;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle whiteTextStyle = textTheme.body1.copyWith(color: Colors.white);
    final TextStyle blackTextStyle = textTheme.body1.copyWith(color: Colors.black);
    final List<Widget> colorItems = primaryKeys.map((int index) {
      return new DefaultTextStyle(
        style: index > colors.threshold ? whiteTextStyle : blackTextStyle,
        child: new ColorItem(index: index, color: colors.primary[index]),
      );
    }).toList();

    if (colors.accent != null) {
      colorItems.addAll(accentKeys.map((int index) {
        return new DefaultTextStyle(
          style: index > colors.threshold ? whiteTextStyle : blackTextStyle,
          child: new ColorItem(index: index, color: colors.accent[index], prefix: 'A'),
        );
      }).toList());
      colorItems.addAll(accentKeys.map((int index) {
        return new DefaultTextStyle(
          style: index > colors.threshold ? whiteTextStyle : blackTextStyle,
          child: new ColorItem(index: index, color: colors.accent[index], prefix: 'A'),
        );
      }).toList());
    }

    return Container(
      color: Colors.grey,
//      margin: EdgeInsets.only(bottom: 10.0),
      child: new ListView(
        itemExtent: kColorItemHeight,
        children: colorItems,
      ),
    );
  }
}

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('ListPage'),
        ),
        body: SafeArea(
          child: Row(
            children: <Widget>[
              Expanded(
                child: new Container(
                  color: Colors.grey,
                  child: new ListView(
                    children: createList(),
                  ),
                ),
              ),
              Expanded(
                child: new PaletteTabView(
                    colors: new Palette(
                        name: 'RED',
                        primary: Colors.red,
                        accent: Colors.redAccent,
                        threshold: 300)),
              ),
            ],
          ),
        ));
  }
}
