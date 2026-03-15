import 'package:flutter/painting.dart';

import '../abstractions/gradient_tokens.dart';

/// Light-mode gradient tokens for the Seal UI theme.
///
/// Shares the same primary and accent gradients but uses a softer
/// surface gradient that blends naturally with light backgrounds.
class LightGradients extends GradientTokens {
  const LightGradients();

  @override
  LinearGradient get primaryGradient => const LinearGradient(
    colors: [Color(0xFF9B6DFF), Color(0xFF5BA8FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  LinearGradient get accentGradient => const LinearGradient(
    colors: [Color(0xFF7B4FD4), Color(0xFF32B88C)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  LinearGradient get surfaceGradient => const LinearGradient(
    colors: [Color(0xFFEDE3FF), Color(0xFFDFECFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  LinearGradient get surfacePrimaryGradient => const LinearGradient(
    colors: [Color(0xFFE8DAFF), Color(0xFFF3EAFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  LinearGradient get surfaceAccentGradient => const LinearGradient(
    colors: [Color(0xFFD6EAFF), Color(0xFFD4F5EA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
