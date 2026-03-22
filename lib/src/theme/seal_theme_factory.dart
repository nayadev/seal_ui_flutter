import 'dart:ui' show Brightness;

import 'package:shadcn_ui/shadcn_ui.dart';

import 'themes/nebula/nebula_theme_factory.dart';
import '../tokens/base/seal_radius.dart';
import 'seal_theme_tokens.dart';

/// Factory for creating [SealThemeTokens] and [ShadThemeData] for the
/// built-in Seal UI token sets.
///
/// The default theme is **Nebula** — dark, space-inspired surfaces with
/// vibrant purple accents. Pass an optional [scaleFactor] to scale typography
/// proportionally, useful together with [SealResponsive.scaleOf]:
///
/// ```dart
/// final scale = SealResponsive.scaleOf(context);
/// final tokens = SealThemeFactory.darkTokens(scaleFactor: scale);
/// ```
abstract final class SealThemeFactory {
  // ── Token sets ───────────────────────────────────────────────────────

  /// Returns the default dark token set (Nebula theme).
  ///
  /// [scaleFactor] adjusts typography font sizes proportionally (default 1.0).
  static SealThemeTokens darkTokens({double scaleFactor = 1.0}) =>
      NebulaThemeFactory.tokens(scaleFactor: scaleFactor);

  /// Returns the default light token set (Nebula light theme).
  ///
  /// [scaleFactor] adjusts typography font sizes proportionally (default 1.0).
  static SealThemeTokens lightTokens({double scaleFactor = 1.0}) =>
      NebulaThemeFactory.tokens(
        scaleFactor: scaleFactor,
        brightness: Brightness.light,
      );

  // ── Shad theme builder ────────────────────────────────────────────────

  /// Builds a [ShadThemeData] from the given [SealThemeTokens].
  ///
  /// Maps Seal UI's color palette and radius tokens to shadcn_ui's
  /// [ShadColorScheme] so that all shadcn_ui components adopt Seal's visual
  /// identity automatically.
  static ShadThemeData buildShadTheme(SealThemeTokens tokens) {
    final colors = tokens.colors;
    final typo = tokens.typography;
    return ShadThemeData(
      textTheme: ShadTextTheme(
        h1Large: typo.h1Large,
        h1: typo.h1,
        h2: typo.h2,
        h3: typo.h3,
        h4: typo.h4,
        p: typo.p,
        blockquote: typo.blockquote,
        table: typo.table,
        list: typo.list,
        lead: typo.lead,
        large: typo.large,
        small: typo.small,
        muted: typo.muted,
      ),
      colorScheme: ShadColorScheme(
        background: colors.background,
        foreground: colors.textPrimary,
        card: colors.surface,
        cardForeground: colors.textPrimary,
        popover: colors.surface,
        popoverForeground: colors.textPrimary,
        primary: colors.fill.active,
        primaryForeground: colors.onPrimary,
        secondary: colors.surfaceAlt,
        secondaryForeground: colors.textPrimary,
        muted: colors.surfaceAlt,
        mutedForeground: colors.textSecondary,
        accent: colors.accent,
        accentForeground: colors.onAccent,
        destructive: colors.error,
        destructiveForeground: colors.onPrimary,
        border: colors.border,
        input: colors.border,
        ring: colors.primary,
        selection: colors.primary.withValues(alpha: _kSelectionOpacity),
      ),
      brightness: tokens.brightness,
      radius: SealRadius.borderRadiusSm,
    );
  }

  // ── Internal ─────────────────────────────────────────────────────────

  static const double _kSelectionOpacity = 0.3;
}
