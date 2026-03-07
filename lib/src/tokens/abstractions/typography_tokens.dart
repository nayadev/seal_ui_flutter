import 'package:flutter/painting.dart';

/// Abstract contract for Nebula UI typography tokens.
///
/// Implementations map each token to a concrete [TextStyle].
abstract class TypographyTokens {
  const TypographyTokens();

  /// Flutter's default line height multiplier when [TextStyle.height] is null.
  static const double kDefaultLineHeightMultiplier = 1.2;

  /// Large display text — hero sections.
  TextStyle get display;

  /// Headline — section headings.
  TextStyle get headline;

  /// Title — card or dialog titles.
  TextStyle get title;

  /// Body — default readable text.
  TextStyle get body;

  /// Small — secondary information.
  TextStyle get small;

  /// Caption — labels and metadata.
  TextStyle get caption;
}
