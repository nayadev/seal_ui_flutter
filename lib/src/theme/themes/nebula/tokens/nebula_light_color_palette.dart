import 'dart:ui';

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
  Color get primary => const Color(0xFF7B4FD4);

  @override
  Color get primaryTint => const Color(0xFF9B6DFF);

  @override
  Color get primaryShade => const Color(0xFF5B34A6);

  // ── Accent ─────────────────────────────────────────────────────────────

  @override
  Color get accent => const Color(0xFF2DB88A);

  @override
  Color get accentSecondary => const Color(0xFF3D8BDF);

  @override
  Color get onAccent => const Color(0xFFFFFFFF);

  // ── Surfaces ───────────────────────────────────────────────────────────

  @override
  Color get background => const Color(0xFFF5F2FF);

  @override
  Color get surface => const Color(0xFFFFFFFF);

  @override
  Color get surfaceAlt => const Color(0xFFEDE8F5);

  // ── Text ───────────────────────────────────────────────────────────────

  @override
  Color get textPrimary => const Color(0xFF1A1A2E);

  @override
  Color get textSecondary => const Color(0xFF6B6880);

  @override
  Color get onPrimary => const Color(0xFFF0ECF9);

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

  @override
  Color get info => const Color(0xFF3D8BDF);

  // ── State Colors ────────────────────────────────────────────────────────

  @override
  SealStateColor get foreground => SealStateColor(primary);

  @override
  SealStateColor get fill => SealStateColor(primary);
}
