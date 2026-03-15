import 'package:flutter/painting.dart';

/// Abstract contract for Seal UI gradient tokens.
///
/// Gradients are a core part of the visual identity and should be
/// used tastefully on buttons, highlights, and accent elements.
abstract class GradientTokens {
  const GradientTokens();

  /// Primary gradient — used on primary buttons and hero elements.
  LinearGradient get primaryGradient;

  /// Accent gradient — subtle highlight for surfaces and cards.
  LinearGradient get accentGradient;

  /// Surface gradient — very subtle, used as background sheen.
  LinearGradient get surfaceGradient;

  /// Surface gradient tinted with the primary color.
  LinearGradient get surfacePrimaryGradient;

  /// Surface gradient tinted with accent colors.
  LinearGradient get surfaceAccentGradient;
}
