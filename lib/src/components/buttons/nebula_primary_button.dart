import 'package:flutter/material.dart';

import '../../theme/nebula_theme.dart';
import '../../theme/nebula_theme_tokens.dart';
import '../../tokens/abstractions/typography_tokens.dart';
import '../../tokens/base/nebula_radius.dart';
import '../../tokens/base/nebula_dimension.dart';
import '../feedback/nebula_bouncing_dots.dart';

/// A primary action button styled with Nebula UI tokens.
///
/// Supports an optional gradient background via [useGradient].
///
/// ```dart
/// NebulaPrimaryButton(
///   label: 'Get Started',
///   onPressed: () {},
///   useGradient: true,
/// )
/// ```
class NebulaPrimaryButton extends StatelessWidget {
  const NebulaPrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.useGradient = false,
    this.isLoading = false,
    this.icon,
  });

  /// Button label text.
  final String label;

  /// Callback when the button is tapped. If `null` the button is disabled.
  final VoidCallback? onPressed;

  /// When `true`, the button background uses the primary gradient.
  final bool useGradient;

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

    if (useGradient) {
      return _GradientButtonShell(
        tokens: tokens,
        isDisabled: _isDisabled,
        onPressed: onPressed,
        child: _buildContent(context, colors.textPrimary, typo),
      );
    }

    return FilledButton(
      onPressed: _isDisabled ? null : onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: colors.fill.active,
        foregroundColor: colors.textPrimary,
        disabledBackgroundColor: colors.fill.disabled,
        disabledForegroundColor: colors.textPrimary.withValues(alpha: 0.4),
        padding: EdgeInsets.symmetric(
          horizontal: dimension.lg,
          vertical: dimension.md,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: NebulaRadius.borderRadiusSm,
        ),
        textStyle: typo.body.copyWith(fontWeight: FontWeight.w600),
      ),
      child: _buildContent(context, colors.textPrimary, typo),
    );
  }

  Widget _buildContent(BuildContext context, Color textColor, typography) {
    if (isLoading) {
      final style = typography.body;
      final lineHeight =
          (style.fontSize ?? 16) *
          (style.height ?? TypographyTokens.kDefaultLineHeightMultiplier);
      return NebulaBouncingDots(color: textColor, height: lineHeight);
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

/// Internal widget that renders the gradient button shell.
class _GradientButtonShell extends StatelessWidget {
  const _GradientButtonShell({
    required this.tokens,
    required this.isDisabled,
    required this.onPressed,
    required this.child,
  });

  final NebulaThemeTokens tokens;
  final bool isDisabled;
  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final gradient = tokens.gradients.primaryGradient;

    return AnimatedOpacity(
      opacity: isDisabled ? 0.45 : 1.0,
      duration: const Duration(milliseconds: 200),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: NebulaRadius.borderRadiusSm,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: NebulaRadius.borderRadiusSm,
            onTap: isDisabled ? null : onPressed,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.dimension.lg,
                vertical: context.dimension.md,
              ),
              child: DefaultTextStyle.merge(
                style: tokens.typography.body.copyWith(
                  color: tokens.colors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
                child: IconTheme.merge(
                  data: IconThemeData(color: tokens.colors.textPrimary),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
