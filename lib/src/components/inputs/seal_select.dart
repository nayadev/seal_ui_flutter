import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_dimension.dart';

/// A single option item within a [SealSelect] dropdown.
///
/// Each option is identified by its [value] and displayed with [label].
class SealSelectOption<T> {
  /// Creates a select option with [value] and [label].
  const SealSelectOption({required this.value, required this.label});

  /// The value represented by this option.
  final T value;

  /// Human-readable label shown in the dropdown and the trigger.
  final String label;
}

/// A styled dropdown select input for the Seal UI design system,
/// built on [ShadSelect].
///
/// Accepts a list of [SealSelectOption] items. The trigger automatically
/// shows the label of the selected option, or [placeholder] when nothing is
/// selected.
///
/// ```dart
/// SealSelect<String>(
///   label: 'Theme',
///   placeholder: 'Choose a theme',
///   options: const [
///     SealSelectOption(value: 'nebula', label: 'Nebula'),
///     SealSelectOption(value: 'arctic', label: 'Arctic'),
///   ],
///   value: _theme,
///   onChanged: (v) => setState(() => _theme = v),
/// )
/// ```
class SealSelect<T> extends StatelessWidget {
  /// Creates a Seal-styled select dropdown.
  const SealSelect({
    super.key,
    required this.options,
    this.value,
    this.onChanged,
    this.placeholder,
    this.label,
    this.enabled = true,
  });

  /// The list of options available for selection.
  final List<SealSelectOption<T>> options;

  /// The currently selected value (controls the initial display).
  ///
  /// This is passed as `initialValue` to [ShadSelect]. For programmatic
  /// resets use a [Key] to rebuild the widget.
  final T? value;

  /// Called when the user selects a different option.
  final ValueChanged<T?>? onChanged;

  /// Text shown in the trigger when no option is selected.
  final String? placeholder;

  /// Optional label rendered above the control.
  final String? label;

  /// Whether the control is interactive.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;
    final dimension = context.dimension;

    Widget select = ShadSelect<T>(
      placeholder: placeholder != null
          ? Text(
              placeholder!,
              style: typo.small.copyWith(color: colors.textSecondary),
            )
          : null,
      initialValue: value,
      onChanged: (enabled && onChanged != null) ? onChanged : null,
      enabled: enabled,
      selectedOptionBuilder: (context, val) {
        final match = options.where((o) => o.value == val).firstOrNull;
        return Text(
          match?.label ?? '',
          style: typo.small.copyWith(color: colors.textPrimary),
        );
      },
      options: options.map(
        (o) => ShadOption<T>(
          value: o.value,
          child: Text(
            o.label,
            style: typo.small.copyWith(color: colors.textPrimary),
          ),
        ),
      ),
    );

    if (label == null) return select;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: dimension.xs),
          child: Text(
            label!,
            style: typo.small.copyWith(color: colors.textSecondary),
          ),
        ),
        select,
      ],
    );
  }
}
