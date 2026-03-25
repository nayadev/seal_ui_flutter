import 'dart:ui';

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
  Color get primary => const Color(0xFF00CC99);

  @override
  Color get primaryTint => const Color(0xFF33D9AA);

  @override
  Color get primaryShade => const Color(0xFF009970);

  // ── Accent ─────────────────────────────────────────────────────────────

  /// Medium gray with a teal cast — visible against the near-black background.
  @override
  Color get accent => const Color(0xFF7A9A9A);

  @override
  Color get accentSecondary => const Color(0xFF556B6B);

  /// Light cyan-white on dark gray — ensures readability on accent-filled surfaces.
  @override
  Color get onAccent => const Color(0xFFD4FFF8);

  // ── Surfaces ───────────────────────────────────────────────────────────

  /// Near-black with a faint teal phosphor cast — like a powered-on CRT.
  @override
  Color get background => const Color(0xFF060C0C);

  @override
  Color get surface => const Color(0xFF0C1A1A);

  @override
  Color get surfaceAlt => const Color(0xFF122222);

  // ── Text ───────────────────────────────────────────────────────────────

  /// Bright cyan-white — the classic glowing terminal text.
  @override
  Color get textPrimary => const Color(0xFFD4FFF8);

  @override
  Color get textSecondary => const Color(0xFF6B7E7E);

  /// Light cyan-white on cyan fill — fulfills the light-on-button requirement.
  @override
  Color get onPrimary => const Color(0xFFD4FFF8);

  // ── Border ─────────────────────────────────────────────────────────────

  @override
  Color get border => const Color(0xFF143030);

  // ── Semantic ───────────────────────────────────────────────────────────

  /// Phosphor green doubles as success — consistent with the terminal aesthetic.
  @override
  Color get success => const Color(0xFF39FF14);

  /// Amber — the classic terminal warning color.
  @override
  Color get warning => const Color(0xFFFFB627);

  @override
  Color get error => const Color(0xFFFF3355);

  @override
  Color get info => const Color(0xFF00B8D9);

  // ── State Colors ────────────────────────────────────────────────────────

  @override
  SealStateColor get foreground => SealStateColor(primary);

  @override
  SealStateColor get fill => SealStateColor(primary);
}
