import 'package:flutter/widgets.dart';

import 'seal_theme_factory.dart';
import 'seal_theme_tokens.dart';

/// An [InheritedWidget] that makes [SealThemeTokens] available to the widget
/// tree.
///
/// Wrap your app (or a subtree) with [SealTheme] to give components access to
/// design tokens via [SealTheme.of].
///
/// ```dart
/// SealTheme(
///   tokens: SealThemeFactory.darkTokens(),
///   child: MyApp(),
/// )
/// ```
class SealTheme extends InheritedWidget {
  const SealTheme({super.key, required this.tokens, required super.child});

  /// The current Seal UI design tokens.
  final SealThemeTokens tokens;

  /// Retrieves the nearest [SealThemeTokens] from the widget tree.
  ///
  /// Falls back to the dark token set when no ancestor [SealTheme] is found.
  static SealThemeTokens of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<SealTheme>();
    return widget?.tokens ?? SealThemeFactory.darkTokens();
  }

  @override
  bool updateShouldNotify(SealTheme oldWidget) => tokens != oldWidget.tokens;
}

/// Convenience extension to access [SealThemeTokens] directly from a [BuildContext].
///
/// Example usage:
/// ```dart
/// final colors = context.themeTokens.colors;
/// final typography = context.themeTokens.typography;
/// final gradients = context.themeTokens.gradients;
/// ```
extension BuildContextSealTheme on BuildContext {
  /// Shortcut to access [SealThemeTokens] directly from a [BuildContext].
  /// Equivalent to `SealTheme.of(context)`.
  SealThemeTokens get themeTokens => SealTheme.of(this);
}
