import 'package:flutter/widgets.dart';

import 'seal_theme_factory.dart';
import 'seal_theme_provider.dart';
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
/// Checks for a [SealThemeProvider] first (preferred, supports runtime
/// switching), then falls back to a legacy [SealTheme], then to dark defaults.
///
/// Example usage:
/// ```dart
/// final colors = context.themeTokens.colors;
/// final typography = context.themeTokens.typography;
/// final gradients = context.themeTokens.gradients;
/// ```
extension BuildContextSealTheme on BuildContext {
  /// Returns the active [SealThemeTokens] from the nearest ancestor.
  ///
  /// Resolution order:
  /// 1. [SealThemeProvider] — preferred for runtime theme switching.
  /// 2. [SealTheme] — legacy static provider, kept for backward compatibility.
  /// 3. Dark defaults — fallback when no provider is found.
  SealThemeTokens get themeTokens {
    final provider = dependOnInheritedWidgetOfExactType<SealThemeProvider>();
    if (provider != null) return provider.notifier!.tokens;

    // Fall back to legacy SealTheme for backward compatibility.
    final theme = dependOnInheritedWidgetOfExactType<SealTheme>();
    return theme?.tokens ?? SealThemeFactory.darkTokens();
  }
}
