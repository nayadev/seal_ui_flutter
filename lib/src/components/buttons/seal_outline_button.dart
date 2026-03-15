import 'package:flutter/material.dart';

import '../../theme/seal_theme.dart';
import '../../tokens/abstractions/typography_tokens.dart';
import '../../tokens/base/seal_radius.dart';
import '../../tokens/base/seal_dimension.dart';
import '../feedback/seal_bouncing_dots.dart';

/// The visual variant of a [SealOutlineButton].
enum _SealOutlineButtonVariant {
  primary,
  accent,
  accentSecondary,
  gradient,
  accentGradient,
}

/// An outlined action button styled with Seal UI tokens.
///
/// Use the named constructors to choose a variant:
///
/// - [SealOutlineButton.primary] — primary brand color border.
/// - [SealOutlineButton.accent] — accent color border.
/// - [SealOutlineButton.accentSecondary] — secondary accent color border.
/// - [SealOutlineButton.gradient] — primary gradient border and text.
/// - [SealOutlineButton.accentGradient] — accent gradient border and text.
///
/// ```dart
/// SealOutlineButton.primary(
///   label: 'Cancel',
///   onPressed: () {},
/// )
///
/// SealOutlineButton.gradient(
///   label: 'Explore',
///   onPressed: () {},
/// )
/// ```
class SealOutlineButton extends StatelessWidget {
  const SealOutlineButton._({
    super.key,
    required this.label,
    required _SealOutlineButtonVariant variant,
    this.onPressed,
    this.isLoading = false,
    this.icon,
  }) : _variant = variant;

  /// Creates an outlined button with the **primary** brand color.
  const factory SealOutlineButton.primary({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _PrimarySealOutlineButton;

  /// Creates an outlined button with the **accent** color.
  const factory SealOutlineButton.accent({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _AccentSealOutlineButton;

  /// Creates an outlined button with the **secondary accent** color.
  const factory SealOutlineButton.accentSecondary({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _AccentSecondarySealOutlineButton;

  /// Creates an outlined button with the **primary gradient** border and text.
  const factory SealOutlineButton.gradient({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _GradientSealOutlineButton;

  /// Creates an outlined button with the **accent gradient** border and text.
  const factory SealOutlineButton.accentGradient({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _AccentGradientSealOutlineButton;

  /// Button label text.
  final String label;

  /// Callback when the button is tapped. If `null` the button is disabled.
  final VoidCallback? onPressed;

  /// Shows a loading indicator and disables interaction.
  final bool isLoading;

  /// Optional leading icon.
  final IconData? icon;

  final _SealOutlineButtonVariant _variant;

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
        _variant == _SealOutlineButtonVariant.gradient ||
        _variant == _SealOutlineButtonVariant.accentGradient;

    if (isGradient) {
      final gradient = _variant == _SealOutlineButtonVariant.gradient
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
      case _SealOutlineButtonVariant.primary:
        foregroundColor = colors.foreground.active;
      case _SealOutlineButtonVariant.accent:
        foregroundColor = colors.accent;
      case _SealOutlineButtonVariant.accentSecondary:
        foregroundColor = colors.accentSecondary;
      case _SealOutlineButtonVariant.gradient:
      case _SealOutlineButtonVariant.accentGradient:
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
          borderRadius: SealRadius.borderRadiusSm,
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
        SealBouncingDots(color: foreground, height: lineHeight),
      ],
    );
  }
}

/// Redirecting factory for [SealOutlineButton.primary].
class _PrimarySealOutlineButton extends SealOutlineButton {
  const _PrimarySealOutlineButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
  }) : super._(variant: _SealOutlineButtonVariant.primary);
}

/// Redirecting factory for [SealOutlineButton.accent].
class _AccentSealOutlineButton extends SealOutlineButton {
  const _AccentSealOutlineButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
  }) : super._(variant: _SealOutlineButtonVariant.accent);
}

/// Redirecting factory for [SealOutlineButton.accentSecondary].
class _AccentSecondarySealOutlineButton extends SealOutlineButton {
  const _AccentSecondarySealOutlineButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
  }) : super._(variant: _SealOutlineButtonVariant.accentSecondary);
}

/// Redirecting factory for [SealOutlineButton.gradient].
class _GradientSealOutlineButton extends SealOutlineButton {
  const _GradientSealOutlineButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
  }) : super._(variant: _SealOutlineButtonVariant.gradient);
}

/// Redirecting factory for [SealOutlineButton.accentGradient].
class _AccentGradientSealOutlineButton extends SealOutlineButton {
  const _AccentGradientSealOutlineButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
  }) : super._(variant: _SealOutlineButtonVariant.accentGradient);
}
