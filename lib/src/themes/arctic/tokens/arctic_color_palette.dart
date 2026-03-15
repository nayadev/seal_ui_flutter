import 'dart:ui';

import '../../../tokens/abstractions/color_palette.dart';
import '../../../tokens/base/seal_state_color.dart';

/// Color palette for the **Arctic** theme.
///
/// Bright, icy, and minimal — clean snow-white surfaces with ice-blue accents.
class ArcticColorPalette extends ColorPalette {
  const ArcticColorPalette();

  // ── Brand ──────────────────────────────────────────────────────────────

  @override
  Color get primary => const Color(0xFF29B6F6);

  @override
  Color get primaryTint => const Color(0xFF81D4FA);

  @override
  Color get primaryShade => const Color(0xFF0288D1);

  // ── Accent ─────────────────────────────────────────────────────────────

  @override
  Color get accent => const Color(0xFF00BCD4);

  @override
  Color get accentSecondary => const Color(0xFF26C6DA);

  @override
  Color get onAccent => const Color(0xFFFFFFFF);

  // ── Surfaces ───────────────────────────────────────────────────────────

  @override
  Color get background => const Color(0xFFF8FBFF);

  @override
  Color get surface => const Color(0xFFFFFFFF);

  @override
  Color get surfaceAlt => const Color(0xFFEAF4FD);

  // ── Text ───────────────────────────────────────────────────────────────

  @override
  Color get textPrimary => const Color(0xFF0A1929);

  @override
  Color get textSecondary => const Color(0xFF546E7A);

  @override
  Color get onPrimary => const Color(0xFFFFFFFF);

  // ── Border ─────────────────────────────────────────────────────────────

  @override
  Color get border => const Color(0xFFB3D9F2);

  // ── Semantic ───────────────────────────────────────────────────────────

  @override
  Color get success => const Color(0xFF26A69A);

  @override
  Color get warning => const Color(0xFFFFA726);

  @override
  Color get error => const Color(0xFFEF5350);

  @override
  Color get info => const Color(0xFF29B6F6);

  // ── State Colors ────────────────────────────────────────────────────────

  @override
  SealStateColor get foreground => SealStateColor(primary);

  @override
  SealStateColor get fill => SealStateColor(primary);
}
