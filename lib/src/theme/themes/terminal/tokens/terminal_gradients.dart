import 'package:flutter/painting.dart';
import 'package:seal_ui_tokens/seal_ui_tokens.dart';

import '../../../../tokens/abstractions/gradient_tokens.dart';

/// Dark-mode gradient tokens for the **Terminal** theme.
///
/// Gradients evoke the visual character of CRT phosphor screens:
/// - [primaryGradient]: cyan sweeping into deep teal-blue, like text scrolling
///   across a lit phosphor tube.
/// - [accentGradient]: phosphor green bleeding into cyan, the iconic
///   dual-phosphor combination of vintage terminals.
/// - Surface gradients use low-opacity phosphor tints to add depth to dark
///   containers without overpowering the near-black backgrounds.
class TerminalGradients extends GradientTokens {
  /// Creates [TerminalGradients] tokens.
  const TerminalGradients();

  /// Cyan → deep teal-blue — like a beam sweeping across a phosphor screen.
  @override
  LinearGradient get primaryGradient =>
      SealTerminalDarkTokens.gradientPrimary;

  /// Dark gray → deep teal — the accent identity sweeping into the terminal backdrop.
  @override
  LinearGradient get accentGradient => SealTerminalDarkTokens.gradientAccent;

  /// Subtle dark phosphor sheen for surface backgrounds.
  @override
  LinearGradient get surfaceGradient => SealTerminalDarkTokens.gradientSurface;

  /// Cyan phosphor tint — for primary-accented containers.
  @override
  LinearGradient get surfacePrimaryGradient =>
      SealTerminalDarkTokens.gradientSurfacePrimary;

  /// Dark gray tint — for accent-accented containers.
  @override
  LinearGradient get surfaceAccentGradient =>
      SealTerminalDarkTokens.gradientSurfaceAccent;
}
