import 'package:flutter/painting.dart';
import 'package:seal_ui_tokens/seal_ui_tokens.dart';

import '../../../../tokens/abstractions/gradient_tokens.dart';

/// Light-mode gradient tokens for the **Deep Ocean** theme.
///
/// Uses fully opaque navy-blue and teal pastel tints so that surface gradient
/// cards look rich and harmonious on the pale blue-white Deep Ocean light
/// surfaces, matching the visual quality of dark mode.
class DeepOceanLightGradients extends GradientTokens {
  /// Creates [DeepOceanLightGradients] tokens.
  const DeepOceanLightGradients();

  @override
  LinearGradient get primaryGradient =>
      SealDeepOceanLightTokens.gradientPrimary;

  @override
  LinearGradient get accentGradient => SealDeepOceanLightTokens.gradientAccent;

  /// Light navy → light teal — opaque pastels visible on white surfaces.
  @override
  LinearGradient get surfaceGradient =>
      SealDeepOceanLightTokens.gradientSurface;

  /// Blue spectrum light tints for primary-accented containers.
  @override
  LinearGradient get surfacePrimaryGradient =>
      SealDeepOceanLightTokens.gradientSurfacePrimary;

  /// Teal spectrum light tints for accent-accented containers.
  @override
  LinearGradient get surfaceAccentGradient =>
      SealDeepOceanLightTokens.gradientSurfaceAccent;
}
