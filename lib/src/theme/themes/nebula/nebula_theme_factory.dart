import 'dart:ui' show Brightness;

import '../../seal_theme_tokens.dart';
import '../../../tokens/implementations/default_typography.dart';
import 'tokens/nebula_color_palette.dart';
import 'tokens/nebula_gradients.dart';
import 'tokens/nebula_light_color_palette.dart';
import 'tokens/nebula_light_gradients.dart';

/// Factory for creating [SealThemeTokens] for the
/// **Nebula** theme.
///
/// Nebula is the primary Seal UI experience — dark, space-inspired surfaces
/// with vibrant purple accents and a purple → blue gradient identity.
/// A light variant is available via the [brightness] parameter.
///
/// ```dart
/// // Dark (default):
/// SealThemeController(initialTokens: NebulaThemeFactory.tokens())
///
/// // Light:
/// NebulaThemeFactory.tokens(brightness: Brightness.light)
///
/// // With responsive scaling:
/// NebulaThemeFactory.tokens(scaleFactor: SealResponsive.scaleOf(context))
/// ```
abstract final class NebulaThemeFactory {
  /// Returns the Nebula [SealThemeTokens] set.
  ///
  /// [scaleFactor] adjusts typography font sizes proportionally (default 1.0).
  /// [brightness] selects dark (default) or light variant.
  static SealThemeTokens tokens({
    double scaleFactor = 1.0,
    Brightness brightness = Brightness.dark,
  }) => SealThemeTokens(
    colors: brightness == Brightness.dark
        ? const NebulaColorPalette()
        : const NebulaLightColorPalette(),
    typography: DefaultTypography(scaleFactor: scaleFactor),
    gradients: brightness == Brightness.dark
        ? const NebulaGradients()
        : const NebulaLightGradients(),
    brightness: brightness,
  );

}
