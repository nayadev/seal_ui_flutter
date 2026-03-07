import 'package:flutter/widgets.dart';

import 'nebula_theme_factory.dart';
import 'nebula_theme_tokens.dart';

/// An [InheritedWidget] that makes [NebulaThemeTokens] available to the widget
/// tree.
///
/// Wrap your app (or a subtree) with [NebulaTheme] to give components access to
/// design tokens via [NebulaTheme.of].
///
/// ```dart
/// NebulaTheme(
///   tokens: NebulaThemeFactory.darkTokens(),
///   child: MyApp(),
/// )
/// ```
class NebulaTheme extends InheritedWidget {
  const NebulaTheme({super.key, required this.tokens, required super.child});

  /// The current Nebula UI design tokens.
  final NebulaThemeTokens tokens;

  /// Retrieves the nearest [NebulaThemeTokens] from the widget tree.
  ///
  /// Falls back to the dark token set when no ancestor [NebulaTheme] is found.
  static NebulaThemeTokens of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<NebulaTheme>();
    return widget?.tokens ?? NebulaThemeFactory.darkTokens();
  }

  @override
  bool updateShouldNotify(NebulaTheme oldWidget) => tokens != oldWidget.tokens;
}

/// Convenience extension to access [NebulaThemeTokens] directly from a [BuildContext].
///
/// Example usage:
/// ```dart
/// final colors = context.themeTokens.colors;
/// final typography = context.themeTokens.typography;
/// final gradients = context.themeTokens.gradients;
/// ```
extension BuildContextNebulaTheme on BuildContext {
  /// Shortcut to access [NebulaThemeTokens] directly from a [BuildContext].
  /// Equivalent to `NebulaTheme.of(context)`.
  NebulaThemeTokens get themeTokens => NebulaTheme.of(this);
}
