import 'dart:ui';

import '../../../../tokens/abstractions/color_palette.dart';
import '../../../../tokens/base/seal_state_color.dart';

/// Dark-mode color palette for the **Arctic** theme.
///
/// Icy blue brand identity on deep, cool-toned dark surfaces.
/// Use [ArcticColorPalette] for the canonical light variant.
class ArcticDarkColorPalette extends ColorPalette {
  /// Creates [ArcticDarkColorPalette] tokens.
  const ArcticDarkColorPalette();

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
  Color get onAccent => const Color(0xFFE8F4FC);

  // ── Surfaces ───────────────────────────────────────────────────────────

  @override
  Color get background => const Color(0xFF071822);

  @override
  Color get surface => const Color(0xFF0D2333);

  @override
  Color get surfaceAlt => const Color(0xFF112840);

  // ── Text ───────────────────────────────────────────────────────────────

  @override
  Color get textPrimary => const Color(0xFFE8F4FC);

  @override
  Color get textSecondary => const Color(0xFF6EA8C4);

  @override
  Color get onPrimary => const Color(0xFFE8F4FC);

  // ── Border ─────────────────────────────────────────────────────────────

  @override
  Color get border => const Color(0xFF0D3050);

  // ── Semantic ───────────────────────────────────────────────────────────

  @override
  Color get success => const Color(0xFF1DE9B6);

  @override
  Color get warning => const Color(0xFFFF9800);

  @override
  Color get error => const Color(0xFFFF5252);

  @override
  Color get info => const Color(0xFF29B6F6);

  // ── State Colors ────────────────────────────────────────────────────────

  @override
  SealStateColor get foreground => SealStateColor(primary);

  @override
  SealStateColor get fill => SealStateColor(primary);
}
