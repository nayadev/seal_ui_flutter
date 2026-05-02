import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Provides gradient [ShaderMask] wrapping and tooltip helpers for buttons.
///
/// Mix into a widget and call [wrapWithGradientShaderMask] to apply an
/// [AnimatedOpacity] + [ShaderMask] + optional [ShadTooltip] around any child,
/// or call [wrapWithTooltip] for a plain tooltip wrap without a shader.
mixin GradientShaderMaskMixin {
  /// Wraps [child] in a [ShadTooltip] when [tooltip] is non-null.
  Widget wrapWithTooltip(Widget child, String? tooltip) {
    if (tooltip == null) return child;
    return ShadTooltip(builder: (_) => Text(tooltip), child: child);
  }

  /// Wraps [child] in [AnimatedOpacity] + [ShaderMask] to apply a gradient fill.
  ///
  /// Optionally wraps the result in a [ShadTooltip] when [tooltip] is non-null.
  Widget wrapWithGradientShaderMask(
    Widget child,
    LinearGradient gradient, {
    required bool isDisabled,
    required double disabledOpacity,
    String? tooltip,
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
    return ShadTooltip(builder: (_) => Text(tooltip), child: masked);
  }
}
