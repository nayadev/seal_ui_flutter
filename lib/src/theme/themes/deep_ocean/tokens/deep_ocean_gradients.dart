import 'package:flutter/painting.dart';

import '../../../../tokens/abstractions/gradient_tokens.dart';

/// Gradient tokens for the **Deep Ocean** theme.
///
/// Deep navy → cyan glow gradients evoke the luminous depths of the ocean.
class DeepOceanGradients extends GradientTokens {
  /// Creates [DeepOceanGradients] tokens.
  const DeepOceanGradients();

  @override
  LinearGradient get primaryGradient => const LinearGradient(
    colors: [Color(0xFF1976D2), Color(0xFF00E5FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  LinearGradient get accentGradient => const LinearGradient(
    colors: [Color(0xFF0D47A1), Color(0xFF40C4FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  LinearGradient get surfaceGradient => const LinearGradient(
    colors: [Color(0x281976D2), Color(0x2800E5FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  LinearGradient get surfacePrimaryGradient => const LinearGradient(
    colors: [Color(0x301976D2), Color(0x300D47A1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  LinearGradient get surfaceAccentGradient => const LinearGradient(
    colors: [Color(0x3000E5FF), Color(0x3040C4FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
