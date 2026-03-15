import 'package:flutter/material.dart';

import '../tokens/base/seal_dimension.dart';
import '../tokens/base/seal_radius.dart';
import '../tokens/implementations/dark_color_palette.dart';
import '../tokens/implementations/dark_gradients.dart';
import '../tokens/implementations/default_typography.dart';
import '../tokens/implementations/light_color_palette.dart';
import '../tokens/implementations/light_gradients.dart';
import 'seal_theme_tokens.dart';

/// Factory for creating [SealThemeTokens] and Material [ThemeData].
///
/// Call [dark] or [light] to obtain a fully wired theme.
///
/// Pass an optional [scaleFactor] to scale typography proportionally —
/// useful together with [SealResponsive.scaleOf]:
///
/// ```dart
/// final scale = SealResponsive.scaleOf(context);
/// final tokens = SealThemeFactory.darkTokens(scaleFactor: scale);
/// ```
abstract final class SealThemeFactory {
  // ── Token sets ───────────────────────────────────────────────────────

  /// Returns the dark Seal UI token set (primary experience).
  ///
  /// [scaleFactor] adjusts typography font sizes proportionally (default 1.0).
  static SealThemeTokens darkTokens({double scaleFactor = 1.0}) {
    return SealThemeTokens(
      colors: const DarkColorPalette(),
      typography: DefaultTypography(scaleFactor: scaleFactor),
      gradients: const DarkGradients(),
      brightness: Brightness.dark,
    );
  }

  /// Returns the light Seal UI token set.
  ///
  /// [scaleFactor] adjusts typography font sizes proportionally (default 1.0).
  static SealThemeTokens lightTokens({double scaleFactor = 1.0}) {
    return SealThemeTokens(
      colors: const LightColorPalette(),
      typography: DefaultTypography(scaleFactor: scaleFactor),
      gradients: const LightGradients(),
      brightness: Brightness.light,
    );
  }

  // ── ThemeData builders ───────────────────────────────────────────────

  /// Builds a Material 3 dark [ThemeData] from Seal UI tokens.
  static ThemeData dark({double scaleFactor = 1.0}) =>
      _buildTheme(darkTokens(scaleFactor: scaleFactor), Brightness.dark);

  /// Builds a Material 3 light [ThemeData] from Seal UI tokens.
  static ThemeData light({double scaleFactor = 1.0}) =>
      _buildTheme(lightTokens(scaleFactor: scaleFactor), Brightness.light);

  /// Builds a Material 3 [ThemeData] from any [SealThemeTokens] set.
  ///
  /// Use [tokens.brightness] to specify whether to produce a dark or light
  /// Material theme.
  ///
  /// ```dart
  /// final data = SealThemeFactory.buildMaterialTheme(
  ///   NebulaThemeFactory.tokens(),
  ///   Brightness.dark,
  /// );
  /// ```
  static ThemeData buildMaterialTheme(
    SealThemeTokens tokens,
    Brightness brightness,
  ) => _buildTheme(tokens, brightness);

  // ── Internal ─────────────────────────────────────────────────────────

  static const double _kSecondaryContainerOpacity = 0.15;
  static const double _kOutlineVariantOpacity = 0.5;
  static const double _kDividerThickness = 1;
  static const double _kFocusedBorderWidth = 2;

  static ThemeData _buildTheme(SealThemeTokens tokens, Brightness brightness) {
    final colors = tokens.colors;
    final typography = tokens.typography;

    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: colors.primary,
      onPrimary: colors.textPrimary,
      primaryContainer: colors.primaryTint,
      onPrimaryContainer: colors.textPrimary,
      secondary: colors.accent,
      onSecondary: colors.textPrimary,
      secondaryContainer: colors.accent.withValues(
        alpha: _kSecondaryContainerOpacity,
      ),
      onSecondaryContainer: colors.accent,
      tertiary: colors.accentSecondary,
      onTertiary: colors.textPrimary,
      error: colors.error,
      onError: colors.textPrimary,
      surface: colors.surface,
      onSurface: colors.textPrimary,
      surfaceContainerHighest: colors.surfaceAlt,
      outline: colors.border,
      outlineVariant: colors.border.withValues(alpha: _kOutlineVariantOpacity),
    );

    final textTheme = TextTheme(
      displayLarge: typography.display.copyWith(color: colors.textPrimary),
      headlineMedium: typography.headline.copyWith(color: colors.textPrimary),
      titleLarge: typography.title.copyWith(color: colors.textPrimary),
      bodyLarge: typography.body.copyWith(color: colors.textPrimary),
      bodyMedium: typography.small.copyWith(color: colors.textSecondary),
      labelSmall: typography.caption.copyWith(color: colors.textSecondary),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colors.background,
      textTheme: textTheme,
      cardTheme: CardThemeData(
        color: colors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: SealRadius.borderRadiusMd,
          side: BorderSide(color: colors.border),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: colors.border,
        thickness: _kDividerThickness,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surfaceAlt,
        border: OutlineInputBorder(
          borderRadius: SealRadius.borderRadiusSm,
          borderSide: BorderSide(color: colors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: SealRadius.borderRadiusSm,
          borderSide: BorderSide(color: colors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: SealRadius.borderRadiusSm,
          borderSide: BorderSide(
            color: colors.primary,
            width: _kFocusedBorderWidth,
          ),
        ),
        hintStyle: typography.body.copyWith(color: colors.textSecondary),
        labelStyle: typography.small.copyWith(color: colors.textSecondary),
        contentPadding: EdgeInsets.symmetric(
          horizontal: SealDimension().md,
          vertical: SealDimension().sm,
        ),
      ),
    );
  }
}
