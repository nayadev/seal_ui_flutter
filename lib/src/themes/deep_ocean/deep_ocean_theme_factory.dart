import 'dart:ui' show Brightness;

import '../../theme/seal_theme_tokens.dart';
import '../../tokens/implementations/default_typography.dart';
import 'tokens/deep_ocean_color_palette.dart';
import 'tokens/deep_ocean_gradients.dart';
import 'tokens/deep_ocean_light_color_palette.dart';
import 'tokens/deep_ocean_light_gradients.dart';

/// Factory for creating [SealThemeTokens] for the
/// **Deep Ocean** theme.
///
/// Deep Ocean is dark, deep, and luminous — midnight navy surfaces with
/// electric cyan accents that glow against the inky background. A light
/// variant is available via the [brightness] parameter.
///
/// ```dart
/// // Dark (default):
/// SealThemeController(initialTokens: DeepOceanThemeFactory.tokens())
///
/// // Light:
/// DeepOceanThemeFactory.tokens(brightness: Brightness.light)
///
/// // With responsive scaling:
/// DeepOceanThemeFactory.tokens(scaleFactor: SealResponsive.scaleOf(context))
/// ```
abstract final class DeepOceanThemeFactory {
  /// Returns the Deep Ocean [SealThemeTokens] set.
  ///
  /// [scaleFactor] adjusts typography font sizes proportionally (default 1.0).
  /// [brightness] selects dark (default) or light variant.
  static SealThemeTokens tokens({
    double scaleFactor = 1.0,
    Brightness brightness = Brightness.dark,
  }) => SealThemeTokens(
    colors: brightness == Brightness.dark
        ? const DeepOceanColorPalette()
        : const DeepOceanLightColorPalette(),
    typography: DefaultTypography(scaleFactor: scaleFactor),
    gradients: brightness == Brightness.dark
        ? const DeepOceanGradients()
        : const DeepOceanLightGradients(),
    brightness: brightness,
  );

}
