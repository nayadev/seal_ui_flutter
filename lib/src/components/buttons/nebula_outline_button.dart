import 'package:flutter/material.dart';

import '../../theme/nebula_theme.dart';
import '../../tokens/abstractions/typography_tokens.dart';
import '../../tokens/base/nebula_radius.dart';
import '../../tokens/base/nebula_dimension.dart';
import '../feedback/nebula_bouncing_dots.dart';

/// The visual variant of a [NebulaOutlineButton].
enum _NebulaOutlineButtonVariant {
  primary,
  accent,
  accentSecondary,
  gradient,
  accentGradient,
}

/// An outlined action button styled with Nebula UI tokens.
///
/// Use the named constructors to choose a variant:
///
/// - [NebulaOutlineButton.primary] — primary brand color border.
/// - [NebulaOutlineButton.accent] — accent color border.
/// - [NebulaOutlineButton.accentSecondary] — secondary accent color border.
/// - [NebulaOutlineButton.gradient] — primary gradient border and text.
/// - [NebulaOutlineButton.accentGradient] — accent gradient border and text.
///
/// ```dart
/// NebulaOutlineButton.primary(
///   label: 'Cancel',
///   onPressed: () {},
/// )
///
/// NebulaOutlineButton.gradient(
///   label: 'Explore',
///   onPressed: () {},
/// )
/// ```
class NebulaOutlineButton extends StatelessWidget {
  const NebulaOutlineButton._({
    super.key,
    required this.label,
    required _NebulaOutlineButtonVariant variant,
    this.onPressed,
    this.isLoading = false,
    this.icon,
  }) : _variant = variant;

  /// Creates an outlined button with the **primary** brand color.
  const factory NebulaOutlineButton.primary({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _PrimaryNebulaOutlineButton;

  /// Creates an outlined button with the **accent** color.
  const factory NebulaOutlineButton.accent({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _AccentNebulaOutlineButton;

  /// Creates an outlined button with the **secondary accent** color.
  const factory NebulaOutlineButton.accentSecondary({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _AccentSecondaryNebulaOutlineButton;

  /// Creates an outlined button with the **primary gradient** border and text.
  const factory NebulaOutlineButton.gradient({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _GradientNebulaOutlineButton;

  /// Creates an outlined button with the **accent gradient** border and text.
  const factory NebulaOutlineButton.accentGradient({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _AccentGradientNebulaOutlineButton;

  /// Button label text.
  final String label;

  /// Callback when the button is tapped. If `null` the button is disabled.
  final VoidCallback? onPressed;

  /// Shows a loading indicator and disables interaction.
  final bool isLoading;

  /// Optional leading icon.
  final IconData? icon;

  final _NebulaOutlineButtonVariant _variant;

  bool get _isDisabled => onPressed == null || isLoading;

  /// Opacity applied to foreground when disabled.
  static const double _kDisabledOpacity = 0.4;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;
    final dimension = context.dimension;

    final bool isGradient =
        _variant == _NebulaOutlineButtonVariant.gradient ||
        _variant == _NebulaOutlineButtonVariant.accentGradient;

    if (isGradient) {
      final gradient = _variant == _NebulaOutlineButtonVariant.gradient
          ? tokens.gradients.primaryGradient
          : tokens.gradients.accentGradient;

      // Use white as the base color; ShaderMask replaces it with the gradient.
      final baseColor = Colors.white;
      final disabledColor = baseColor.withValues(alpha: _kDisabledOpacity);

      Widget button = OutlinedButton(
        onPressed: _isDisabled ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: baseColor,
          disabledForegroundColor: disabledColor,
          side: BorderSide(color: _isDisabled ? disabledColor : baseColor),
          padding: EdgeInsets.symmetric(
            horizontal: dimension.lg,
            vertical: dimension.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: NebulaRadius.borderRadiusSm,
          ),
          textStyle: typo.body.copyWith(fontWeight: FontWeight.w600),
        ),
        child: _buildContent(context, baseColor, typo),
      );

      return AnimatedOpacity(
        opacity: _isDisabled ? _kDisabledOpacity : 1.0,
        duration: const Duration(milliseconds: 200),
        child: ShaderMask(
          shaderCallback: (bounds) => gradient.createShader(bounds),
          blendMode: BlendMode.srcIn,
          child: button,
        ),
      );
    }

    final Color foregroundColor;

    switch (_variant) {
      case _NebulaOutlineButtonVariant.primary:
        foregroundColor = colors.foreground.active;
      case _NebulaOutlineButtonVariant.accent:
        foregroundColor = colors.accent;
      case _NebulaOutlineButtonVariant.accentSecondary:
        foregroundColor = colors.accentSecondary;
      case _NebulaOutlineButtonVariant.gradient:
      case _NebulaOutlineButtonVariant.accentGradient:
        foregroundColor = colors.foreground.active;
    }

    final disabledColor = foregroundColor.withValues(alpha: _kDisabledOpacity);

    return OutlinedButton(
      onPressed: _isDisabled ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: foregroundColor,
        disabledForegroundColor: disabledColor,
        side: BorderSide(color: _isDisabled ? disabledColor : foregroundColor),
        padding: EdgeInsets.symmetric(
          horizontal: dimension.lg,
          vertical: dimension.md,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: NebulaRadius.borderRadiusSm,
        ),
        textStyle: typo.body.copyWith(fontWeight: FontWeight.w600),
      ),
      child: _buildContent(context, foregroundColor, typo),
    );
  }

  Widget _buildContent(BuildContext context, Color foreground, typography) {
    final content = icon != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: context.dimension.scaled(
                  TypographyTokens.kDefaultButtonIconSize,
                ),
              ),
              context.dimension.xxs.horizontalGap,
              Text(label),
            ],
          )
        : Text(label);

    if (!isLoading) return content;

    final style = typography.body;
    final lineHeight =
        (style.fontSize ??
            context.dimension.scaled(TypographyTokens.kBodyFontSize)) *
        (style.height ?? TypographyTokens.kDefaultLineHeightMultiplier);
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: false,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: content,
        ),
        NebulaBouncingDots(color: foreground, height: lineHeight),
      ],
    );
  }
}

/// Redirecting factory for [NebulaOutlineButton.primary].
class _PrimaryNebulaOutlineButton extends NebulaOutlineButton {
  const _PrimaryNebulaOutlineButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
  }) : super._(variant: _NebulaOutlineButtonVariant.primary);
}

/// Redirecting factory for [NebulaOutlineButton.accent].
class _AccentNebulaOutlineButton extends NebulaOutlineButton {
  const _AccentNebulaOutlineButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
  }) : super._(variant: _NebulaOutlineButtonVariant.accent);
}

/// Redirecting factory for [NebulaOutlineButton.accentSecondary].
class _AccentSecondaryNebulaOutlineButton extends NebulaOutlineButton {
  const _AccentSecondaryNebulaOutlineButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
  }) : super._(variant: _NebulaOutlineButtonVariant.accentSecondary);
}

/// Redirecting factory for [NebulaOutlineButton.gradient].
class _GradientNebulaOutlineButton extends NebulaOutlineButton {
  const _GradientNebulaOutlineButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
  }) : super._(variant: _NebulaOutlineButtonVariant.gradient);
}

/// Redirecting factory for [NebulaOutlineButton.accentGradient].
class _AccentGradientNebulaOutlineButton extends NebulaOutlineButton {
  const _AccentGradientNebulaOutlineButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
  }) : super._(variant: _NebulaOutlineButtonVariant.accentGradient);
}
