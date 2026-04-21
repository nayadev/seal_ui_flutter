import 'package:flutter/painting.dart';
import 'package:seal_ui_tokens/seal_ui_tokens.dart';

import '../../../../tokens/abstractions/gradient_tokens.dart';

/// Light-mode gradient tokens for the **Nebula** theme.
///
/// Uses fully opaque pastel tints derived from the Nebula brand colors —
/// soft lavender, periwinkle, and mint — so that surface gradient cards
/// look rich and harmonious on the bright white and off-white surfaces
/// of the Nebula light palette, matching the visual quality of dark mode.
class NebulaLightGradients extends GradientTokens {
  /// Creates [NebulaLightGradients] tokens.
  const NebulaLightGradients();

  @override
  LinearGradient get primaryGradient => SealNebulaLightTokens.gradientPrimary;

  @override
  LinearGradient get accentGradient => SealNebulaLightTokens.gradientAccent;

  /// Soft lavender → periwinkle — visible and harmonious on white surfaces.
  @override
  LinearGradient get surfaceGradient => SealNebulaLightTokens.gradientSurface;

  /// Deeper lavender tint range for primary-accented containers.
  @override
  LinearGradient get surfacePrimaryGradient =>
      SealNebulaLightTokens.gradientSurfacePrimary;

  /// Mint → sky tint for accent-accented containers.
  @override
  LinearGradient get surfaceAccentGradient =>
      SealNebulaLightTokens.gradientSurfaceAccent;
}
