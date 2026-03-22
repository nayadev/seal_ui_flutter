import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_dimension.dart';

/// A styled range slider for the Seal UI design system, built on [ShadSlider].
///
/// Either [value] (uncontrolled initial position) **or** [controller] must be
/// provided, but not both.
///
/// ```dart
/// // Uncontrolled — sets the starting thumb position
/// SealSlider(value: 0.5, onChanged: (v) => print(v))
///
/// // Controlled via external controller
/// final _ctrl = ShadSliderController(initialValue: 0.3);
/// SealSlider(controller: _ctrl, onChanged: (v) => _doSomething(v))
/// ```
class SealSlider extends StatelessWidget {
  /// Default track height in logical pixels.
  static const double _kTrackHeight = 8;

  /// Default thumb radius in logical pixels.
  static const double _kThumbRadius = 10;

  /// Creates a Seal-styled slider.
  ///
  /// Exactly one of [value] or [controller] must be provided.
  const SealSlider({
    super.key,
    this.value,
    this.controller,
    this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.enabled = true,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.focusNode,
  }) : assert(
         (value != null) ^ (controller != null),
         'Exactly one of value or controller must be provided.',
       );

  /// Initial thumb position (uncontrolled). Mutually exclusive with
  /// [controller].
  final double? value;

  /// External controller for programmatic control. Mutually exclusive with
  /// [value].
  final ShadSliderController? controller;

  /// Called continuously as the user drags the thumb.
  final ValueChanged<double>? onChanged;

  /// Called when the user begins dragging.
  final ValueChanged<double>? onChangeStart;

  /// Called when the user releases the thumb.
  final ValueChanged<double>? onChangeEnd;

  /// Whether the slider is interactive.
  final bool enabled;

  /// Minimum selectable value.
  final double min;

  /// Maximum selectable value.
  final double max;

  /// Number of discrete snap positions between [min] and [max].
  ///
  /// `null` = continuous.
  final int? divisions;

  /// Optional focus node.
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final dimension = context.dimension;

    return ShadSlider(
      initialValue: value,
      controller: controller,
      onChanged: enabled ? onChanged : null,
      onChangeStart: onChangeStart,
      onChangeEnd: onChangeEnd,
      enabled: enabled,
      min: min,
      max: max,
      divisions: divisions,
      focusNode: focusNode,
      activeTrackColor: colors.primary,
      inactiveTrackColor: colors.border,
      thumbColor: colors.background,
      thumbBorderColor: colors.primary,
      disabledActiveTrackColor: colors.fill.disabled,
      disabledInactiveTrackColor: colors.border,
      disabledThumbBorderColor: colors.fill.disabled,
      trackHeight: dimension.scaled(_kTrackHeight),
      thumbRadius: dimension.scaled(_kThumbRadius),
    );
  }
}
