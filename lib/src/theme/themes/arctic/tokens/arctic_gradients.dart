import 'package:flutter/painting.dart';

import '../../../../tokens/abstractions/gradient_tokens.dart';

/// Gradient tokens for the **Arctic** theme.
///
/// Ice-blue → glacier cyan gradients evoke a crisp, frozen aesthetic.
class ArcticGradients extends GradientTokens {
  /// Creates [ArcticGradients] tokens.
  const ArcticGradients();

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

  @override
  LinearGradient get surfaceGradient => const LinearGradient(
    colors: [Color(0x1429B6F6), Color(0x1426C6DA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  LinearGradient get surfacePrimaryGradient => const LinearGradient(
    colors: [Color(0x1929B6F6), Color(0x190288D1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  LinearGradient get surfaceAccentGradient => const LinearGradient(
    colors: [Color(0x1926C6DA), Color(0x1900BCD4)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
