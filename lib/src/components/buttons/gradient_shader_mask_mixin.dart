import 'package:flutter/widgets.dart';

import '../interaction/tooltip_mixin.dart';

/// Provides gradient [ShaderMask] wrapping for buttons.
///
/// Mix into a widget and call [wrapWithGradientShaderMask] to apply an
/// [AnimatedOpacity] + [ShaderMask] + optional [ShadTooltip] around any child.
/// For plain tooltip wrapping use [TooltipMixin.wrapWithTooltip] directly.
mixin GradientShaderMaskMixin on TooltipMixin {
  /// Wraps [child] in [AnimatedOpacity] + [ShaderMask] to apply a gradient fill.
  ///
  /// Optionally wraps the result in a [ShadTooltip] when [tooltip] is non-null.
  Widget wrapWithGradientShaderMask(
    Widget child,
    LinearGradient gradient, {
    required bool isDisabled,
    required double disabledOpacity,
    Widget? tooltip,
  }) {
    final Widget masked = AnimatedOpacity(
      opacity: isDisabled ? disabledOpacity : 1.0,
      duration: const Duration(milliseconds: 200),
      child: ShaderMask(
        shaderCallback: (bounds) => gradient.createShader(bounds),
        blendMode: BlendMode.srcIn,
        child: child,
      ),
    );
    if (tooltip == null) return masked;
    return wrapWithTooltip(masked, tooltip);
  }
}
