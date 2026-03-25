import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/abstractions/typography_tokens.dart';
import '../../tokens/base/seal_colors.dart';
import '../../tokens/base/seal_dimension.dart';
import '../feedback/seal_bouncing_dots.dart';

/// The visual variant of a [SealOutlineButton].
enum _SealOutlineButtonVariant {
  primary,
  accent,
  accentSecondary,
  gradient,
  accentGradient,
  custom,
}

/// An outlined action button styled with Seal UI tokens, built on [ShadButton].
///
/// Use the named constructors to choose a variant:
///
/// - [SealOutlineButton.primary] — primary brand color border.
/// - [SealOutlineButton.accent] — accent color border.
/// - [SealOutlineButton.accentSecondary] — secondary accent color border.
/// - [SealOutlineButton.gradient] — primary gradient border and text.
/// - [SealOutlineButton.accentGradient] — accent gradient border and text.
/// - [SealOutlineButton.custom] — arbitrary color or gradient.
///
/// ```dart
/// SealOutlineButton.primary(
///   label: Text('Cancel'),
///   onPressed: () {},
/// )
///
/// SealOutlineButton.gradient(
///   label: Text('Explore'),
///   onPressed: () {},
/// )
///
/// SealOutlineButton.custom(
///   label: Text('Retry'),
///   color: Colors.red,
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
    Color? color,
    LinearGradient? gradient,
  }) : _variant = variant,
       _color = color,
       _gradient = gradient;

  /// Creates an outlined button with the **primary** brand color.
  const factory SealOutlineButton.primary({
    Key? key,
    required Widget label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _PrimarySealOutlineButton;

  /// Creates an outlined button with the **accent** color.
  const factory SealOutlineButton.accent({
    Key? key,
    required Widget label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _AccentSealOutlineButton;

  /// Creates an outlined button with the **secondary accent** color.
  const factory SealOutlineButton.accentSecondary({
    Key? key,
    required Widget label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _AccentSecondarySealOutlineButton;

  /// Creates an outlined button with the **primary gradient** border and text.
  const factory SealOutlineButton.gradient({
    Key? key,
    required Widget label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _GradientSealOutlineButton;

  /// Creates an outlined button with the **accent gradient** border and text.
  const factory SealOutlineButton.accentGradient({
    Key? key,
    required Widget label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _AccentGradientSealOutlineButton;

  /// Creates an outlined button with an arbitrary [color] or [gradient].
  ///
  /// Exactly one of [color] or [gradient] must be provided.
  const factory SealOutlineButton.custom({
    Key? key,
    required Widget label,
    Color? color,
    LinearGradient? gradient,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _CustomSealOutlineButton;

  /// Button label widget.
  final Widget label;

  /// Callback when the button is tapped. If `null` the button is disabled.
  final VoidCallback? onPressed;

  /// Shows a loading indicator and disables interaction.
  final bool isLoading;

  /// Optional leading icon.
  final IconData? icon;

  final _SealOutlineButtonVariant _variant;
  final Color? _color;
  final LinearGradient? _gradient;

  bool get _isDisabled => onPressed == null || isLoading;

  /// Opacity applied to foreground when disabled.
  static const double _kDisabledOpacity = 0.4;

  /// Opacity applied to the border color, matching shadcn's subtle border style.
  static const double _kBorderOpacity = 0.5;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;

    final bool isGradient =
        _variant == _SealOutlineButtonVariant.gradient ||
        _variant == _SealOutlineButtonVariant.accentGradient ||
        (_variant == _SealOutlineButtonVariant.custom && _gradient != null);

    if (isGradient) {
      final gradient = _variant == _SealOutlineButtonVariant.gradient
          ? tokens.gradients.primaryGradient
          : _variant == _SealOutlineButtonVariant.accentGradient
          ? tokens.gradients.accentGradient
          : _gradient!;

      // Use white as the base color; ShaderMask replaces it with the gradient.
      const baseColor = ColorX.white;

      Widget button = ShadButton.raw(
        variant: ShadButtonVariant.outline,
        onPressed: _isDisabled ? null : onPressed,
        enabled: !_isDisabled,
        foregroundColor: baseColor,
        hoverForegroundColor: baseColor,
        pressedForegroundColor: baseColor,
        backgroundColor: ColorX.transparent,
        hoverBackgroundColor: ColorX.white.withValues(alpha: 0.08),
        // ShaderMask applies the gradient over white, so the border must also
        // be white so the gradient covers it uniformly.
        decoration: ShadDecoration(
          border: ShadBorder.all(color: baseColor.withValues(alpha: _kBorderOpacity)),
          focusedBorder: ShadBorder.all(color: baseColor.withValues(alpha: _kBorderOpacity)),
        ),
        leading: (!isLoading && icon != null)
            ? Icon(
                icon,
                size: context.dimension.scaled(
                  TypographyTokens.kDefaultButtonIconSize,
                ),
              )
            : null,
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
      case _SealOutlineButtonVariant.custom:
        foregroundColor = _color!;
    }

    return ShadButton.raw(
      variant: ShadButtonVariant.outline,
      onPressed: _isDisabled ? null : onPressed,
      enabled: !_isDisabled,
      foregroundColor: foregroundColor,
      hoverForegroundColor: foregroundColor,
      pressedForegroundColor: foregroundColor,
      backgroundColor: ColorX.transparent,
      hoverBackgroundColor: foregroundColor.withValues(alpha: 0.08),
      decoration: ShadDecoration(
        border: ShadBorder.all(color: foregroundColor.withValues(alpha: _kBorderOpacity)),
        focusedBorder: ShadBorder.all(color: foregroundColor.withValues(alpha: _kBorderOpacity)),
      ),
      leading: (!isLoading && icon != null)
          ? Icon(
              icon,
              size: context.dimension.scaled(
                TypographyTokens.kDefaultButtonIconSize,
              ),
            )
          : null,
      child: _buildContent(context, foregroundColor, typo),
    );
  }

  Widget _buildContent(
    BuildContext context,
    Color foreground,
    TypographyTokens typography,
  ) {
    if (!isLoading) return label;

    final style = typography.small;
    final lineHeight =
        (style.fontSize ?? TypographyTokens.kSmallFontSize) *
        (style.height ?? TypographyTokens.kDefaultLineHeightMultiplier);
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: false,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: label,
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

/// Redirecting factory for [SealOutlineButton.custom].
class _CustomSealOutlineButton extends SealOutlineButton {
  const _CustomSealOutlineButton({
    super.key,
    required super.label,
    super.color,
    super.gradient,
    super.onPressed,
    super.isLoading,
    super.icon,
  }) : assert(
         color != null || gradient != null,
         'SealOutlineButton.custom requires either color or gradient.',
       ),
       super._(variant: _SealOutlineButtonVariant.custom);
}
