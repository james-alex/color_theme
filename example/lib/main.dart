import 'package:color_theme/color_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Theme Explorer',
      theme: ThemeData(
        cardColor: Colors.black,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final List<MapEntry<String, ColorTheme>> _colorThemes =
      ColorThemes.all.entries.toList();

  /// The index of the [ColorTheme], within [_colorThemes],
  /// currently applied to the app.
  int _currentColorTheme;

  /// The [ColorTheme] currently applied to the app.
  ColorTheme _colorTheme;

  /// The name of the [ColorTheme] currently applied to the app.
  String _colorThemeName;

  @override
  void initState() {
    super.initState();
    _applyColorTheme(0);
  }

  /// Applies the [ColorTheme] at [index] within [_colorThemes] to the app.
  void _applyColorTheme(int index) {
    assert(index != null && index >= 0 && index < _colorThemes.length);

    _currentColorTheme = index;
    _colorTheme = _colorThemes[index].value;
    _colorThemeName = _colorThemes[index].key;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_colorThemeName),
      ),
      body: Center(
        // TODO: Build a dummy app showcasing all of the colors in a color theme.
        child: Container(),
      ),
    );
  }
}
