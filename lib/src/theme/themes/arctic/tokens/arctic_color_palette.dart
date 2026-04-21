import 'dart:ui';
import 'package:seal_ui_tokens/seal_ui_tokens.dart';

import '../../../../tokens/abstractions/color_palette.dart';
import '../../../../tokens/base/seal_state_color.dart';

/// Color palette for the **Arctic** theme (light variant).
///
/// Bright, icy, and minimal — clean snow-white surfaces with ice-blue accents.
class ArcticColorPalette extends ColorPalette {
  /// Creates [ArcticColorPalette] tokens.
  const ArcticColorPalette();

  // ── Brand ──────────────────────────────────────────────────────────────

  @override
  Color get primary => SealArcticLightTokens.brandPrimary;

  @override
  Color get primaryTint => SealArcticLightTokens.brandPrimaryTint;

  @override
  Color get primaryShade => SealArcticLightTokens.brandPrimaryShade;

  // ── Accent ─────────────────────────────────────────────────────────────

  @override
  Color get accent => SealArcticLightTokens.accentAccent;

  @override
  Color get accentSecondary => SealArcticLightTokens.accentAccentSecondary;

  @override
  Color get onAccent => SealArcticLightTokens.accentOnAccent;

  // ── Surfaces ───────────────────────────────────────────────────────────

  @override
  Color get background => SealArcticLightTokens.surfaceBackground;

  @override
  Color get surface => SealArcticLightTokens.surfaceSurface;

  @override
  Color get surfaceAlt => SealArcticLightTokens.surfaceSurfaceAlt;

  // ── Text ───────────────────────────────────────────────────────────────

  @override
  Color get textPrimary => SealArcticLightTokens.textPrimary;

  @override
  Color get textSecondary => SealArcticLightTokens.textSecondary;

  @override
  Color get onPrimary => SealArcticLightTokens.textOnPrimary;

  // ── Border ─────────────────────────────────────────────────────────────

  @override
  Color get border => SealArcticLightTokens.borderDefault;

  // ── Semantic ───────────────────────────────────────────────────────────

  @override
  Color get success => SealArcticLightTokens.semanticSuccess;

  @override
  Color get warning => SealArcticLightTokens.semanticWarning;

  @override
  Color get error => SealArcticLightTokens.semanticError;

  @override
  Color get info => SealArcticLightTokens.semanticInfo;

  // ── State Colors ────────────────────────────────────────────────────────

  @override
  SealStateColor get foreground =>
      SealStateColor(SealArcticLightTokens.stateForegroundActive);

  @override
  SealStateColor get fill =>
      SealStateColor(SealArcticLightTokens.stateFillActive);
}
