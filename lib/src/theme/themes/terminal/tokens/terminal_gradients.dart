import 'package:flutter/painting.dart';

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
  LinearGradient get primaryGradient => const LinearGradient(
    colors: [Color(0xFF00CC99), Color(0xFF005F6A)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  /// Dark gray → deep teal — the accent identity sweeping into the terminal backdrop.
  @override
  LinearGradient get accentGradient => const LinearGradient(
    colors: [Color(0xFF7A9A9A), Color(0xFF3D5F5F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Subtle dark phosphor sheen for surface backgrounds.
  @override
  LinearGradient get surfaceGradient => const LinearGradient(
    colors: [Color(0x2800CC99), Color(0x28005F6A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Cyan phosphor tint — for primary-accented containers.
  @override
  LinearGradient get surfacePrimaryGradient => const LinearGradient(
    colors: [Color(0x3300CC99), Color(0x33009970)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Dark gray tint — for accent-accented containers.
  @override
  LinearGradient get surfaceAccentGradient => const LinearGradient(
    colors: [Color(0x287A9A9A), Color(0x283D5F5F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
