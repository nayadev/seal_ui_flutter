import 'dart:ui';
import 'package:seal_ui_tokens/seal_ui_tokens.dart';

import '../../../../tokens/abstractions/color_palette.dart';
import '../../../../tokens/base/seal_state_color.dart';

/// Light-mode color palette for the **Deep Ocean** theme.
///
/// Navy and cyan brand identity on clean, bright surfaces.
/// Use [DeepOceanColorPalette] for the canonical dark variant.
class DeepOceanLightColorPalette extends ColorPalette {
  /// Creates [DeepOceanLightColorPalette] tokens.
  const DeepOceanLightColorPalette();

  // ── Brand ──────────────────────────────────────────────────────────────

  @override
  Color get primary => SealDeepOceanLightTokens.brandPrimary;

  @override
  Color get primaryTint => SealDeepOceanLightTokens.brandPrimaryTint;

  @override
  Color get primaryShade => SealDeepOceanLightTokens.brandPrimaryShade;

  // ── Accent ─────────────────────────────────────────────────────────────

  @override
  Color get accent => SealDeepOceanLightTokens.accentAccent;

  @override
  Color get accentSecondary => SealDeepOceanLightTokens.accentAccentSecondary;

  @override
  Color get onAccent => SealDeepOceanLightTokens.accentOnAccent;

  // ── Surfaces ───────────────────────────────────────────────────────────

  @override
  Color get background => SealDeepOceanLightTokens.surfaceBackground;

  @override
  Color get surface => SealDeepOceanLightTokens.surfaceSurface;

  @override
  Color get surfaceAlt => SealDeepOceanLightTokens.surfaceSurfaceAlt;

  // ── Text ───────────────────────────────────────────────────────────────

  @override
  Color get textPrimary => SealDeepOceanLightTokens.textPrimary;

  @override
  Color get textSecondary => SealDeepOceanLightTokens.textSecondary;

  @override
  Color get onPrimary => SealDeepOceanLightTokens.textOnPrimary;

  // ── Border ─────────────────────────────────────────────────────────────

  @override
  Color get border => SealDeepOceanLightTokens.borderDefault;

  // ── Semantic ───────────────────────────────────────────────────────────

  @override
  Color get success => SealDeepOceanLightTokens.semanticSuccess;

  @override
  Color get warning => SealDeepOceanLightTokens.semanticWarning;

  @override
  Color get error => SealDeepOceanLightTokens.semanticError;

  @override
  Color get info => SealDeepOceanLightTokens.semanticInfo;

  // ── State Colors ────────────────────────────────────────────────────────

  @override
  SealStateColor get foreground =>
      SealStateColor(SealDeepOceanLightTokens.stateForegroundActive);

  @override
  SealStateColor get fill =>
      SealStateColor(SealDeepOceanLightTokens.stateFillActive);
}
