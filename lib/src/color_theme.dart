import 'package:flutter_object_map/flutter_object_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// A color themeing solution with support for handling locally and
/// globally applied themes, and the combination thereof.
///
/// [ColorTheme] is derived from and is compatible with Flutter's
/// Material [ThemeData] object.
@immutable
class ColorTheme implements MergeableObject<ColorTheme> {
  /// A color themeing solution with support for handling locally and
  /// globally applied themes, and the combination thereof.
  ///
  /// [ColorTheme] is derived from and is compatible with Flutter's
  /// Material [ThemeData] object.
  const ColorTheme({
    this.key,
    this.primaryColor,
    this.accentColor,
    this.contrastColor,
    this.backgroundColor,
    this.buttonColor,
    this.dividerColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.activeColor,
    this.inactiveColor,
    this.disabledColor,
    this.errorColor,
  });

  /// A unique identifier used to define and retrieve global [ColorTheme]s
  /// with the [ColorTheme.global] constructor/provider and the related
  /// static methods.
  final Key key;

  /// The background color of primary components.
  final Color primaryColor;

  /// The foreground color of primary components.
  final Color accentColor;

  /// A color that contrasts the [primaryColor], intended for use as
  /// the background for components overlaid on the [primaryColor].
  ///
  /// __Note:__ [contrastColor] is the equivalent of Flutter's Material
  /// [ThemeData.backgroundColor](https://api.flutter.dev/flutter/material/ThemeData/backgroundColor.html)
  /// property.
  final Color contrastColor;

  /// The background color the app.
  ///
  /// __Note:__ [backgroundColor] is the equivalent of Flutter's Material
  /// [ThemeData.scaffoldBackgroundColor](https://api.flutter.dev/flutter/material/ThemeData/scaffoldBackgroundColor.html)
  /// property.
  final Color backgroundColor;

  /// The background color of buttons.
  final Color buttonColor;

  /// The color of dividers.
  final Color dividerColor;

  /// The color used to indicate that a component has input focus.
  final Color focusColor;

  /// The color used to indicate when a pointer is hovering over a component.
  final Color hoverColor;

  /// The color used to indicate when a menu item is selected, and as
  /// the color of ink splash animations, if [splashColor] is `null`.
  final Color highlightColor;

  /// The color of ink splashes, as used by Flutter's Material
  /// [InkWell](https://api.flutter.dev/flutter/material/InkWell-class.html)
  /// and [InkResponse](https://api.flutter.dev/flutter/material/InkResponse-class.html)
  /// classes.
  ///
  /// If `null`, [splashColor] should default to [highlightColor].
  final Color splashColor;

  /// The color used to indicate an active state of toggleable widgets.
  final Color activeColor;

  /// The color used to indicate an inactive (but enabled) state of toggleable
  /// widgets.
  ///
  /// __Note:__ [inactiveColor] is the equivalent of Flutter's Material
  /// [ThemeData.unselectedWidgetColor](https://api.flutter.dev/flutter/material/ThemeData/unselectedWidgetColor.html)
  /// property.
  final Color inactiveColor;

  /// The color used to indicate a widget is disabled (inoperative regardless
  /// of its state.)
  final Color disabledColor;

  /// The color used for error indicators.
  final Color errorColor;

  /// Returns a new [ColorTheme] containing `this` theme's values, where
  /// any `null` values fallback to [colors]' values.
  @override
  ColorTheme merge(ColorTheme colors) {
    assert(colors != null);

    return ColorTheme(
      key: key ?? colors.key,
      primaryColor: primaryColor ?? colors.primaryColor,
      accentColor: accentColor ?? colors.accentColor,
      backgroundColor: backgroundColor ?? colors.backgroundColor,
      buttonColor: buttonColor ?? colors.buttonColor,
      dividerColor: dividerColor ?? colors.dividerColor,
      focusColor: focusColor ?? colors.focusColor,
      hoverColor: hoverColor ?? colors.hoverColor,
      highlightColor: highlightColor ?? colors.highlightColor,
      splashColor: splashColor ?? colors.splashColor,
      activeColor: activeColor ?? colors.activeColor,
      inactiveColor: inactiveColor ?? colors.inactiveColor,
      disabledColor: disabledColor ?? colors.disabledColor,
      errorColor: errorColor ?? colors.errorColor,
    );
  }

  /// Returns the colors from `this` as a Material [ThemeData] object.
  ThemeData toThemeData() => ThemeData(
        primaryColor: primaryColor,
        accentColor: accentColor,
        backgroundColor: backgroundColor,
        buttonColor: buttonColor,
        dividerColor: dividerColor,
        focusColor: focusColor,
        hoverColor: hoverColor,
        highlightColor: highlightColor,
        splashColor: splashColor,
        toggleableActiveColor: activeColor,
        unselectedWidgetColor: inactiveColor,
        disabledColor: disabledColor,
        errorColor: errorColor,
      );

  /// Returns a new [ColorTheme] containing `this` theme's colors, with any
  /// `null` values falling back to your [MaterialApp]'s [ThemeData] object,
  /// or to [ThemeData.fallback] if there is no [Theme] in the given [context].
  ColorTheme withThemeData(BuildContext context) {
    assert(context != null);

    final themeData = Theme.of(context);

    return ColorTheme(
      primaryColor: primaryColor ?? themeData.primaryColor,
      accentColor: accentColor ?? themeData.accentColor,
      backgroundColor: backgroundColor ?? themeData.backgroundColor,
      buttonColor: buttonColor ?? themeData.buttonColor,
      dividerColor: dividerColor ?? themeData.dividerColor,
      focusColor: focusColor ?? themeData.focusColor,
      hoverColor: hoverColor ?? themeData.hoverColor,
      highlightColor: highlightColor ?? themeData.highlightColor,
      splashColor: splashColor ?? themeData.splashColor,
      activeColor: activeColor ?? themeData.toggleableActiveColor,
      inactiveColor: inactiveColor ?? themeData.unselectedWidgetColor,
      disabledColor: disabledColor ?? themeData.disabledColor,
      errorColor: errorColor ?? themeData.errorColor,
    );
  }

