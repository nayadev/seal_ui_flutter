import 'dart:ui';
import 'package:seal_ui_tokens/seal_ui_tokens.dart';

import '../../../../tokens/abstractions/color_palette.dart';
import '../../../../tokens/base/seal_state_color.dart';

/// Color palette for the **Deep Ocean** theme (dark variant).
///
/// Dark, deep, and luminous — midnight navy surfaces with cyan glow accents.
class DeepOceanColorPalette extends ColorPalette {
  /// Creates [DeepOceanColorPalette] tokens.
  const DeepOceanColorPalette();

  // ── Brand ──────────────────────────────────────────────────────────────

  @override
  Color get primary => SealDeepOceanDarkTokens.brandPrimary;

  @override
  Color get primaryTint => SealDeepOceanDarkTokens.brandPrimaryTint;

  @override
  Color get primaryShade => SealDeepOceanDarkTokens.brandPrimaryShade;

  // ── Accent ─────────────────────────────────────────────────────────────

  @override
  Color get accent => SealDeepOceanDarkTokens.accentAccent;

  @override
  Color get accentSecondary => SealDeepOceanDarkTokens.accentAccentSecondary;

  @override
  Color get onAccent => SealDeepOceanDarkTokens.accentOnAccent;

  // ── Surfaces ───────────────────────────────────────────────────────────

  @override
  Color get background => SealDeepOceanDarkTokens.surfaceBackground;

  @override
  Color get surface => SealDeepOceanDarkTokens.surfaceSurface;

  @override
  Color get surfaceAlt => SealDeepOceanDarkTokens.surfaceSurfaceAlt;

  // ── Text ───────────────────────────────────────────────────────────────

  @override
  Color get textPrimary => SealDeepOceanDarkTokens.textPrimary;

  @override
  Color get textSecondary => SealDeepOceanDarkTokens.textSecondary;

  @override
  Color get onPrimary => SealDeepOceanDarkTokens.textOnPrimary;

  // ── Border ─────────────────────────────────────────────────────────────

  @override
  Color get border => SealDeepOceanDarkTokens.borderDefault;

  // ── Semantic ───────────────────────────────────────────────────────────

  @override
  Color get success => SealDeepOceanDarkTokens.semanticSuccess;

  @override
  Color get warning => SealDeepOceanDarkTokens.semanticWarning;

  @override
  Color get error => SealDeepOceanDarkTokens.semanticError;

  @override
  Color get info => SealDeepOceanDarkTokens.semanticInfo;

  // ── State Colors ────────────────────────────────────────────────────────

  @override
  SealStateColor get foreground =>
      SealStateColor(SealDeepOceanDarkTokens.stateForegroundActive);

  @override
  SealStateColor get fill =>
      SealStateColor(SealDeepOceanDarkTokens.stateFillActive);
}
