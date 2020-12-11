import 'package:flutter/material.dart' show ThemeData;
import 'package:flutter/widgets.dart';

/// A general purpose color theming solution for modular Flutter packages,
/// with a collection of pre-defined themes, derived from Flutter's Material
/// [ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html)
/// class.
  /// A general purpose color theming solution for modular Flutter packages,
  /// with a collection of pre-defined themes, derived from Flutter's Material
  /// [ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html)
  /// class.
  const ColorTheme({
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

  /// Returns a new [ColorTheme] with the values of [colors], where
  /// any `null` values default to the values of `this`.
  ColorTheme merge(ColorTheme colors) {
    assert(colors != null);

    return ColorTheme(
      primaryColor: colors.primaryColor ?? primaryColor,
      accentColor: colors.accentColor ?? accentColor,
      backgroundColor: colors.backgroundColor ?? backgroundColor,
      dividerColor: colors.dividerColor ?? dividerColor,
      focusColor: colors.focusColor ?? focusColor,
      hoverColor: colors.hoverColor ?? hoverColor,
      highlightColor: colors.highlightColor ?? highlightColor,
      splashColor: colors.splashColor ?? splashColor,
      activeColor: colors.activeColor ?? activeColor,
      inactiveColor: colors.inactiveColor ?? inactiveColor,
      disabledColor: colors.disabledColor ?? disabledColor,
      errorColor: colors.errorColor ?? errorColor,
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
}

/// Adds the [colorTheme] and [materialColorTheme] getters to [BuildContext].
extension GetColorTheme on BuildContext {
  /// Gets the [ColorTheme] from the context via a [Provider].
  ColorTheme get colorTheme => watch<ColorTheme>();
}
