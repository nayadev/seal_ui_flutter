import '../tokens/abstractions/color_palette.dart';
import '../tokens/abstractions/gradient_tokens.dart';
import '../tokens/abstractions/typography_tokens.dart';

/// Container for all Seal UI design tokens.
///
/// This is the single source of truth used by all components to resolve
/// colors, typography, and gradients.
class SealThemeTokens {
  const SealThemeTokens({
    required this.colors,
    required this.typography,
    required this.gradients,
  });

  /// The active color palette.
  final ColorPalette colors;

  /// The active typography tokens.
  final TypographyTokens typography;

  /// The active gradient tokens.
  final GradientTokens gradients;
}
