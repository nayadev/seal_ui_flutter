import 'package:flutter/painting.dart';

import '../../../tokens/abstractions/gradient_tokens.dart';

/// Light-mode gradient tokens for the **Nebula** theme.
///
/// Uses fully opaque pastel tints derived from the Nebula brand colors —
/// soft lavender, periwinkle, and mint — so that surface gradient cards
/// look rich and harmonious on the bright white and off-white surfaces
/// of the Nebula light palette, matching the visual quality of dark mode.
class NebulaLightGradients extends GradientTokens {
  const NebulaLightGradients();

  @override
  LinearGradient get primaryGradient => const LinearGradient(
    colors: [Color(0xFF8055E0), Color(0xFF4A96E8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  LinearGradient get accentGradient => const LinearGradient(
    colors: [Color(0xFF6340B8), Color(0xFF32B88C)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Soft lavender → periwinkle — visible and harmonious on white surfaces.
  @override
  LinearGradient get surfaceGradient => const LinearGradient(
    colors: [Color(0xFFEDE8FF), Color(0xFFE3EFFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Deeper lavender tint range for primary-accented containers.
  @override
  LinearGradient get surfacePrimaryGradient => const LinearGradient(
    colors: [Color(0xFFEAE3FF), Color(0xFFE5DCFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Mint → sky tint for accent-accented containers.
  @override
  LinearGradient get surfaceAccentGradient => const LinearGradient(
    colors: [Color(0xFFDAF5EE), Color(0xFFE0EFFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
