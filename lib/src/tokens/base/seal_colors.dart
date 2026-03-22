import 'package:flutter/painting.dart';

/// Seal UI primitive color constants, exposed as static members of a
/// [Color] extension.
///
/// Use these instead of raw `Color(0x...)` literals or Flutter's `Colors.*`
/// class (which requires `package:flutter/material.dart`).
///
/// These are system-wide primitives. For theme-aware brand colors, use
/// `context.themeTokens.colors` instead.
///
/// ```dart
/// backgroundColor: ColorX.transparent,
/// foregroundColor: ColorX.white,
/// shadowColor: ColorX.black.withValues(alpha: 0.25),
/// ```
extension ColorX on Color {
  /// Pure white — `Color(0xFFFFFFFF)`.
  static const Color white = Color(0xFFFFFFFF);

  /// Pure black — `Color(0xFF000000)`.
  static const Color black = Color(0xFF000000);

  /// Fully transparent — `Color(0x00000000)`.
  static const Color transparent = Color(0x00000000);

  // ── Semantic palette primitives ──────────────────────────────────────────

  /// Red — `Color(0xFFF44336)`.
  static const Color red = Color(0xFFF44336);

  /// Teal — `Color(0xFF009688)`.
  static const Color teal = Color(0xFF009688);

  /// Orange — `Color(0xFFFF9800)`.
  static const Color orange = Color(0xFFFF9800);

  /// Indigo — `Color(0xFF3F51B5)`.
  static const Color indigo = Color(0xFF3F51B5);

  /// Pink — `Color(0xFFE91E63)`.
  static const Color pink = Color(0xFFE91E63);
}
