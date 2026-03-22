import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/abstractions/typography_tokens.dart';
import '../../tokens/base/seal_colors.dart';
import '../../tokens/base/seal_dimension.dart';
import '../feedback/seal_bouncing_dots.dart';

/// The visual variant of a [SealTextButton].
enum _SealTextButtonVariant {
  primary,
  accent,
  accentSecondary,
  gradient,
  accentGradient,
  custom,
}

/// A borderless, background-less button styled with Seal UI tokens, built on
/// [ShadButton] with the ghost variant.
///
/// Use the named constructors to choose a variant:
///
/// - [SealTextButton.primary] — primary brand color text.
/// - [SealTextButton.accent] — accent color text.
/// - [SealTextButton.accentSecondary] — secondary accent color text.
/// - [SealTextButton.gradient] — primary gradient text and underline.
/// - [SealTextButton.accentGradient] — accent gradient text and underline.
/// - [SealTextButton.custom] — arbitrary color or gradient.
///
/// ```dart
/// SealTextButton.primary(
///   label: Text('Learn more'),
///   onPressed: () {},
/// )
///
/// SealTextButton.gradient(
///   label: Text('Discover'),
///   onPressed: () {},
/// )
///
/// SealTextButton.custom(
///   label: Text('Retry'),
///   color: ColorX.red,
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
    Color? color,
    LinearGradient? gradient,
  }) : _variant = variant,
       _color = color,
       _gradient = gradient;

  /// Creates a text button with the **primary** brand color.
  const factory SealTextButton.primary({
    Key? key,
    required Widget label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
    double iconSize,
  }) = _PrimarySealTextButton;

  /// Creates a text button with the **accent** color.
  const factory SealTextButton.accent({
    Key? key,
    required Widget label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
    double iconSize,
  }) = _AccentSealTextButton;

  /// Creates a text button with the **secondary accent** color.
  const factory SealTextButton.accentSecondary({
    Key? key,
    required Widget label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
    double iconSize,
  }) = _AccentSecondarySealTextButton;

  /// Creates a text button with the **primary gradient** text and underline.
  const factory SealTextButton.gradient({
    Key? key,
    required Widget label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
    double iconSize,
  }) = _GradientSealTextButton;

  /// Creates a text button with the **accent gradient** text and underline.
  const factory SealTextButton.accentGradient({
    Key? key,
    required Widget label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
    double iconSize,
  }) = _AccentGradientSealTextButton;

  /// Creates a text button with an arbitrary [color] or [gradient].
  ///
  /// Exactly one of [color] or [gradient] must be provided.
  const factory SealTextButton.custom({
    Key? key,
    required Widget label,
    Color? color,
    LinearGradient? gradient,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
    double iconSize,
  }) = _CustomSealTextButton;

  /// Button label widget.
  final Widget label;

  /// Callback when the button is tapped. If `null` the button is disabled.
  final VoidCallback? onPressed;

  /// Shows a loading indicator and disables interaction.
  final bool isLoading;

  /// Optional leading icon.
  final IconData? icon;

  /// Size of the optional leading icon.
  final double iconSize;

  final _SealTextButtonVariant _variant;
  final Color? _color;
  final LinearGradient? _gradient;

  bool get _isDisabled => onPressed == null || isLoading;

  /// Opacity applied to foreground when disabled.
  static const double _kDisabledOpacity = 0.4;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;

    final bool isGradient =
        _variant == _SealTextButtonVariant.gradient ||
        _variant == _SealTextButtonVariant.accentGradient ||
        (_variant == _SealTextButtonVariant.custom && _gradient != null);

    if (isGradient) {
      final gradient = _variant == _SealTextButtonVariant.gradient
          ? tokens.gradients.primaryGradient
          : _variant == _SealTextButtonVariant.accentGradient
          ? tokens.gradients.accentGradient
          : _gradient!;

      const baseColor = ColorX.white;

      Widget button = ShadButton.raw(
        variant: ShadButtonVariant.ghost,
        onPressed: _isDisabled ? null : onPressed,
        enabled: !_isDisabled,
        foregroundColor: baseColor,
        hoverForegroundColor: baseColor,
        pressedForegroundColor: baseColor,
        backgroundColor: ColorX.transparent,
        hoverBackgroundColor: ColorX.white.withValues(alpha: 0.08),
        textDecoration: isLoading ? null : TextDecoration.underline,
        leading: (!isLoading && icon != null)
            ? Icon(icon, size: context.dimension.scaled(iconSize))
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
      case _SealTextButtonVariant.primary:
        foregroundColor = colors.foreground.active;
      case _SealTextButtonVariant.accent:
        foregroundColor = colors.accent;
      case _SealTextButtonVariant.accentSecondary:
        foregroundColor = colors.accentSecondary;
      case _SealTextButtonVariant.gradient:
      case _SealTextButtonVariant.accentGradient:
        foregroundColor = colors.foreground.active;
      case _SealTextButtonVariant.custom:
        foregroundColor = _color!;
    }

    return ShadButton.raw(
      variant: ShadButtonVariant.ghost,
      onPressed: _isDisabled ? null : onPressed,
      enabled: !_isDisabled,
      foregroundColor: foregroundColor,
      hoverForegroundColor: foregroundColor,
      pressedForegroundColor: foregroundColor,
      backgroundColor: ColorX.transparent,
      hoverBackgroundColor: foregroundColor.withValues(alpha: 0.08),
      textDecoration: isLoading ? null : TextDecoration.underline,
      leading: (!isLoading && icon != null)
          ? Icon(icon, size: context.dimension.scaled(iconSize))
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
        (style.fontSize ?? 14) *
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

/// Redirecting factory for [SealTextButton.custom].
class _CustomSealTextButton extends SealTextButton {
  const _CustomSealTextButton({
    super.key,
    required super.label,
    super.color,
    super.gradient,
    super.onPressed,
    super.isLoading,
    super.icon,
    super.iconSize,
  }) : assert(
         color != null || gradient != null,
         'SealTextButton.custom requires either color or gradient.',
       ),
       super._(
         variant: _SealTextButtonVariant.custom,
       );
}
