import 'dart:ui';

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
  Color get primary => const Color(0xFF1565C0);

  @override
  Color get primaryTint => const Color(0xFF1976D2);

  @override
  Color get primaryShade => const Color(0xFF0D47A1);

  // ── Accent ─────────────────────────────────────────────────────────────

  @override
  Color get accent => const Color(0xFF00ACC1);

  @override
  Color get accentSecondary => const Color(0xFF0097A7);

  @override
  Color get onAccent => const Color(0xFFFFFFFF);

  // ── Surfaces ───────────────────────────────────────────────────────────

  @override
  Color get background => const Color(0xFFF0F7FF);

  @override
  Color get surface => const Color(0xFFFFFFFF);

  @override
  Color get surfaceAlt => const Color(0xFFE3F2FD);

  // ── Text ───────────────────────────────────────────────────────────────

  @override
  Color get textPrimary => const Color(0xFF0A1929);

  @override
  Color get textSecondary => const Color(0xFF37474F);

  @override
  Color get onPrimary => const Color(0xFFFFFFFF);

  // ── Border ─────────────────────────────────────────────────────────────

  @override
  Color get border => const Color(0xFFB0C4D8);

  // ── Semantic ───────────────────────────────────────────────────────────

  @override
  Color get success => const Color(0xFF00897B);

  @override
  Color get warning => const Color(0xFFF57C00);

  @override
  Color get error => const Color(0xFFC62828);

  @override
  Color get info => const Color(0xFF0288D1);

  // ── State Colors ────────────────────────────────────────────────────────

  @override
  SealStateColor get foreground => SealStateColor(primary);

  @override
  SealStateColor get fill => SealStateColor(primary);
}
