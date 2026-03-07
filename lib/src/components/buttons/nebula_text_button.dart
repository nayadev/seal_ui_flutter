import 'package:flutter/material.dart';

import '../../theme/nebula_theme.dart';
import '../../tokens/base/nebula_radius.dart';
import '../../tokens/base/nebula_dimension.dart';

/// A borderless, background-less button styled with Nebula UI tokens.
///
/// Ideal for tertiary actions such as "Cancel", inline links, or
/// low-emphasis actions that accompany a primary or outline button.
///
/// ```dart
/// NebulaTextButton(
///   label: 'Learn more',
///   onPressed: () {},
/// )
/// ```
class NebulaTextButton extends StatelessWidget {
  const NebulaTextButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.iconSize = 18.0,
  });

  /// Button label text.
  final String label;

  /// Callback when the button is tapped. If `null` the button is disabled.
  final VoidCallback? onPressed;

  /// Shows a loading indicator and disables interaction.
  final bool isLoading;

  /// Optional leading icon.
  final IconData? icon;

  /// Size of the optional leading icon.
  final double iconSize;

  bool get _isDisabled => onPressed == null || isLoading;

  static const double kUnderlineThickness = 1.5;
  static const double kUnderlineOffset = 2.0;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;
    final dimension = context.dimension;

    return TextButton(
      onPressed: _isDisabled ? null : onPressed,
      style: TextButton.styleFrom(
        foregroundColor: colors.foreground.active,
        disabledForegroundColor: colors.foreground.disabled,
        padding: EdgeInsets.symmetric(
          horizontal: dimension.md,
          vertical: dimension.sm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: NebulaRadius.borderRadiusSm,
        ),
        textStyle: typo.body.copyWith(fontWeight: FontWeight.w600),
      ),
      child: _buildContent(context, colors.foreground.active, typo),
    );
  }

  Widget _buildContent(BuildContext context, Color foreground, typography) {
    if (isLoading) {
      return SizedBox(
        height: context.dimension.lg,
        width: context.dimension.lg,
        child: CircularProgressIndicator(strokeWidth: 2, color: foreground),
      );
    }

    final underlineColor = _isDisabled
        ? context.themeTokens.colors.foreground.disabled
        : foreground;

    if (icon != null) {
      return Container(
        padding: const EdgeInsets.only(bottom: kUnderlineOffset),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: underlineColor,
              width: kUnderlineThickness,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18),
            context.dimension.xxs.horizontalGap,
            Text(label),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.only(bottom: kUnderlineOffset),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: underlineColor, width: kUnderlineThickness),
        ),
      ),
      child: Text(label),
    );
  }
}
