import 'package:flutter/widgets.dart';

import '../../tokens/abstractions/typography_tokens.dart';
import '../feedback/seal_bouncing_dots.dart';

/// Provides loading-aware content building for text buttons.
///
/// Mix into a widget that exposes [label] and [isLoading] fields. Call
/// [buildContent] to get the label widget or a [SealBouncingDots] indicator
/// sized to the button's text height, keeping the original label invisible to
/// preserve button dimensions during loading.
mixin ButtonLoadingContentMixin {
  /// The button label widget.
  Widget get label;

  /// Whether the button is in a loading state.
  bool get isLoading;

  /// Returns [label] when not loading, otherwise a bouncing-dots indicator.
  Widget buildContent(Color color, TypographyTokens typography) {
    if (!isLoading) return label;

    final style = typography.small;
    final lineHeight =
        (style.fontSize ?? TypographyTokens.kSmallFontSize) *
        (style.height ?? TypographyTokens.kDefaultLineHeightMultiplier);
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: false,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: label,
        ),
        SealBouncingDots(color: color, height: lineHeight),
      ],
    );
  }
}
