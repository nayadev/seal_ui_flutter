import 'package:flutter/painting.dart';

import '../abstractions/gradient_tokens.dart';

/// Default gradient tokens for the dark Nebula UI theme.
///
/// Purple → Blue gradient is the primary visual identity.
class DefaultGradients extends GradientTokens {
  const DefaultGradients();

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
    colors: [
      Color.fromARGB(50, 155, 109, 255),
      Color.fromARGB(50, 91, 168, 255),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
