import 'package:flutter/painting.dart';
import 'package:seal_ui_tokens/seal_ui_tokens.dart';

import '../../../../tokens/abstractions/gradient_tokens.dart';

/// Gradient tokens for the **Arctic** theme (dark variant).
///
/// Ice-blue → glacier cyan gradients evoke a crisp, frozen aesthetic.
class ArcticGradients extends GradientTokens {
  /// Creates [ArcticGradients] tokens.
  const ArcticGradients();

  @override
  LinearGradient get primaryGradient => SealArcticDarkTokens.gradientPrimary;

  @override
  LinearGradient get accentGradient => SealArcticDarkTokens.gradientAccent;

  @override
  LinearGradient get surfaceGradient => SealArcticDarkTokens.gradientSurface;

  @override
  LinearGradient get surfacePrimaryGradient =>
      SealArcticDarkTokens.gradientSurfacePrimary;

  @override
  LinearGradient get surfaceAccentGradient =>
      SealArcticDarkTokens.gradientSurfaceAccent;
}
