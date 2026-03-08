import 'package:flutter/painting.dart';

import '../abstractions/gradient_tokens.dart';

/// Dark gradient tokens for the Nebula UI theme.
///
/// Purple → Blue gradient is the primary visual identity.
class DarkGradients extends GradientTokens {
  const DarkGradients();

  @override
  LinearGradient get primaryGradient => const LinearGradient(
    colors: [Color(0xFF9B6DFF), Color(0xFF5BA8FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  LinearGradient get accentGradient => const LinearGradient(
    colors: [Color(0xFF7B4FD4), Color(0xFF4DDEB0)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  LinearGradient get surfaceGradient => const LinearGradient(
    colors: [Color(0x329B6DFF), Color(0x325BA8FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  LinearGradient get surfacePrimaryGradient => const LinearGradient(
    colors: [Color(0x339B6DFF), Color(0x337B4FD4)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  LinearGradient get surfaceAccentGradient => const LinearGradient(
    colors: [Color(0x335BA8FF), Color(0x334DDEB0)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
