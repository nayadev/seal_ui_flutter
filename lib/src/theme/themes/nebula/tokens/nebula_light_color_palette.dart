import 'dart:ui';
import 'package:seal_ui_tokens/seal_ui_tokens.dart';

import '../../../../tokens/abstractions/color_palette.dart';
import '../../../../tokens/base/seal_state_color.dart';

/// Light-mode color palette for the **Nebula** theme.
///
/// Preserves the purple/teal brand identity of Nebula on bright,
/// airy surfaces. Use [NebulaColorPalette] for the canonical dark variant.
class NebulaLightColorPalette extends ColorPalette {
  /// Creates [NebulaLightColorPalette] tokens.
  const NebulaLightColorPalette();

  // ── Brand ──────────────────────────────────────────────────────────────

  @override
  Color get primary => SealNebulaLightTokens.brandPrimary;

  @override
  Color get primaryTint => SealNebulaLightTokens.brandPrimaryTint;

  @override
  Color get primaryShade => SealNebulaLightTokens.brandPrimaryShade;

  // ── Accent ─────────────────────────────────────────────────────────────

  @override
  Color get accent => SealNebulaLightTokens.accentAccent;

  @override
  Color get accentSecondary => SealNebulaLightTokens.accentAccentSecondary;

  @override
  Color get onAccent => SealNebulaLightTokens.accentOnAccent;

  // ── Surfaces ───────────────────────────────────────────────────────────

  @override
  Color get background => SealNebulaLightTokens.surfaceBackground;

  @override
  Color get surface => SealNebulaLightTokens.surfaceSurface;

  @override
  Color get surfaceAlt => SealNebulaLightTokens.surfaceSurfaceAlt;

  // ── Text ───────────────────────────────────────────────────────────────

  @override
  Color get textPrimary => SealNebulaLightTokens.textPrimary;

  @override
  Color get textSecondary => SealNebulaLightTokens.textSecondary;

  @override
  Color get onPrimary => SealNebulaLightTokens.textOnPrimary;

  // ── Border ─────────────────────────────────────────────────────────────

  @override
  Color get border => SealNebulaLightTokens.borderDefault;

  // ── Semantic ───────────────────────────────────────────────────────────

  @override
  Color get success => SealNebulaLightTokens.semanticSuccess;

  @override
  Color get warning => SealNebulaLightTokens.semanticWarning;

  @override
  Color get error => SealNebulaLightTokens.semanticError;

  @override
  Color get info => SealNebulaLightTokens.semanticInfo;

  // ── State Colors ────────────────────────────────────────────────────────

  @override
  SealStateColor get foreground =>
      SealStateColor(SealNebulaLightTokens.stateForegroundActive);

  @override
  SealStateColor get fill =>
      SealStateColor(SealNebulaLightTokens.stateFillActive);
}
