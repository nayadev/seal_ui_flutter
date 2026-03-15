import 'package:flutter/material.dart';

import '../../theme/seal_theme.dart';
import '../../tokens/abstractions/typography_tokens.dart';
import '../../tokens/base/seal_radius.dart';
import '../../tokens/base/seal_dimension.dart';
import '../../foundation/seal_underline_extension.dart';
import '../feedback/seal_bouncing_dots.dart';

/// The visual variant of a [SealTextButton].
enum _SealTextButtonVariant {
  primary,
  accent,
  accentSecondary,
  gradient,
  accentGradient,
}

/// A borderless, background-less button styled with Seal UI tokens.
///
/// Use the named constructors to choose a variant:
///
/// - [SealTextButton.primary] — primary brand color text.
/// - [SealTextButton.accent] — accent color text.
/// - [SealTextButton.accentSecondary] — secondary accent color text.
/// - [SealTextButton.gradient] — primary gradient text and underline.
/// - [SealTextButton.accentGradient] — accent gradient text and underline.
///
/// ```dart
/// SealTextButton.primary(
///   label: 'Learn more',
///   onPressed: () {},
/// )
///
/// SealTextButton.gradient(
///   label: 'Discover',
///   onPressed: () {},
/// )
/// ```
class SealTextButton extends StatelessWidget {
  const SealTextButton._({
    super.key,
    required this.label,
    required _SealTextButtonVariant variant,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.iconSize = TypographyTokens.kDefaultButtonIconSize,
  }) : _variant = variant;

  /// Creates a text button with the **primary** brand color.
  const factory SealTextButton.primary({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
    double iconSize,
  }) = _PrimarySealTextButton;

  /// Creates a text button with the **accent** color.
  const factory SealTextButton.accent({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
    double iconSize,
  }) = _AccentSealTextButton;

  /// Creates a text button with the **secondary accent** color.
  const factory SealTextButton.accentSecondary({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
    double iconSize,
  }) = _AccentSecondarySealTextButton;

  /// Creates a text button with the **primary gradient** text and underline.
  const factory SealTextButton.gradient({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
    double iconSize,
  }) = _GradientSealTextButton;

  /// Creates a text button with the **accent gradient** text and underline.
  const factory SealTextButton.accentGradient({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
    double iconSize,
  }) = _AccentGradientSealTextButton;

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

  final _SealTextButtonVariant _variant;

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
        _variant == _SealTextButtonVariant.gradient ||
        _variant == _SealTextButtonVariant.accentGradient;

    if (isGradient) {
      final gradient = _variant == _SealTextButtonVariant.gradient
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
            borderRadius: SealRadius.borderRadiusSm,
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
      case _SealTextButtonVariant.primary:
        foregroundColor = colors.foreground.active;
      case _SealTextButtonVariant.accent:
        foregroundColor = colors.accent;
      case _SealTextButtonVariant.accentSecondary:
        foregroundColor = colors.accentSecondary;
      case _SealTextButtonVariant.gradient:
      case _SealTextButtonVariant.accentGradient:
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
          borderRadius: SealRadius.borderRadiusSm,
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
        SealBouncingDots(
          color: foreground,
          height: lineHeight,
        ).withUnderline(context: context, color: foreground),
      ],
    );
  }
}

/// Redirecting factory for [SealTextButton.primary].
class _PrimarySealTextButton extends SealTextButton {
  const _PrimarySealTextButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
    super.iconSize,
  }) : super._(variant: _SealTextButtonVariant.primary);
}

/// Redirecting factory for [SealTextButton.accent].
class _AccentSealTextButton extends SealTextButton {
  const _AccentSealTextButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
    super.iconSize,
  }) : super._(variant: _SealTextButtonVariant.accent);
}

/// Redirecting factory for [SealTextButton.accentSecondary].
class _AccentSecondarySealTextButton extends SealTextButton {
  const _AccentSecondarySealTextButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
    super.iconSize,
  }) : super._(variant: _SealTextButtonVariant.accentSecondary);
}

/// Redirecting factory for [SealTextButton.gradient].
class _GradientSealTextButton extends SealTextButton {
  const _GradientSealTextButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
    super.iconSize,
  }) : super._(variant: _SealTextButtonVariant.gradient);
}

/// Redirecting factory for [SealTextButton.accentGradient].
class _AccentGradientSealTextButton extends SealTextButton {
  const _AccentGradientSealTextButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
    super.iconSize,
  }) : super._(variant: _SealTextButtonVariant.accentGradient);
}
