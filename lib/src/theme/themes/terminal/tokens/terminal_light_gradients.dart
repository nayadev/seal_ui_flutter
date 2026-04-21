import 'package:flutter/painting.dart';
import 'package:seal_ui_tokens/seal_ui_tokens.dart';

import '../../../../tokens/abstractions/gradient_tokens.dart';

/// Light-mode gradient tokens for the **Terminal** theme.
///
/// Translates the Terminal brand into opaque pastel tints suitable for
/// bright surfaces — soft cyan and mint washes that evoke the tinted paper
/// of terminal printouts without the glow of dark mode.
class TerminalLightGradients extends GradientTokens {
  /// Creates [TerminalLightGradients] tokens.
  const TerminalLightGradients();

  /// Dark cyan → deep teal — the primary identity on bright surfaces.
  @override
  LinearGradient get primaryGradient =>
      SealTerminalLightTokens.gradientPrimary;

  /// Dark gray → deep teal — accent gradient on bright surfaces.
  @override
  LinearGradient get accentGradient => SealTerminalLightTokens.gradientAccent;

  /// Soft cyan wash — visible and harmonious on white and off-white surfaces.
  @override
  LinearGradient get surfaceGradient =>
      SealTerminalLightTokens.gradientSurface;

  /// Deeper cyan tint for primary-accented containers.
  @override
  LinearGradient get surfacePrimaryGradient =>
      SealTerminalLightTokens.gradientSurfacePrimary;

  /// Mint tint for accent-accented containers.
  @override
  LinearGradient get surfaceAccentGradient =>
      SealTerminalLightTokens.gradientSurfaceAccent;
}
