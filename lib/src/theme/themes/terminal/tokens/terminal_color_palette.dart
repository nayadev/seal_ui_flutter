import 'dart:ui';
import 'package:seal_ui_tokens/seal_ui_tokens.dart';

import '../../../../tokens/abstractions/color_palette.dart';
import '../../../../tokens/base/seal_state_color.dart';

/// Dark-mode color palette for the **Terminal** theme.
///
/// Evokes classic CRT computer terminals: near-black surfaces with
/// a faint phosphor teal cast, cyan as the primary brand color, and
/// phosphor green as the accent. Text is bright cyan-white for that
/// authentic glow-on-screen feel.
class TerminalColorPalette extends ColorPalette {
  /// Creates [TerminalColorPalette] tokens.
  const TerminalColorPalette();

  // ── Brand ──────────────────────────────────────────────────────────────

  @override
  Color get primary => SealTerminalDarkTokens.brandPrimary;

  @override
  Color get primaryTint => SealTerminalDarkTokens.brandPrimaryTint;

  @override
  Color get primaryShade => SealTerminalDarkTokens.brandPrimaryShade;

  // ── Accent ─────────────────────────────────────────────────────────────

  /// Medium gray with a teal cast — visible against the near-black background.
  @override
  Color get accent => SealTerminalDarkTokens.accentAccent;

  @override
  Color get accentSecondary => SealTerminalDarkTokens.accentAccentSecondary;

  /// Light cyan-white on dark gray — ensures readability on accent-filled surfaces.
  @override
  Color get onAccent => SealTerminalDarkTokens.accentOnAccent;

  // ── Surfaces ───────────────────────────────────────────────────────────

  /// Near-black with a faint teal phosphor cast — like a powered-on CRT.
  @override
  Color get background => SealTerminalDarkTokens.surfaceBackground;

  @override
  Color get surface => SealTerminalDarkTokens.surfaceSurface;

  @override
  Color get surfaceAlt => SealTerminalDarkTokens.surfaceSurfaceAlt;

  // ── Text ───────────────────────────────────────────────────────────────

  /// Bright cyan-white — the classic glowing terminal text.
  @override
  Color get textPrimary => SealTerminalDarkTokens.textPrimary;

  @override
  Color get textSecondary => SealTerminalDarkTokens.textSecondary;

  /// Light cyan-white on cyan fill — fulfills the light-on-button requirement.
  @override
  Color get onPrimary => SealTerminalDarkTokens.textOnPrimary;

  // ── Border ─────────────────────────────────────────────────────────────

  @override
  Color get border => SealTerminalDarkTokens.borderDefault;

  // ── Semantic ───────────────────────────────────────────────────────────

  /// Phosphor green doubles as success — consistent with the terminal aesthetic.
  @override
  Color get success => SealTerminalDarkTokens.semanticSuccess;

  /// Amber — the classic terminal warning color.
  @override
  Color get warning => SealTerminalDarkTokens.semanticWarning;

  @override
  Color get error => SealTerminalDarkTokens.semanticError;

  @override
  Color get info => SealTerminalDarkTokens.semanticInfo;

  // ── State Colors ────────────────────────────────────────────────────────

  @override
  SealStateColor get foreground =>
      SealStateColor(SealTerminalDarkTokens.stateForegroundActive);

  @override
  SealStateColor get fill =>
      SealStateColor(SealTerminalDarkTokens.stateFillActive);
}
