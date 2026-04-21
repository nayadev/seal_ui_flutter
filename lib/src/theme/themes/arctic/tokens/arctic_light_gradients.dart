import 'package:flutter/painting.dart';
import 'package:seal_ui_tokens/seal_ui_tokens.dart';

import '../../../../tokens/abstractions/gradient_tokens.dart';

/// Light-mode gradient tokens for the **Arctic** theme.
///
/// Uses fully opaque ice-blue and glacier-cyan pastel tints so that surface
/// gradient cards look rich and harmonious on the bright white surfaces of
/// the Arctic light palette, matching the visual quality of dark mode.
class ArcticLightGradients extends GradientTokens {
  /// Creates [ArcticLightGradients] tokens.
  const ArcticLightGradients();

  @override
  LinearGradient get primaryGradient => SealArcticLightTokens.gradientPrimary;

  @override
  LinearGradient get accentGradient => SealArcticLightTokens.gradientAccent;

  /// Ice blue → glacier cyan — opaque pastels visible on white surfaces.
  @override
  LinearGradient get surfaceGradient => SealArcticLightTokens.gradientSurface;

  /// Ice blue spectrum for primary-accented containers.
  @override
  LinearGradient get surfacePrimaryGradient =>
      SealArcticLightTokens.gradientSurfacePrimary;

  /// Cyan spectrum for accent-accented containers.
  @override
  LinearGradient get surfaceAccentGradient =>
      SealArcticLightTokens.gradientSurfaceAccent;
}
