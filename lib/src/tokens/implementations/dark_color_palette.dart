import 'dart:ui';

import '../abstractions/color_palette.dart';
import '../base/nebula_state_color.dart';

/// Dark color palette — the **primary** Nebula UI experience.
///
/// Deep, space-inspired backgrounds with vibrant purple accents.
class DarkColorPalette extends ColorPalette {
  const DarkColorPalette();

  // ── Brand ──────────────────────────────────────────────────────────────

  @override
  Color get primary => const Color(0xFF8055E0);

  @override
  Color get primaryTint => const Color(0xFF9B6DFF);

  @override
  Color get primaryShade => const Color(0xFF6340B8);

  // ── Accent ─────────────────────────────────────────────────────────────────

  @override
  Color get accent => const Color(0xFF4A96E8);

  @override
  Color get accentSecondary => const Color(0xFF32B88C);

  @override
  Color get onAccent => const Color(0xFFF0ECF9);

  // ── Surfaces ───────────────────────────────────────────────────────────

  @override
  Color get background => const Color(0xFF0F0F1A);

  @override
  Color get surface => const Color(0xFF1A1A2E);

  @override
  Color get surfaceAlt => const Color(0xFF252542);

  // ── Text ───────────────────────────────────────────────────────────────

  @override
  Color get textPrimary => const Color(0xFFF0ECF9);

  @override
  Color get textSecondary => const Color(0xFF9E9BB3);

  @override
  Color get onPrimary => const Color(0xFFF0ECF9);

  // ── Border ─────────────────────────────────────────────────────────────

  @override
  Color get border => const Color(0xFF2E2E4A);

  // ── Semantic ───────────────────────────────────────────────────────────

  @override
  Color get success => const Color(0xFF4DDEB0);

  @override
  Color get warning => const Color(0xFFFFBE6A);

  @override
  Color get error => const Color(0xFFFF6B8A);

  // ── State Colors ────────────────────────────────────────────────────────

  @override
  NebulaStateColor get foreground => NebulaStateColor(primary);

  @override
  NebulaStateColor get fill => NebulaStateColor(primary);
}
