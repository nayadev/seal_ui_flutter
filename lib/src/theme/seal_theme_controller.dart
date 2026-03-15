import 'package:flutter/foundation.dart';

import 'seal_theme_tokens.dart';

/// Manages the active [SealThemeTokens] and notifies listeners on changes.
///
/// Pair with [SealThemeProvider] to enable runtime theme switching across the
/// widget tree.
///
/// ```dart
/// final controller = SealThemeController(
///   initialTokens: NebulaThemeFactory.tokens(),
/// );
///
/// // Later, switch to a different theme:
/// controller.setTheme(ArcticThemeFactory.tokens());
/// ```
class SealThemeController extends ChangeNotifier {
  /// Creates a controller with the given [initialTokens].
  SealThemeController({required SealThemeTokens initialTokens})
    : _tokens = initialTokens;

  SealThemeTokens _tokens;

  /// The currently active design tokens.
  SealThemeTokens get tokens => _tokens;

  /// Switches the active theme to [tokens] and notifies all listeners.
  ///
  /// Does nothing if [tokens] is identical to the current tokens.
  void setTheme(SealThemeTokens tokens) {
    if (_tokens == tokens) return;
    _tokens = tokens;
    notifyListeners();
  }
}
