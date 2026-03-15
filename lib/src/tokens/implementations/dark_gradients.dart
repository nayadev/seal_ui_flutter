import 'package:flutter/painting.dart';

import '../abstractions/gradient_tokens.dart';

/// Dark gradient tokens for the Seal UI theme.
///
/// Purple → Blue gradient is the primary visual identity.
class DarkGradients extends GradientTokens {
  const DarkGradients();

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

  @override
  LinearGradient get surfaceGradient => const LinearGradient(
    colors: [Color(0x328055E0), Color(0x324A96E8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  LinearGradient get surfacePrimaryGradient => const LinearGradient(
    colors: [Color(0x338055E0), Color(0x336340B8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  LinearGradient get surfaceAccentGradient => const LinearGradient(
    colors: [Color(0x334A96E8), Color(0x3332B88C)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
