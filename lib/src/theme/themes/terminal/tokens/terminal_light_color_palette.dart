import 'dart:ui';
import 'package:seal_ui_tokens/seal_ui_tokens.dart';

import '../../../../tokens/abstractions/color_palette.dart';
import '../../../../tokens/base/seal_state_color.dart';

/// Light-mode color palette for the **Terminal** theme.
///
/// Evokes printed terminal output on paper — off-white surfaces with
/// a faint cyan cast, dark cyan as the primary, and dark gray as the accent.
/// Text on filled elements stays light for contrast even in light mode.
class TerminalLightColorPalette extends ColorPalette {
  /// Creates [TerminalLightColorPalette] tokens.
  const TerminalLightColorPalette();

  // ── Brand ──────────────────────────────────────────────────────────────

  @override
  Color get primary => SealTerminalLightTokens.brandPrimary;

  @override
  Color get primaryTint => SealTerminalLightTokens.brandPrimaryTint;

  @override
  Color get primaryShade => SealTerminalLightTokens.brandPrimaryShade;

  // ── Accent ─────────────────────────────────────────────────────────────

  /// Dark gray with a subtle teal undertone — secondary color in the terminal palette.
  @override
  Color get accent => SealTerminalLightTokens.accentAccent;

  @override
  Color get accentSecondary => SealTerminalLightTokens.accentAccentSecondary;

  /// Light text on dark gray — maintains contrast on filled accent surfaces.
  @override
  Color get onAccent => SealTerminalLightTokens.accentOnAccent;

  // ── Surfaces ───────────────────────────────────────────────────────────

  /// Off-white with a faint cyan tint — reminiscent of terminal paper printouts.
  @override
  Color get background => SealTerminalLightTokens.surfaceBackground;

  @override
  Color get surface => SealTerminalLightTokens.surfaceSurface;

  @override
  Color get surfaceAlt => SealTerminalLightTokens.surfaceSurfaceAlt;

  // ── Text ───────────────────────────────────────────────────────────────

  @override
  Color get textPrimary => SealTerminalLightTokens.textPrimary;

  @override
  Color get textSecondary => SealTerminalLightTokens.textSecondary;

  /// Light text on dark cyan fill — ensures contrast on primary-colored buttons.
  @override
  Color get onPrimary => SealTerminalLightTokens.textOnPrimary;

  // ── Border ─────────────────────────────────────────────────────────────

  @override
  Color get border => SealTerminalLightTokens.borderDefault;

  // ── Semantic ───────────────────────────────────────────────────────────

  @override
  Color get success => SealTerminalLightTokens.semanticSuccess;

  @override
  Color get warning => SealTerminalLightTokens.semanticWarning;

  @override
  Color get error => SealTerminalLightTokens.semanticError;

  @override
  Color get info => SealTerminalLightTokens.semanticInfo;

  // ── State Colors ────────────────────────────────────────────────────────

  @override
  SealStateColor get foreground =>
      SealStateColor(SealTerminalLightTokens.stateForegroundActive);

  @override
  SealStateColor get fill =>
      SealStateColor(SealTerminalLightTokens.stateFillActive);
}
