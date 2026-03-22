import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_dimension.dart';

/// A styled checkbox for the Seal UI design system, built on [ShadCheckbox].
///
/// Uses Seal design tokens for colors and sizing. Optionally renders a [label]
/// and [sublabel] beside the control.
///
/// ```dart
/// SealCheckbox(
///   value: _checked,
///   onChanged: (v) => setState(() => _checked = v),
///   label: const Text('Accept terms'),
/// )
/// ```
class SealCheckbox extends StatelessWidget {
  /// Default checkbox size in logical pixels.
  static const double _kSize = 16;

  /// Creates a Seal-styled checkbox.
  const SealCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.enabled = true,
    this.label,
    this.sublabel,
    this.focusNode,
  });

  /// Whether the checkbox is checked.
  final bool value;

  /// Called when the user toggles the checkbox.
  ///
  /// If `null` the checkbox is displayed as disabled.
  final ValueChanged<bool>? onChanged;

  /// Whether the checkbox is interactive.
  final bool enabled;

  /// Optional primary label widget rendered beside the control.
  final Widget? label;

  /// Optional secondary label rendered below [label].
  final Widget? sublabel;

  /// Optional focus node.
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final dimension = context.dimension;

    return ShadCheckbox(
      value: value,
      onChanged: (enabled && onChanged != null) ? onChanged : null,
      enabled: enabled,
      focusNode: focusNode,
      color: colors.primary,
      size: dimension.scaled(_kSize),
      label: label,
      sublabel: sublabel,
    );
  }
}
