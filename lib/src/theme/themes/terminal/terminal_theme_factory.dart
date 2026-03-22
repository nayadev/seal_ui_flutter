import 'dart:ui' show Brightness;

import '../../seal_theme_tokens.dart';
import '../../../tokens/implementations/default_typography.dart';
import 'tokens/terminal_color_palette.dart';
import 'tokens/terminal_gradients.dart';
import 'tokens/terminal_light_color_palette.dart';
import 'tokens/terminal_light_gradients.dart';

/// Factory for creating [SealThemeTokens] for the **Terminal** theme.
///
/// Terminal evokes classic CRT computer terminals — near-black phosphor
/// surfaces, cyan as the primary brand color, and phosphor green as the
/// accent. A light variant channels the look of printed terminal output
/// on paper. Dark is the default and primary experience.
///
/// ```dart
/// // Dark (default):
/// SealThemeController(initialTokens: TerminalThemeFactory.tokens())
///
/// // Light:
/// TerminalThemeFactory.tokens(brightness: Brightness.light)
///
/// // With responsive scaling:
/// TerminalThemeFactory.tokens(scaleFactor: SealResponsive.scaleOf(context))
/// ```
abstract final class TerminalThemeFactory {
  /// Returns the Terminal [SealThemeTokens] set.
  ///
  /// [scaleFactor] adjusts typography font sizes proportionally (default 1.0).
  /// [brightness] selects dark (default) or light variant.
  static SealThemeTokens tokens({
    double scaleFactor = 1.0,
    Brightness brightness = Brightness.dark,
  }) => SealThemeTokens(
    colors: brightness == Brightness.dark
        ? const TerminalColorPalette()
        : const TerminalLightColorPalette(),
    typography: DefaultTypography(scaleFactor: scaleFactor),
    gradients: brightness == Brightness.dark
        ? const TerminalGradients()
        : const TerminalLightGradients(),
    brightness: brightness,
  );
}
