import 'dart:ui';

import '../../../../tokens/abstractions/color_palette.dart';
import '../../../../tokens/base/seal_state_color.dart';

/// Light-mode color palette for the **Terminal** theme.
///
/// Evokes printed terminal output on paper — off-white surfaces with
/// a faint cyan cast, dark cyan as the primary, and dark gray as the accent.
/// Text on filled elements stays light for contrast even in light mode.
class TerminalLightColorPalette extends ColorPalette {
  const TerminalLightColorPalette();

  // ── Brand ──────────────────────────────────────────────────────────────

  @override
  Color get primary => const Color(0xFF007A6B);

  @override
  Color get primaryTint => const Color(0xFF009B88);

  @override
  Color get primaryShade => const Color(0xFF005A4D);

  // ── Accent ─────────────────────────────────────────────────────────────

  /// Dark gray with a subtle teal undertone — secondary color in the terminal palette.
  @override
  Color get accent => const Color(0xFF3A4F50);

  @override
  Color get accentSecondary => const Color(0xFF526868);

  /// Light text on dark gray — maintains contrast on filled accent surfaces.
  @override
  Color get onAccent => const Color(0xFFF0FFF8);

  // ── Surfaces ───────────────────────────────────────────────────────────

  /// Off-white with a faint cyan tint — reminiscent of terminal paper printouts.
  @override
  Color get background => const Color(0xFFF0F8F6);

  @override
  Color get surface => const Color(0xFFFFFFFF);

  @override
  Color get surfaceAlt => const Color(0xFFE3F2EF);

  // ── Text ───────────────────────────────────────────────────────────────

  @override
  Color get textPrimary => const Color(0xFF0A1E1C);

  @override
  Color get textSecondary => const Color(0xFF3D6B65);

  /// Light text on dark cyan fill — ensures contrast on primary-colored buttons.
  @override
  Color get onPrimary => const Color(0xFFF0FFF8);

  // ── Border ─────────────────────────────────────────────────────────────

  @override
  Color get border => const Color(0xFFB0D4CE);

  // ── Semantic ───────────────────────────────────────────────────────────

  @override
  Color get success => const Color(0xFF1A8C00);

  @override
  Color get warning => const Color(0xFFB87800);

  @override
  Color get error => const Color(0xFFCC1133);

  @override
  Color get info => const Color(0xFF006B99);

  // ── State Colors ────────────────────────────────────────────────────────

  @override
  SealStateColor get foreground => SealStateColor(primary);

  @override
  SealStateColor get fill => SealStateColor(primary);
}
