import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_dimension.dart';

/// A styled multi-line text area for the Seal UI design system,
/// built on [ShadTextarea].
///
/// Suitable for longer freeform inputs such as descriptions, messages, or
/// comments. Supports resize-by-drag and configurable height bounds.
///
/// ```dart
/// SealTextarea(
///   label: 'Description',
///   hint: 'Enter a description…',
///   controller: _controller,
///   onChanged: (v) => _onDescriptionChanged(v),
/// )
/// ```
class SealTextarea extends StatelessWidget {
  /// Default minimum height in logical pixels.
  static const double _kMinHeight = 80;

  /// Default maximum height in logical pixels.
  static const double _kMaxHeight = 400;

  /// Creates a Seal-styled text area.
  const SealTextarea({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.enabled = true,
    this.onChanged,
    this.minHeight = _kMinHeight,
    this.maxHeight = _kMaxHeight,
    this.resizable = true,
    this.maxLength,
    this.readOnly = false,
    this.autofocus = false,
    this.focusNode,
  });

  /// Optional external [TextEditingController].
  final TextEditingController? controller;

  /// Label displayed above the field.
  final String? label;

  /// Hint displayed inside the empty field.
  final String? hint;

  /// Whether the field is interactive.
  final bool enabled;

  /// Called when the text changes.
  final ValueChanged<String>? onChanged;

  /// Minimum height of the text area.
  final double minHeight;

  /// Maximum height the text area can grow to.
  final double maxHeight;

  /// Whether the user can drag the bottom-right grip to resize.
  final bool resizable;

  /// Maximum number of characters allowed.
  final int? maxLength;

  /// Whether the field is read-only.
  final bool readOnly;

  /// Whether the field requests focus on mount.
  final bool autofocus;

  /// Optional focus node.
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;
    final dimension = context.dimension;

    Widget textarea = ShadTextarea(
      controller: controller,
      placeholder: hint != null
          ? Text(hint!, style: typo.small.copyWith(color: colors.textSecondary))
          : null,
      enabled: enabled,
      onChanged: onChanged,
      minHeight: minHeight,
      maxHeight: maxHeight,
      resizable: resizable,
      maxLength: maxLength,
      readOnly: readOnly,
      autofocus: autofocus,
      focusNode: focusNode,
      style: typo.small.copyWith(color: colors.textPrimary),
    );

    if (label == null) return textarea;

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
        textarea,
      ],
    );
  }
}
