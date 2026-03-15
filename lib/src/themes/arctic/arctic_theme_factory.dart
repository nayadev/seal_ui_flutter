import 'package:flutter/material.dart';

import '../../theme/seal_theme_factory.dart';
import '../../theme/seal_theme_tokens.dart';
import '../../tokens/implementations/default_typography.dart';
import 'tokens/arctic_color_palette.dart';
import 'tokens/arctic_dark_color_palette.dart';
import 'tokens/arctic_gradients.dart';
import 'tokens/arctic_light_gradients.dart';

/// Factory for creating [SealThemeTokens] and Material [ThemeData] for the
/// **Arctic** theme.
///
/// Arctic is bright, icy, and minimal — clean snow-white surfaces with
/// ice-blue and glacier-cyan accents. A dark variant is available via
/// the [brightness] parameter.
///
/// ```dart
/// // Light (default):
/// SealThemeController(initialTokens: ArcticThemeFactory.tokens())
///
/// // Dark:
/// ArcticThemeFactory.tokens(brightness: Brightness.dark)
///
/// // With responsive scaling:
/// ArcticThemeFactory.tokens(scaleFactor: SealResponsive.scaleOf(context))
/// ```
abstract final class ArcticThemeFactory {
  /// Returns the Arctic [SealThemeTokens] set.
  ///
  /// [scaleFactor] adjusts typography font sizes proportionally (default 1.0).
  /// [brightness] selects light (default) or dark variant.
  static SealThemeTokens tokens({
    double scaleFactor = 1.0,
    Brightness brightness = Brightness.light,
  }) => SealThemeTokens(
    colors: brightness == Brightness.light
        ? const ArcticColorPalette()
        : const ArcticDarkColorPalette(),
    typography: DefaultTypography(scaleFactor: scaleFactor),
    gradients: brightness == Brightness.light
        ? const ArcticLightGradients()
        : const ArcticGradients(),
    brightness: brightness,
  );

  /// Builds a Material 3 [ThemeData] styled for the Arctic theme.
  ///
  /// [scaleFactor] adjusts typography proportionally (default 1.0).
  /// [brightness] selects light (default) or dark variant.
  static ThemeData themeData({
    double scaleFactor = 1.0,
    Brightness brightness = Brightness.light,
  }) => SealThemeFactory.buildMaterialTheme(
    tokens(scaleFactor: scaleFactor, brightness: brightness),
    brightness,
  );
}
