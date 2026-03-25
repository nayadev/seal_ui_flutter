import 'dart:ui';

import '../../../../tokens/abstractions/color_palette.dart';
import '../../../../tokens/base/seal_state_color.dart';

/// Color palette for the **Deep Ocean** theme.
///
/// Dark, deep, and luminous — midnight navy surfaces with cyan glow accents.
class DeepOceanColorPalette extends ColorPalette {
  /// Creates [DeepOceanColorPalette] tokens.
  const DeepOceanColorPalette();

  // ── Brand ──────────────────────────────────────────────────────────────

  @override
  Color get primary => const Color(0xFF1976D2);

  @override
  Color get primaryTint => const Color(0xFF42A5F5);

  @override
  Color get primaryShade => const Color(0xFF0D47A1);

  // ── Accent ─────────────────────────────────────────────────────────────

  @override
  Color get accent => const Color(0xFF00E5FF);

  @override
  Color get accentSecondary => const Color(0xFF40C4FF);

  @override
  Color get onAccent => const Color(0xFFE8F4FC);

  // ── Surfaces ───────────────────────────────────────────────────────────

  @override
  Color get background => const Color(0xFF020B18);

  @override
  Color get surface => const Color(0xFF071524);

  @override
  Color get surfaceAlt => const Color(0xFF0D2137);

  // ── Text ───────────────────────────────────────────────────────────────

  @override
  Color get textPrimary => const Color(0xFFE8F4FC);

  @override
  Color get textSecondary => const Color(0xFF6EA8C4);

  @override
  Color get onPrimary => const Color(0xFFE8F4FC);

  // ── Border ─────────────────────────────────────────────────────────────

  @override
  Color get border => const Color(0xFF0D2B45);

  // ── Semantic ───────────────────────────────────────────────────────────

  @override
  Color get success => const Color(0xFF1DE9B6);

  @override
  Color get warning => const Color(0xFFFF9800);

  @override
  Color get error => const Color(0xFFFF5252);

  @override
  Color get info => const Color(0xFF40C4FF);

  // ── State Colors ────────────────────────────────────────────────────────

  @override
  SealStateColor get foreground => SealStateColor(primary);

  @override
  SealStateColor get fill => SealStateColor(primary);
}
