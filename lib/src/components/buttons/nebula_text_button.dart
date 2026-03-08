import 'package:flutter/material.dart';

import '../../theme/nebula_theme.dart';
import '../../tokens/abstractions/typography_tokens.dart';
import '../../tokens/base/nebula_radius.dart';
import '../../tokens/base/nebula_dimension.dart';
import '../../foundation/nebula_underline_extension.dart';
import '../feedback/nebula_bouncing_dots.dart';

/// The visual variant of a [NebulaTextButton].
enum _NebulaTextButtonVariant {
  primary,
  accent,
  accentSecondary,
  gradient,
  accentGradient,
}

/// A borderless, background-less button styled with Nebula UI tokens.
///
/// Use the named constructors to choose a variant:
///
/// - [NebulaTextButton.primary] — primary brand color text.
/// - [NebulaTextButton.accent] — accent color text.
/// - [NebulaTextButton.accentSecondary] — secondary accent color text.
/// - [NebulaTextButton.gradient] — primary gradient text and underline.
/// - [NebulaTextButton.accentGradient] — accent gradient text and underline.
///
/// ```dart
/// NebulaTextButton.primary(
///   label: 'Learn more',
///   onPressed: () {},
/// )
///
/// NebulaTextButton.gradient(
///   label: 'Discover',
///   onPressed: () {},
/// )
/// ```
class NebulaTextButton extends StatelessWidget {
  const NebulaTextButton._({
    super.key,
    required this.label,
    required _NebulaTextButtonVariant variant,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.iconSize = TypographyTokens.kDefaultButtonIconSize,
  }) : _variant = variant;

  /// Creates a text button with the **primary** brand color.
  const factory NebulaTextButton.primary({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
    double iconSize,
  }) = _PrimaryNebulaTextButton;

  /// Creates a text button with the **accent** color.
  const factory NebulaTextButton.accent({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
    double iconSize,
  }) = _AccentNebulaTextButton;

  /// Creates a text button with the **secondary accent** color.
  const factory NebulaTextButton.accentSecondary({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
    double iconSize,
  }) = _AccentSecondaryNebulaTextButton;

  /// Creates a text button with the **primary gradient** text and underline.
  const factory NebulaTextButton.gradient({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
    double iconSize,
  }) = _GradientNebulaTextButton;

  /// Creates a text button with the **accent gradient** text and underline.
  const factory NebulaTextButton.accentGradient({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
    double iconSize,
  }) = _AccentGradientNebulaTextButton;

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

  final _NebulaTextButtonVariant _variant;

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
        _variant == _NebulaTextButtonVariant.gradient ||
        _variant == _NebulaTextButtonVariant.accentGradient;

    if (isGradient) {
      final gradient = _variant == _NebulaTextButtonVariant.gradient
          ? tokens.gradients.primaryGradient
          : tokens.gradients.accentGradient;

      final baseColor = Colors.white;
      final disabledColor = baseColor.withValues(alpha: _kDisabledOpacity);

      Widget button = TextButton(
        onPressed: _isDisabled ? null : onPressed,
        style: TextButton.styleFrom(
          foregroundColor: baseColor,
          disabledForegroundColor: disabledColor,
          padding: EdgeInsets.symmetric(
            horizontal: dimension.md,
            vertical: dimension.sm,
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
      case _NebulaTextButtonVariant.primary:
        foregroundColor = colors.foreground.active;
      case _NebulaTextButtonVariant.accent:
        foregroundColor = colors.accent;
      case _NebulaTextButtonVariant.accentSecondary:
        foregroundColor = colors.accentSecondary;
      case _NebulaTextButtonVariant.gradient:
      case _NebulaTextButtonVariant.accentGradient:
        foregroundColor = colors.foreground.active;
    }

    final disabledColor = foregroundColor.withValues(alpha: _kDisabledOpacity);

    return TextButton(
      onPressed: _isDisabled ? null : onPressed,
      style: TextButton.styleFrom(
        foregroundColor: foregroundColor,
        disabledForegroundColor: disabledColor,
        padding: EdgeInsets.symmetric(
          horizontal: dimension.md,
          vertical: dimension.sm,
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
    final underlineColor = _isDisabled
        ? context.themeTokens.colors.foreground.disabled
        : foreground;

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
          ).withUnderline(context: context, color: underlineColor)
        : Text(label).withUnderline(context: context, color: underlineColor);

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
        NebulaBouncingDots(
          color: foreground,
          height: lineHeight,
        ).withUnderline(context: context, color: foreground),
      ],
    );
  }
}

/// Redirecting factory for [NebulaTextButton.primary].
class _PrimaryNebulaTextButton extends NebulaTextButton {
  const _PrimaryNebulaTextButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
    super.iconSize,
  }) : super._(variant: _NebulaTextButtonVariant.primary);
}

/// Redirecting factory for [NebulaTextButton.accent].
class _AccentNebulaTextButton extends NebulaTextButton {
  const _AccentNebulaTextButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
    super.iconSize,
  }) : super._(variant: _NebulaTextButtonVariant.accent);
}

/// Redirecting factory for [NebulaTextButton.accentSecondary].
class _AccentSecondaryNebulaTextButton extends NebulaTextButton {
  const _AccentSecondaryNebulaTextButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
    super.iconSize,
  }) : super._(variant: _NebulaTextButtonVariant.accentSecondary);
}

/// Redirecting factory for [NebulaTextButton.gradient].
class _GradientNebulaTextButton extends NebulaTextButton {
  const _GradientNebulaTextButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
    super.iconSize,
  }) : super._(variant: _NebulaTextButtonVariant.gradient);
}

/// Redirecting factory for [NebulaTextButton.accentGradient].
class _AccentGradientNebulaTextButton extends NebulaTextButton {
  const _AccentGradientNebulaTextButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
    super.iconSize,
  }) : super._(variant: _NebulaTextButtonVariant.accentGradient);
}
