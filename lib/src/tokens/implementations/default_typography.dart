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

  // ── Font sizes ────────────────────────────────────────────────────
  static const double _kDisplayFontSize = 48;
  static const double _kHeadlineFontSize = 32;
  static const double _kTitleFontSize = 22;
  static const double _kBodyFontSize = 16;
  static const double _kSmallFontSize = 14;
  static const double _kCaptionFontSize = 12;

  // ── Line heights ──────────────────────────────────────────────────
  static const double _kDisplayLineHeight = 1.15;
  static const double _kHeadlineLineHeight = 1.25;
  static const double _kTitleLineHeight = 1.3;
  static const double _kBodyLineHeight = 1.5;
  static const double _kSmallLineHeight = 1.45;
  static const double _kCaptionLineHeight = 1.4;

  // ── Letter spacings ───────────────────────────────────────────────
  static const double _kDisplayLetterSpacing = -1.2;
  static const double _kHeadlineLetterSpacing = -0.8;
  static const double _kTitleLetterSpacing = -0.3;
  static const double _kSmallLetterSpacing = 0.1;
  static const double _kCaptionLetterSpacing = 0.3;

  @override
  TextStyle get display => GoogleFonts.inter(
    fontSize: _scaled(_kDisplayFontSize),
    fontWeight: FontWeight.w700,
    letterSpacing: _kDisplayLetterSpacing,
    height: _kDisplayLineHeight,
  );

  @override
  TextStyle get headline => GoogleFonts.inter(
    fontSize: _scaled(_kHeadlineFontSize),
    fontWeight: FontWeight.w600,
    letterSpacing: _kHeadlineLetterSpacing,
    height: _kHeadlineLineHeight,
  );

  @override
  TextStyle get title => GoogleFonts.inter(
    fontSize: _scaled(_kTitleFontSize),
    fontWeight: FontWeight.w600,
    letterSpacing: _kTitleLetterSpacing,
    height: _kTitleLineHeight,
  );

  @override
  TextStyle get body => GoogleFonts.inter(
    fontSize: _scaled(_kBodyFontSize),
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: _kBodyLineHeight,
  );

  @override
  TextStyle get small => GoogleFonts.inter(
    fontSize: _scaled(_kSmallFontSize),
    fontWeight: FontWeight.w400,
    letterSpacing: _kSmallLetterSpacing,
    height: _kSmallLineHeight,
  );

  @override
  TextStyle get caption => GoogleFonts.inter(
    fontSize: _scaled(_kCaptionFontSize),
    fontWeight: FontWeight.w500,
    letterSpacing: _kCaptionLetterSpacing,
    height: _kCaptionLineHeight,
  );
}
