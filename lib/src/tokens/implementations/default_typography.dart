import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seal_ui_tokens/seal_ui_tokens.dart';

import '../abstractions/typography_tokens.dart';

/// Default typography tokens using the **Inter** font family.
///
/// Uses [GoogleFonts] to load Inter at runtime. Font size and weight
/// properties are sourced from [SealBaseTokens] — the canonical token
/// definitions in the `seal_ui_tokens` package.
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
    fontSize: _s(SealBaseTokens.styleDisplay.fontSize!),
    fontWeight: SealBaseTokens.styleDisplay.fontWeight,
    letterSpacing: SealBaseTokens.styleDisplay.letterSpacing,
    height: SealBaseTokens.styleDisplay.height,
  ).copyWith(leadingDistribution: TextLeadingDistribution.even);

  @override
  TextStyle get headline => GoogleFonts.inter(
    fontSize: _s(SealBaseTokens.styleHeadline.fontSize!),
    fontWeight: SealBaseTokens.styleHeadline.fontWeight,
    letterSpacing: SealBaseTokens.styleHeadline.letterSpacing,
    height: SealBaseTokens.styleHeadline.height,
  ).copyWith(leadingDistribution: TextLeadingDistribution.even);

  @override
  TextStyle get heading => GoogleFonts.inter(
    fontSize: _s(SealBaseTokens.styleHeading.fontSize!),
    fontWeight: SealBaseTokens.styleHeading.fontWeight,
    letterSpacing: SealBaseTokens.styleHeading.letterSpacing,
    height: SealBaseTokens.styleHeading.height,
  ).copyWith(leadingDistribution: TextLeadingDistribution.even);

  @override
  TextStyle get title => GoogleFonts.inter(
    fontSize: _s(SealBaseTokens.styleTitle.fontSize!),
    fontWeight: SealBaseTokens.styleTitle.fontWeight,
    letterSpacing: SealBaseTokens.styleTitle.letterSpacing,
    height: SealBaseTokens.styleTitle.height,
  ).copyWith(leadingDistribution: TextLeadingDistribution.even);

  @override
  TextStyle get subtitle => GoogleFonts.inter(
    fontSize: _s(SealBaseTokens.styleSubtitle.fontSize!),
    fontWeight: SealBaseTokens.styleSubtitle.fontWeight,
    letterSpacing: SealBaseTokens.styleSubtitle.letterSpacing,
    height: SealBaseTokens.styleSubtitle.height,
  ).copyWith(leadingDistribution: TextLeadingDistribution.even);

  @override
  TextStyle get bodyLarge => GoogleFonts.inter(
    fontSize: _s(SealBaseTokens.styleBodyLarge.fontSize!),
    fontWeight: SealBaseTokens.styleBodyLarge.fontWeight,
    letterSpacing: SealBaseTokens.styleBodyLarge.letterSpacing,
    height: SealBaseTokens.styleBodyLarge.height,
  ).copyWith(leadingDistribution: TextLeadingDistribution.even);

  @override
  TextStyle get lead => GoogleFonts.inter(
    fontSize: _s(SealBaseTokens.styleLead.fontSize!),
    fontWeight: SealBaseTokens.styleLead.fontWeight,
    letterSpacing: SealBaseTokens.styleLead.letterSpacing,
    height: SealBaseTokens.styleLead.height,
  ).copyWith(leadingDistribution: TextLeadingDistribution.even);

  @override
  TextStyle get body => GoogleFonts.inter(
    fontSize: _s(SealBaseTokens.styleBody.fontSize!),
    fontWeight: SealBaseTokens.styleBody.fontWeight,
    letterSpacing: SealBaseTokens.styleBody.letterSpacing,
    height: SealBaseTokens.styleBody.height,
  ).copyWith(leadingDistribution: TextLeadingDistribution.even);

  @override
  TextStyle get small => GoogleFonts.inter(
    fontSize: _s(SealBaseTokens.styleSmall.fontSize!),
    fontWeight: SealBaseTokens.styleSmall.fontWeight,
    letterSpacing: SealBaseTokens.styleSmall.letterSpacing,
    height: SealBaseTokens.styleSmall.height,
  ).copyWith(leadingDistribution: TextLeadingDistribution.even);

  @override
  TextStyle get caption => GoogleFonts.inter(
    fontSize: _s(SealBaseTokens.styleCaption.fontSize!),
    fontWeight: SealBaseTokens.styleCaption.fontWeight,
    letterSpacing: SealBaseTokens.styleCaption.letterSpacing,
    height: SealBaseTokens.styleCaption.height,
  ).copyWith(leadingDistribution: TextLeadingDistribution.even);
}
