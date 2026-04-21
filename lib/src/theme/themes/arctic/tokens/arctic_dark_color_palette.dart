import 'dart:ui';
import 'package:seal_ui_tokens/seal_ui_tokens.dart';

import '../../../../tokens/abstractions/color_palette.dart';
import '../../../../tokens/base/seal_state_color.dart';

/// Dark-mode color palette for the **Arctic** theme.
///
/// Icy blue brand identity on deep, cool-toned dark surfaces.
/// Use [ArcticColorPalette] for the canonical light variant.
class ArcticDarkColorPalette extends ColorPalette {
  /// Creates [ArcticDarkColorPalette] tokens.
  const ArcticDarkColorPalette();

  // ── Brand ──────────────────────────────────────────────────────────────

  @override
  Color get primary => SealArcticDarkTokens.brandPrimary;

  @override
  Color get primaryTint => SealArcticDarkTokens.brandPrimaryTint;

  @override
  Color get primaryShade => SealArcticDarkTokens.brandPrimaryShade;

  // ── Accent ─────────────────────────────────────────────────────────────

  @override
  Color get accent => SealArcticDarkTokens.accentAccent;

  @override
  Color get accentSecondary => SealArcticDarkTokens.accentAccentSecondary;

  @override
  Color get onAccent => SealArcticDarkTokens.accentOnAccent;

  // ── Surfaces ───────────────────────────────────────────────────────────

  @override
  Color get background => SealArcticDarkTokens.surfaceBackground;

  @override
  Color get surface => SealArcticDarkTokens.surfaceSurface;

  @override
  Color get surfaceAlt => SealArcticDarkTokens.surfaceSurfaceAlt;

  // ── Text ───────────────────────────────────────────────────────────────

  @override
  Color get textPrimary => SealArcticDarkTokens.textPrimary;

  @override
  Color get textSecondary => SealArcticDarkTokens.textSecondary;

  @override
  Color get onPrimary => SealArcticDarkTokens.textOnPrimary;

  // ── Border ─────────────────────────────────────────────────────────────

  @override
  Color get border => SealArcticDarkTokens.borderDefault;

  // ── Semantic ───────────────────────────────────────────────────────────

  @override
  Color get success => SealArcticDarkTokens.semanticSuccess;

  @override
  Color get warning => SealArcticDarkTokens.semanticWarning;

  @override
  Color get error => SealArcticDarkTokens.semanticError;

  @override
  Color get info => SealArcticDarkTokens.semanticInfo;

  // ── State Colors ────────────────────────────────────────────────────────

  @override
  SealStateColor get foreground =>
      SealStateColor(SealArcticDarkTokens.stateForegroundActive);

  @override
  SealStateColor get fill =>
      SealStateColor(SealArcticDarkTokens.stateFillActive);
}
