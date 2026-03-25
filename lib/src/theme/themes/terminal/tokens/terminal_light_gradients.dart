import 'package:flutter/painting.dart';

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
  LinearGradient get primaryGradient => const LinearGradient(
    colors: [Color(0xFF007A6B), Color(0xFF005599)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  /// Dark gray → deep teal — accent gradient on bright surfaces.
  @override
  LinearGradient get accentGradient => const LinearGradient(
    colors: [Color(0xFF3A4F50), Color(0xFF1E3030)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Soft cyan wash — visible and harmonious on white and off-white surfaces.
  @override
  LinearGradient get surfaceGradient => const LinearGradient(
    colors: [Color(0xFFE3F5F2), Color(0xFFE8F4FB)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Deeper cyan tint for primary-accented containers.
  @override
  LinearGradient get surfacePrimaryGradient => const LinearGradient(
    colors: [Color(0xFFD6F2EE), Color(0xFFCCEDE8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Mint tint for accent-accented containers.
  @override
  LinearGradient get surfaceAccentGradient => const LinearGradient(
    colors: [Color(0xFFDDF5D6), Color(0xFFD6F2EE)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
