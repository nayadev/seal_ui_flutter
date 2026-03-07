import 'package:flutter/material.dart';

import '../../theme/nebula_theme.dart';
import '../../tokens/base/nebula_radius.dart';
import '../../tokens/base/nebula_dimension.dart';
import '../feedback/nebula_bouncing_dots.dart';

/// A secondary action button with an outlined border styled with Nebula UI tokens.
///
/// Ideal for secondary actions that sit alongside a [NebulaPrimaryButton].
///
/// ```dart
/// NebulaOutlineButton(
///   label: 'Cancel',
///   onPressed: () {},
/// )
/// ```
class NebulaOutlineButton extends StatelessWidget {
  const NebulaOutlineButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.icon,
  });

  /// Button label text.
  final String label;

  /// Callback when the button is tapped. If `null` the button is disabled.
  final VoidCallback? onPressed;

  /// Shows a loading indicator and disables interaction.
  final bool isLoading;

  /// Optional leading icon.
  final IconData? icon;

  bool get _isDisabled => onPressed == null || isLoading;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;
    final dimension = context.dimension;

    return OutlinedButton(
      onPressed: _isDisabled ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: colors.foreground.active,
        disabledForegroundColor: colors.foreground.disabled,
        side: BorderSide(
          color: _isDisabled
              ? colors.foreground.disabled
              : colors.foreground.active,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: dimension.lg,
          vertical: dimension.md,
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
      return NebulaBouncingDots(color: foreground);
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18),
          context.dimension.xxs.horizontalGap,
          Text(label),
        ],
      );
    }

    return Text(label);
  }
}
