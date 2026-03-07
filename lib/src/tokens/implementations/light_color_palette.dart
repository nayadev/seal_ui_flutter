import 'dart:ui';

import '../abstractions/color_palette.dart';

/// Light color palette — a clean, bright alternative theme.
///
/// Maintains the same purple identity with softer tones.
class LightColorPalette extends ColorPalette {
  const LightColorPalette();

  // ── Brand ──────────────────────────────────────────────────────────────

  @override
  Color get primary => const Color(0xFF7B4FD4);

  @override
  Color get primaryTint => const Color(0xFF9B6DFF);

  @override
  Color get primaryShade => const Color(0xFF5B34A6);

  // ── Accent ─────────────────────────────────────────────────────────────

  @override
  Color get accentBlue => const Color(0xFF3D8BDF);

  @override
  Color get accentGreen => const Color(0xFF2DB88A);

  // ── Surfaces ───────────────────────────────────────────────────────────

  @override
  Color get background => const Color(0xFFF7F5FC);

  @override
  Color get surface => const Color(0xFFFFFFFF);

  @override
  Color get surfaceAlt => const Color(0xFFEDE8F5);

  // ── Text ───────────────────────────────────────────────────────────────

  @override
  Color get textPrimary => const Color(0xFF1A1A2E);

  @override
  Color get textSecondary => const Color(0xFF6B6880);

  // ── Border ─────────────────────────────────────────────────────────────

  @override
  Color get border => const Color(0xFFD8D3E8);

  // ── Semantic ───────────────────────────────────────────────────────────

  @override
  Color get success => const Color(0xFF2DB88A);

  @override
  Color get warning => const Color(0xFFE6A040);

  @override
  Color get error => const Color(0xFFE04564);
}
