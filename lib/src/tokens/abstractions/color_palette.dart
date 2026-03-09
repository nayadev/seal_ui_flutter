import 'dart:ui';

import '../base/nebula_state_color.dart';

/// Abstract contract for the Nebula UI color palette.
///
/// Implementations provide concrete color values for dark and light themes.
/// The palette is purple-centered with blue and green accents.
abstract class ColorPalette {
  const ColorPalette();

  // ── Brand ──────────────────────────────────────────────────────────────

  /// Primary brand color (purple).
  Color get primary;

  /// Lighter tint of the primary color.
  Color get primaryTint;

  /// Darker shade of the primary color.
  Color get primaryShade;

  // ── Accent ─────────────────────────────────────────────────────────────

  /// Primary accent color.
  Color get accent;

  /// Secondary accent color.
  Color get accentSecondary;

  /// Foreground color for content placed over accent-colored surfaces.
  Color get onAccent;

  // ── Surfaces ───────────────────────────────────────────────────────────

  /// Main background color.
  Color get background;

  /// Primary surface color.
  Color get surface;

  /// Alternative surface color for cards / elevated sections.
  Color get surfaceAlt;

  // ── Text ───────────────────────────────────────────────────────────────

  /// Primary text color.
  Color get textPrimary;

  /// Secondary / muted text color.
  Color get textSecondary;

  /// Foreground color for content placed over the [primary] fill.
  ///
  /// Guarantees readability on filled primary-colored surfaces
  /// (e.g. buttons, badges).
  Color get onPrimary;

  // ── Border ─────────────────────────────────────────────────────────────

  /// Default border color.
  Color get border;

  // ── Semantic ───────────────────────────────────────────────────────────

  /// Success semantic color.
  Color get success;

  /// Warning semantic color.
  Color get warning;

  /// Error semantic color.
  Color get error;

  /// Info semantic color.
  Color get info;

  // ── State Colors ────────────────────────────────────────────────────────

  /// Foreground color states for interactive widgets (text, icons, borders).
  ///
  /// Typically based on [primary]. Provides [NebulaStateColor.active] and
  /// [NebulaStateColor.disabled] variants.
  NebulaStateColor get foreground;

  /// Background/fill color states for interactive widgets (fills, surfaces).
  ///
  /// Typically based on [primary]. Provides [NebulaStateColor.active] and
  /// [NebulaStateColor.disabled] variants.
  NebulaStateColor get fill;
}
