import 'package:flutter/painting.dart';

import '../../../tokens/abstractions/gradient_tokens.dart';

/// Light-mode gradient tokens for the **Deep Ocean** theme.
///
/// Uses fully opaque navy-blue and teal pastel tints so that surface gradient
/// cards look rich and harmonious on the pale blue-white Deep Ocean light
/// surfaces, matching the visual quality of dark mode.
class DeepOceanLightGradients extends GradientTokens {
  const DeepOceanLightGradients();

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

  /// Light navy → light teal — opaque pastels visible on white surfaces.
  @override
  LinearGradient get surfaceGradient => const LinearGradient(
    colors: [Color(0xFFE3F2FD), Color(0xFFE0F5FA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Blue spectrum light tints for primary-accented containers.
  @override
  LinearGradient get surfacePrimaryGradient => const LinearGradient(
    colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Teal spectrum light tints for accent-accented containers.
  @override
  LinearGradient get surfaceAccentGradient => const LinearGradient(
    colors: [Color(0xFFE0F5FA), Color(0xFFB2EBF2)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
