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
/// Scale reference (shadcn → SealUI name):
/// | shadcn     | SealUI     | size | weight |
/// |------------|------------|------|--------|
/// | h1Large    | display    |  48  |  w800  |
/// | h1         | headline   |  36  |  w800  |
/// | h2         | —          |  30  |  w600  |
/// | h3         | title      |  24  |  w600  |
/// | h4         | subtitle   |  20  |  w600  |
/// | p          | body       |  16  |  w400  |
/// | large      | —          |  18  |  w600  |
/// | small      | small      |  14  |  w500  |
/// | muted      | caption    |  14  |  w400  |
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

  // ── shadcn-specific overrides ─────────────────────────────────────────────
  // h2 lives between headline (36) and title (24); it gets its own explicit
  // value so that the shadcn ShadTextTheme receives the correct 30 px style.

  @override
  TextStyle get h2 => GoogleFonts.inter(
    fontSize: _s(30),
    fontWeight: FontWeight.w600,
    letterSpacing: -0.4,
    height: 36 / 30,
  ).copyWith(leadingDistribution: TextLeadingDistribution.even);

  // large (18 px) sits between subtitle (20) and body (16); explicit override.
  @override
  TextStyle get large => GoogleFonts.inter(
    fontSize: _s(18),
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 28 / 18,
  ).copyWith(leadingDistribution: TextLeadingDistribution.even);

  // lead (20 px, w400) differs from subtitle (20 px, w600) in weight.
  @override
  TextStyle get lead => GoogleFonts.inter(
    fontSize: _s(20),
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 28 / 20,
  ).copyWith(leadingDistribution: TextLeadingDistribution.even);
}
