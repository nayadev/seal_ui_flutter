import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';

/// A styled toggle switch for the Seal UI design system, built on [ShadSwitch].
///
/// Uses Seal design tokens for track and thumb colors. Optionally renders a
/// [label] and [sublabel] beside the control.
///
/// ```dart
/// SealSwitch(
///   value: _enabled,
///   onChanged: (v) => setState(() => _enabled = v),
///   label: const Text('Enable notifications'),
/// )
/// ```
class SealSwitch extends StatelessWidget {
  /// Creates a Seal-styled switch.
  const SealSwitch({
    super.key,
    required this.value,
    this.onChanged,
    this.enabled = true,
    this.label,
    this.sublabel,
    this.focusNode,
  });

  /// Whether the switch is on.
  final bool value;

  /// Called when the user toggles the switch.
  ///
  /// If `null` the switch is displayed as disabled.
  final ValueChanged<bool>? onChanged;

  /// Whether the switch is interactive.
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

    return ShadSwitch(
      value: value,
      onChanged: (enabled && onChanged != null) ? onChanged : null,
      enabled: enabled,
      focusNode: focusNode,
      checkedTrackColor: colors.primary,
      uncheckedTrackColor: colors.border,
      thumbColor: colors.onPrimary,
      label: label,
      sublabel: sublabel,
    );
  }
}
