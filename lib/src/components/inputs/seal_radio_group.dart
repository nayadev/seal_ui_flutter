import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_dimension.dart';

/// A single radio button option within a [SealRadioGroup].
///
/// Each item is identified by its [value] and displays an optional [label]
/// and [sublabel].
///
/// ```dart
/// SealRadioItem(
///   value: 'dark',
///   label: const Text('Dark mode'),
/// )
/// ```
class SealRadioItem<T> {
  /// Creates a radio item with [value] and an optional [label] / [sublabel].
  const SealRadioItem({
    required this.value,
    this.label,
    this.sublabel,
    this.enabled = true,
  });

  /// The value represented by this radio button.
  final T value;

  /// Optional primary label rendered beside the control.
  final Widget? label;

  /// Optional secondary label rendered below [label].
  final Widget? sublabel;

  /// Whether this individual radio button is interactive.
  final bool enabled;
}

/// A group of mutually exclusive radio buttons styled with Seal UI tokens,
/// built on [ShadRadioGroup].
///
/// ```dart
/// SealRadioGroup<String>(
///   items: const [
///     SealRadioItem(value: 'light', label: Text('Light')),
///     SealRadioItem(value: 'dark',  label: Text('Dark')),
///   ],
///   value: _selected,
///   onChanged: (v) => setState(() => _selected = v),
/// )
/// ```
class SealRadioGroup<T> extends StatelessWidget {
  /// Default radio button size in logical pixels.
  static const double _kSize = 16;

  /// Default inner dot size in logical pixels.
  static const double _kCircleSize = 10;

  /// Creates a Seal-styled radio group.
  const SealRadioGroup({
    super.key,
    required this.items,
    this.value,
    this.onChanged,
    this.enabled = true,
    this.axis = Axis.vertical,
    this.spacing,
  });

  /// The radio options to display.
  final List<SealRadioItem<T>> items;

  /// The currently selected value.
  final T? value;

  /// Called when the user selects a different option.
  final ValueChanged<T?>? onChanged;

  /// Whether the entire group is interactive.
  final bool enabled;

  /// Layout direction for the radio items.
  final Axis axis;

  /// Gap between radio items.
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final dimension = context.dimension;
    final effectiveSpacing = spacing ?? dimension.xs;
    final size = dimension.scaled(_kSize);
    final circleSize = dimension.scaled(_kCircleSize);

    return ShadRadioGroup<T>(
      initialValue: value,
      onChanged: (enabled && onChanged != null) ? onChanged : null,
      enabled: enabled,
      axis: axis,
      spacing: effectiveSpacing,
      items: items.map((item) {
        return ShadRadio<T>(
          value: item.value,
          enabled: enabled && item.enabled,
          color: colors.primary,
          size: size,
          circleSize: circleSize,
          label: item.label,
          sublabel: item.sublabel,
        );
      }).toList(),
    );
  }
}
