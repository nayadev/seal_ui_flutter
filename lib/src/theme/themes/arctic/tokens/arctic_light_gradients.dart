import 'package:flutter/painting.dart';

import '../../../../tokens/abstractions/gradient_tokens.dart';

/// Light-mode gradient tokens for the **Arctic** theme.
///
/// Uses fully opaque ice-blue and glacier-cyan pastel tints so that surface
/// gradient cards look rich and harmonious on the bright white surfaces of
/// the Arctic light palette, matching the visual quality of dark mode.
class ArcticLightGradients extends GradientTokens {
  const ArcticLightGradients();

  @override
  LinearGradient get primaryGradient => const LinearGradient(
    colors: [Color(0xFF29B6F6), Color(0xFF26C6DA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  LinearGradient get accentGradient => const LinearGradient(
    colors: [Color(0xFF00BCD4), Color(0xFF26A69A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Ice blue → glacier cyan — opaque pastels visible on white surfaces.
  @override
  LinearGradient get surfaceGradient => const LinearGradient(
    colors: [Color(0xFFE1F5FE), Color(0xFFE0F7FA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Ice blue spectrum for primary-accented containers.
  @override
  LinearGradient get surfacePrimaryGradient => const LinearGradient(
    colors: [Color(0xFFE1F5FE), Color(0xFFB3E5FC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Cyan spectrum for accent-accented containers.
  @override
  LinearGradient get surfaceAccentGradient => const LinearGradient(
    colors: [Color(0xFFE0F7FA), Color(0xFFB2EBF2)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
