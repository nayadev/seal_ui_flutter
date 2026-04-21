import 'package:flutter/painting.dart';
import 'package:seal_ui_tokens/seal_ui_tokens.dart';

import '../../../../tokens/abstractions/gradient_tokens.dart';

/// Gradient tokens for the **Deep Ocean** theme (dark variant).
///
/// Deep navy → cyan glow gradients evoke the luminous depths of the ocean.
class DeepOceanGradients extends GradientTokens {
  /// Creates [DeepOceanGradients] tokens.
  const DeepOceanGradients();

  @override
  LinearGradient get primaryGradient =>
      SealDeepOceanDarkTokens.gradientPrimary;

  @override
  LinearGradient get accentGradient => SealDeepOceanDarkTokens.gradientAccent;

  @override
  LinearGradient get surfaceGradient =>
      SealDeepOceanDarkTokens.gradientSurface;

  @override
  LinearGradient get surfacePrimaryGradient =>
      SealDeepOceanDarkTokens.gradientSurfacePrimary;

  @override
  LinearGradient get surfaceAccentGradient =>
      SealDeepOceanDarkTokens.gradientSurfaceAccent;
}