  /// The map containing the registered global themes.
  static MergeableObjectMap<ColorTheme> _global =
      MergeableObjectMap<ColorTheme>();

  /// Registers `this` as a global theme, allowing it to be accessed
  /// by the [global] theme constructor/provider and related methods.
  void registerAsGlobal<T>({bool merge = true}) {
    assert(merge != null);

    _global.add<T>(this, key: key, join: merge ? JoinMethod.merge : null);
  }

  /// Creates or retrieves a global [ColorTheme].
  ///
  /// If a global [ColorTheme] associated with the given [key] and sub-type
  /// ([T]) doesn't exist, a new global [ColorTheme] will be created. However,
  /// If one does exist, the existing theme will be returned, if no additional
  /// values were provided.
  ///
  /// If a corresponding global theme does exist and additional values were
  /// provided and [merge] is `true`, the provided values will be merged into
  /// the existing global theme, otherwise if `false`, the existing theme will
  /// be replaced outright by a new [ColorTheme] containing the provided values.
  ///
  /// If [mergeDynamic] is `true` and a global theme associated with the
  /// given [key] and a [dynamic] sub-type exists, it will be [merge]d into
  /// the returned theme.
  static ColorTheme global<T>({
    Key key,
    Color primaryColor,
    Color accentColor,
    Color contrastColor,
    Color backgroundColor,
    Color buttonColor,
    Color dividerColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    Color activeColor,
    Color inactiveColor,
    Color disabledColor,
    Color errorColor,
    bool merge = true,
    bool mergeDynamic = true,
  }) {
    assert(merge != null);
    assert(mergeDynamic != null);

    var colorTheme = ColorTheme(
      primaryColor: primaryColor,
      accentColor: accentColor,
      contrastColor: contrastColor,
      backgroundColor: backgroundColor,
      buttonColor: buttonColor,
      dividerColor: dividerColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      disabledColor: disabledColor,
      errorColor: errorColor,
    );

    if (colorTheme._isEmpty) {
      // Retrieve the existing global theme if no values were provided.
      colorTheme = _global.get<T>(key: key);
    } else {
      // Otherwise, add the new global theme to the global object map,
      // replacing or merging it with the existing global theme, if one
      // exists and [merge] is `true`.
      colorTheme = _global.add<T>(colorTheme,
          key: key, join: merge ? JoinMethod.merge : null);
    }

    // If [mergeDynamic] is `true`, merge the returned theme with
    // the [dynamic] global theme, if one exists.
    if (T != dynamic && mergeDynamic && _global.exists<dynamic>(key: key)) {
      colorTheme = _global.get<dynamic>(key: key).merge(colorTheme);
    }

    return colorTheme;
  }

  /// Returns `true` if a global theme associated with the [key] and
  /// sub-type ([T]) exists.
  static bool globalThemeExists<T>([Key key]) => _global.exists<T>(key: key);

  /// Returns the global theme associated with the [key] and sub-type ([T]).
  ///
  /// Returns `null` if no corresponding global theme exists.
  ///
  /// __Note:__ [dynamic] sub-typed themes will not be merged into the returned
  /// theme, call [ColorTheme.global] to retrieve a theme that is merged with
  /// the [dynamic] sub-typed theme, if one exists.
  static ColorTheme getGlobalTheme<T>([Key key]) => _global.get<T>(key: key);

  /// Removes the global theme associated with the [key] and sub-type ([T]).
  static ColorTheme removeGlobalTheme<T>([Key key]) =>
      _global.remove<T>(key: key);

  /// Returns a new [ColorTheme] by merging [theme] with the global theme
  /// associated with the given [key] and sub-type ([T]).
  ///
  /// If there is no corresponding global theme, [theme] will be returned.
  /// Likewise, if [theme] is `null`, the global theme will be returned.
  ///
  /// If [mergeDynamic] is `true` and the sub-type ([T]) isn't [dynamic], the
  /// global theme associated with the [key] and a [dynamic] sub-type will be
  /// [merge]d into the returned theme, if one exists.
  static ColorTheme mergeWithGlobal<T>(
    ColorTheme theme, {
    Key key,
    bool mergeDynamic = true,
  }) {
    assert(mergeDynamic != null);

    final globalTheme =
        ColorTheme.global<T>(key: key, mergeDynamic: mergeDynamic);

    if (theme == null) {
      return globalTheme;
    }

    if (globalTheme == null) {
      return theme;
    }

    return theme.merge(globalTheme);
  }

  /// Returns `true` if no colors were provided to `this`.
  bool get _isEmpty =>
      primaryColor == null &&
      accentColor == null &&
      contrastColor == null &&
      backgroundColor == null &&
      buttonColor == null &&
      dividerColor == null &&
      focusColor == null &&
      hoverColor == null &&
      highlightColor == null &&
      splashColor == null &&
      activeColor == null &&
      inactiveColor == null &&
      disabledColor == null &&
      errorColor == null;
}
