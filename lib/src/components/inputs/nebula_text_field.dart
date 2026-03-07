import 'package:flutter/material.dart';

import '../../theme/nebula_theme.dart';
import '../../tokens/base/nebula_radius.dart';
import '../../tokens/base/nebula_dimension.dart';

/// A styled text field for the Nebula UI design system.
///
/// Wraps Material's [TextField] with design-token-driven styling.
///
/// ```dart
/// NebulaTextField(
///   label: 'Email',
///   hint: 'you@example.com',
/// )
/// ```
class NebulaTextField extends StatelessWidget {
  /// Opacity applied to hint text.
  static const double _kHintTextOpacity = 0.6;

  /// Opacity applied to the border when the field is disabled.
  static const double _kDisabledBorderOpacity = 0.4;

  /// Default icon size for prefix/suffix icons.
  static const double _kIconSize = 20;

  /// Border width for the focused input border.
  static const double _kFocusedBorderWidth = 2;

  const NebulaTextField({
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
  final bool obscureText;

  /// Whether the field is interactive.
  final bool enabled;

  /// Called when the text changes.
  final ValueChanged<String>? onChanged;

  /// Icon at the start of the field.
  final IconData? prefixIcon;

  /// Icon at the end of the field.
  final IconData? suffixIcon;

  /// Keyboard type hint.
  final TextInputType? keyboardType;

  /// Maximum number of lines.
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;

    return TextField(
      controller: controller,
      obscureText: obscureText,
      enabled: enabled,
      onChanged: onChanged,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: typo.body.copyWith(color: colors.textPrimary),
      cursorColor: colors.primary,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: typo.small.copyWith(color: colors.textSecondary),
        hintStyle: typo.body.copyWith(
          color: colors.textSecondary.withValues(alpha: _kHintTextOpacity),
        ),
        filled: true,
        fillColor: colors.surfaceAlt,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: colors.textSecondary, size: _kIconSize)
            : null,
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon, color: colors.textSecondary, size: _kIconSize)
            : null,
        contentPadding: EdgeInsets.symmetric(
          horizontal: context.dimension.md,
          vertical: context.dimension.sm,
        ),
        border: OutlineInputBorder(
          borderRadius: NebulaRadius.borderRadiusSm,
          borderSide: BorderSide(color: colors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: NebulaRadius.borderRadiusSm,
          borderSide: BorderSide(color: colors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: NebulaRadius.borderRadiusSm,
          borderSide: BorderSide(
            color: colors.primary,
            width: _kFocusedBorderWidth,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: NebulaRadius.borderRadiusSm,
          borderSide: BorderSide(
            color: colors.border.withValues(alpha: _kDisabledBorderOpacity),
          ),
        ),
      ),
    );
  }
}
