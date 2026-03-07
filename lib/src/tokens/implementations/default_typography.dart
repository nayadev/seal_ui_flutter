import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

import '../abstractions/typography_tokens.dart';

/// Default typography tokens using the **Inter** font family.
///
/// Uses [GoogleFonts] to load Inter at runtime.
///
/// An optional [scaleFactor] proportionally adjusts every font size while
/// preserving the typographic hierarchy. The default (`1.0`) matches the
/// base design scale (mobile).
///
/// ```dart
/// // Desktop — larger text
/// const DefaultTypography(scaleFactor: 1.5);
///
/// // Tablet — slightly larger text
/// const DefaultTypography(scaleFactor: 1.125);
/// ```
class DefaultTypography extends TypographyTokens {
  /// Creates typography tokens with an optional [scaleFactor].
  const DefaultTypography({this.scaleFactor = 1.0});

  /// Multiplier applied to every font size.
  final double scaleFactor;

  double _scaled(double base) => (base * scaleFactor).roundToDouble();

  @override
  TextStyle get display => GoogleFonts.inter(
    fontSize: _scaled(48),
    fontWeight: FontWeight.w700,
    letterSpacing: -1.2,
    height: 1.15,
  );

  @override
  TextStyle get headline => GoogleFonts.inter(
    fontSize: _scaled(32),
    fontWeight: FontWeight.w600,
    letterSpacing: -0.8,
    height: 1.25,
  );

  @override
  TextStyle get title => GoogleFonts.inter(
    fontSize: _scaled(22),
    fontWeight: FontWeight.w600,
    letterSpacing: -0.3,
    height: 1.3,
  );

  @override
  TextStyle get body => GoogleFonts.inter(
    fontSize: _scaled(16),
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.5,
  );

  @override
  TextStyle get small => GoogleFonts.inter(
    fontSize: _scaled(14),
    fontWeight: FontWeight.w400,
    letterSpacing: 0.1,
    height: 1.45,
  );

  @override
  TextStyle get caption => GoogleFonts.inter(
    fontSize: _scaled(12),
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3,
    height: 1.4,
  );
}
