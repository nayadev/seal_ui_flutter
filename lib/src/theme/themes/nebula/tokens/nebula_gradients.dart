import 'package:flutter/painting.dart';
import 'package:seal_ui_tokens/seal_ui_tokens.dart';

import '../../../../tokens/abstractions/gradient_tokens.dart';

/// Gradient tokens for the **Nebula** theme.
///
/// Purple → Blue gradient is the primary visual identity of the Nebula theme.
class NebulaGradients extends GradientTokens {
  /// Creates [NebulaGradients] tokens.
  const NebulaGradients();

  @override
  LinearGradient get primaryGradient => SealNebulaDarkTokens.gradientPrimary;

  @override
  LinearGradient get accentGradient => SealNebulaDarkTokens.gradientAccent;

  @override
  LinearGradient get surfaceGradient => SealNebulaDarkTokens.gradientSurface;

  @override
  LinearGradient get surfacePrimaryGradient =>
      SealNebulaDarkTokens.gradientSurfacePrimary;

  @override
  LinearGradient get surfaceAccentGradient =>
      SealNebulaDarkTokens.gradientSurfaceAccent;
}
