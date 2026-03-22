import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme.dart';
import '../../tokens/base/seal_dimension.dart';

/// A styled text field for the Seal UI design system, built on [ShadInput].
///
/// Wraps shadcn_ui's [ShadInput] with Seal design-token-driven styling.
///
/// When [obscureText] is `true` a visibility-toggle icon is automatically
/// added to the trailing slot so the user can reveal or hide the value.
///
/// ```dart
/// SealTextField(
///   label: 'Email',
///   hint: 'you@example.com',
///   prefixIcon: Icons.mail_outline_rounded,
/// )
///
/// SealTextField(
///   label: 'Password',
///   hint: '••••••••',
///   obscureText: true,
///   prefixIcon: Icons.lock_outline_rounded,
/// )
/// ```
class SealTextField extends StatefulWidget {
  /// Default icon size for prefix/suffix icons.
  static const double _kIconSize = 20;

  const SealTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.obscureText = false,
    this.enabled = true,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.maxLines = 1,
  });

  /// Optional external [TextEditingController].
  final TextEditingController? controller;

  /// Label displayed above the field.
  final String? label;

  /// Hint displayed inside the empty field.
  final String? hint;

  /// Whether the text is obscured (e.g. passwords).
  ///
  /// When `true`, a visibility-toggle button is automatically placed in the
  /// trailing slot. Any [suffixIcon] is ignored for obscured fields.
  final bool obscureText;

  /// Whether the field is interactive.
  final bool enabled;

  /// Called when the text changes.
  final ValueChanged<String>? onChanged;

  /// Icon at the start of the field.
  final IconData? prefixIcon;

  /// Icon at the end of the field.
  ///
  /// Ignored when [obscureText] is `true`; the toggle icon takes precedence.
  final IconData? suffixIcon;

  /// Keyboard type hint.
  final TextInputType? keyboardType;

  /// Maximum number of lines.
  final int maxLines;

  @override
  State<SealTextField> createState() => _SealTextFieldState();
}

class _SealTextFieldState extends State<SealTextField> {
  late bool _isObscured = widget.obscureText;

  @override
  void didUpdateWidget(SealTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.obscureText != widget.obscureText) {
      _isObscured = widget.obscureText;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;
    final iconSize = context.dimension.scaled(SealTextField._kIconSize);

    Widget? trailing;
    if (widget.obscureText) {
      trailing = GestureDetector(
        onTap: () => setState(() => _isObscured = !_isObscured),
        child: Icon(
          _isObscured ? LucideIcons.eyeOff : LucideIcons.eye,
          color: colors.textSecondary,
          size: iconSize,
        ),
      );
    } else if (widget.suffixIcon != null) {
      trailing = Icon(
        widget.suffixIcon,
        color: colors.textSecondary,
        size: iconSize,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null)
          Padding(
            padding: EdgeInsets.only(bottom: context.dimension.xs),
            child: Text(
              widget.label!,
              style: typo.small.copyWith(color: colors.textSecondary),
            ),
          ),
        ShadInput(
          controller: widget.controller,
          placeholder: widget.hint != null ? Text(widget.hint!) : null,
          obscureText: _isObscured,
          enabled: widget.enabled,
          onChanged: widget.onChanged,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          // Center text/placeholder vertically for single-line inputs.
          // ShadInput resolves `alignment` and `placeholderAlignment`
          // independently; both default to Alignment.topLeft which misaligns
          // them against leading/trailing icons in single-line mode.
          alignment: widget.maxLines == 1 ? Alignment.centerLeft : Alignment.topLeft,
          placeholderAlignment:
              widget.maxLines == 1 ? Alignment.centerLeft : Alignment.topLeft,
          style: typo.body.copyWith(color: colors.textPrimary),
          cursorColor: colors.primary,
          leading: widget.prefixIcon != null
              ? Icon(
                  widget.prefixIcon,
                  color: colors.textSecondary,
                  size: iconSize,
                )
              : null,
          trailing: trailing,
        ),
      ],
    );
  }
}
