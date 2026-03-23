import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

import '../abstractions/typography_tokens.dart';

/// Default typography tokens using the **Inter** font family.
///
/// Uses [GoogleFonts] to load Inter at runtime.
///
/// Values are aligned with the shadcn_ui type scale so that shadcn components
/// receive visually consistent styles when wired via [SealThemeFactory.buildShadTheme].
///
/// An optional [scaleFactor] proportionally adjusts every font size.
class DefaultTypography extends TypographyTokens {
  /// Creates typography tokens with an optional [scaleFactor].
  const DefaultTypography({this.scaleFactor = 1.0});

  /// Multiplier applied to every font size.
  final double scaleFactor;

  double _s(double base) => (base * scaleFactor).roundToDouble();

  // ── SealUI scale ──────────────────────────────────────────────────────────

  @override
  TextStyle get display => GoogleFonts.inter(
    fontSize: _s(48),
    fontWeight: FontWeight.w800,
    letterSpacing: -0.4,
    height: 1.0,
  ).copyWith(leadingDistribution: TextLeadingDistribution.even);

  @override
  TextStyle get headline => GoogleFonts.inter(
    fontSize: _s(36),
    fontWeight: FontWeight.w800,
    letterSpacing: -0.4,
    height: 40 / 36,
  ).copyWith(leadingDistribution: TextLeadingDistribution.even);

  @override
  TextStyle get heading => GoogleFonts.inter(
    fontSize: _s(30),
    fontWeight: FontWeight.w600,
    letterSpacing: -0.4,
    height: 36 / 30,
  ).copyWith(leadingDistribution: TextLeadingDistribution.even);

  @override
  TextStyle get title => GoogleFonts.inter(
    fontSize: _s(24),
    fontWeight: FontWeight.w600,
    letterSpacing: -0.4,
    height: 32 / 24,
  ).copyWith(leadingDistribution: TextLeadingDistribution.even);

  @override
  TextStyle get subtitle => GoogleFonts.inter(
    fontSize: _s(20),
    fontWeight: FontWeight.w600,
    letterSpacing: -0.4,
    height: 28 / 20,
  ).copyWith(leadingDistribution: TextLeadingDistribution.even);

  @override
  TextStyle get bodyLarge => GoogleFonts.inter(
    fontSize: _s(18),
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 28 / 18,
  ).copyWith(leadingDistribution: TextLeadingDistribution.even);

  @override
  TextStyle get lead => GoogleFonts.inter(
    fontSize: _s(20),
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 28 / 20,
  ).copyWith(leadingDistribution: TextLeadingDistribution.even);

  @override
  TextStyle get body => GoogleFonts.inter(
    fontSize: _s(16),
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 28 / 16,
  ).copyWith(leadingDistribution: TextLeadingDistribution.even);

  @override
  TextStyle get small => GoogleFonts.inter(
    fontSize: _s(14),
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.0,
  ).copyWith(leadingDistribution: TextLeadingDistribution.even);

  @override
  TextStyle get caption => GoogleFonts.inter(
    fontSize: _s(14),
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 20 / 14,
  ).copyWith(leadingDistribution: TextLeadingDistribution.even);
}
