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
}
