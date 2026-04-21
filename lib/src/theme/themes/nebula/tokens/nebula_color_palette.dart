import 'dart:ui';
import 'package:seal_ui_tokens/seal_ui_tokens.dart';

import '../../../../tokens/abstractions/color_palette.dart';
import '../../../../tokens/base/seal_state_color.dart';

/// Color palette for the **Nebula** theme — the primary Seal UI experience.
///
/// Deep, space-inspired backgrounds with vibrant purple accents.
class NebulaColorPalette extends ColorPalette {
  /// Creates [NebulaColorPalette] tokens.
  const NebulaColorPalette();

  // ── Brand ──────────────────────────────────────────────────────────────

  @override
  Color get primary => SealNebulaDarkTokens.brandPrimary;

  @override
  Color get primaryTint => SealNebulaDarkTokens.brandPrimaryTint;

  @override
  Color get primaryShade => SealNebulaDarkTokens.brandPrimaryShade;

  // ── Accent ─────────────────────────────────────────────────────────────────

  @override
  Color get accent => SealNebulaDarkTokens.accentAccent;

  @override
  Color get accentSecondary => SealNebulaDarkTokens.accentAccentSecondary;

  @override
  Color get onAccent => SealNebulaDarkTokens.accentOnAccent;

  // ── Surfaces ───────────────────────────────────────────────────────────

  @override
  Color get background => SealNebulaDarkTokens.surfaceBackground;

  @override
  Color get surface => SealNebulaDarkTokens.surfaceSurface;

  @override
  Color get surfaceAlt => SealNebulaDarkTokens.surfaceSurfaceAlt;

  // ── Text ───────────────────────────────────────────────────────────────

  @override
  Color get textPrimary => SealNebulaDarkTokens.textPrimary;

  @override
  Color get textSecondary => SealNebulaDarkTokens.textSecondary;

  @override
  Color get onPrimary => SealNebulaDarkTokens.textOnPrimary;

  // ── Border ─────────────────────────────────────────────────────────────

  @override
  Color get border => SealNebulaDarkTokens.borderDefault;

  // ── Semantic ───────────────────────────────────────────────────────────

  @override
  Color get success => SealNebulaDarkTokens.semanticSuccess;

  @override
  Color get warning => SealNebulaDarkTokens.semanticWarning;

  @override
  Color get error => SealNebulaDarkTokens.semanticError;

  @override
  Color get info => SealNebulaDarkTokens.semanticInfo;

  // ── State Colors ────────────────────────────────────────────────────────

  @override
  SealStateColor get foreground =>
      SealStateColor(SealNebulaDarkTokens.stateForegroundActive);

  @override
  SealStateColor get fill =>
      SealStateColor(SealNebulaDarkTokens.stateFillActive);
}
