import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme.dart';
import '../../tokens/abstractions/typography_tokens.dart';
import '../../tokens/base/seal_colors.dart';
import '../../tokens/base/seal_dimension.dart';
import '../feedback/seal_bouncing_dots.dart';

/// The visual variant of a [SealFilledButton].
enum _SealFilledButtonVariant {
  primary,
  accent,
  accentSecondary,
  gradient,
  accentGradient,
  custom,
}

/// A filled action button styled with Seal UI tokens, built on [ShadButton].
///
/// Use the named constructors to choose a variant:
///
/// - [SealFilledButton.primary] — primary brand color fill.
/// - [SealFilledButton.accent] — accent color fill.
/// - [SealFilledButton.accentSecondary] — secondary accent color fill.
/// - [SealFilledButton.gradient] — primary gradient background.
/// - [SealFilledButton.accentGradient] — accent gradient background.
/// - [SealFilledButton.custom] — arbitrary color or gradient background.
///
/// ```dart
/// SealFilledButton.primary(
///   label: Text('Get Started'),
///   onPressed: () {},
/// )
///
/// SealFilledButton.gradient(
///   label: Text('Launch'),
///   onPressed: () {},
/// )
///
/// SealFilledButton.custom(
///   label: Text('Confirm'),
///   color: Colors.red,
///   onPressed: () {},
/// )
/// ```
class SealFilledButton extends StatelessWidget {
  /// Opacity applied to gradient variants when disabled.
  static const double _kDisabledButtonOpacity = 0.45;

  const SealFilledButton._({
    super.key,
    required this.label,
    required _SealFilledButtonVariant variant,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    Color? color,
    LinearGradient? gradient,
  }) : _variant = variant,
       _color = color,
       _gradient = gradient;

  /// Creates a filled button with the **primary** brand color.
  const factory SealFilledButton.primary({
    Key? key,
    required Widget label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _PrimarySealFilledButton;

  /// Creates a filled button with the **accent** color.
  const factory SealFilledButton.accent({
    Key? key,
    required Widget label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _AccentSealFilledButton;

  /// Creates a filled button with the **secondary accent** color.
  const factory SealFilledButton.accentSecondary({
    Key? key,
    required Widget label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _AccentSecondarySealFilledButton;

  /// Creates a filled button with the **primary gradient** background.
  const factory SealFilledButton.gradient({
    Key? key,
    required Widget label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _GradientSealFilledButton;

  /// Creates a filled button with the **accent gradient** background.
  const factory SealFilledButton.accentGradient({
    Key? key,
    required Widget label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _AccentGradientSealFilledButton;

  /// Creates a filled button with an arbitrary [color] or [gradient].
  ///
  /// Exactly one of [color] or [gradient] must be provided.
  const factory SealFilledButton.custom({
    Key? key,
    required Widget label,
    Color? color,
    LinearGradient? gradient,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _CustomSealFilledButton;

  /// Button label widget.
  final Widget label;

  /// Callback when the button is tapped. If `null` the button is disabled.
  final VoidCallback? onPressed;

  /// Shows a loading indicator and disables interaction.
  final bool isLoading;

  /// Optional leading icon.
  final IconData? icon;

  final _SealFilledButtonVariant _variant;
  final Color? _color;
  final LinearGradient? _gradient;

  bool get _isDisabled => onPressed == null || isLoading;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;

    final bool isGradient =
        _variant == _SealFilledButtonVariant.gradient ||
        _variant == _SealFilledButtonVariant.accentGradient ||
        (_variant == _SealFilledButtonVariant.custom && _gradient != null);

    if (isGradient) {
      final gradient = _variant == _SealFilledButtonVariant.gradient
          ? tokens.gradients.primaryGradient
          : _variant == _SealFilledButtonVariant.accentGradient
          ? tokens.gradients.accentGradient
          : _gradient!;
      final foregroundColor =
          _variant == _SealFilledButtonVariant.accentGradient
          ? colors.onAccent
          : colors.onPrimary;

      return AnimatedOpacity(
        opacity: _isDisabled ? _kDisabledButtonOpacity : 1.0,
        duration: const Duration(milliseconds: 200),
        child: ShadButton.raw(
          variant: ShadButtonVariant.primary,
          onPressed: _isDisabled ? null : onPressed,
          enabled: !_isDisabled,
          gradient: gradient,
          foregroundColor: foregroundColor,
          hoverForegroundColor: foregroundColor,
          pressedForegroundColor: foregroundColor,
          leading: (!isLoading && icon != null)
              ? Icon(
                  icon,
                  size: context.dimension.scaled(
                    TypographyTokens.kDefaultButtonIconSize,
                  ),
                )
              : null,
          child: _buildContent(context, foregroundColor, typo),
        ),
      );
    }

    final Color backgroundColor;
    final Color foregroundColor;

    switch (_variant) {
      case _SealFilledButtonVariant.primary:
        backgroundColor = colors.fill.active;
        foregroundColor = colors.onPrimary;
      case _SealFilledButtonVariant.accent:
        backgroundColor = colors.accent;
        foregroundColor = colors.onAccent;
      case _SealFilledButtonVariant.accentSecondary:
        backgroundColor = colors.accentSecondary;
        foregroundColor = colors.onAccent;
      case _SealFilledButtonVariant.gradient:
      case _SealFilledButtonVariant.accentGradient:
        backgroundColor = colors.fill.active;
        foregroundColor = colors.onPrimary;
      case _SealFilledButtonVariant.custom:
        backgroundColor = _color!;
        foregroundColor = ColorX.white;
    }

    return ShadButton.raw(
      variant: ShadButtonVariant.primary,
      onPressed: _isDisabled ? null : onPressed,
      enabled: !_isDisabled,
      backgroundColor: backgroundColor,
      hoverBackgroundColor: backgroundColor.withValues(alpha: 0.85),
      pressedBackgroundColor: backgroundColor.withValues(alpha: 0.75),
      foregroundColor: foregroundColor,
      hoverForegroundColor: foregroundColor,
      pressedForegroundColor: foregroundColor,
      // Hide the leading icon while loading so the bouncing dots fill the slot.
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
    Color textColor,
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
        SealBouncingDots(color: textColor, height: lineHeight),
      ],
    );
  }
}

/// Redirecting factory for [SealFilledButton.primary].
class _PrimarySealFilledButton extends SealFilledButton {
  const _PrimarySealFilledButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
  }) : super._(variant: _SealFilledButtonVariant.primary);
}

/// Redirecting factory for [SealFilledButton.accent].
class _AccentSealFilledButton extends SealFilledButton {
  const _AccentSealFilledButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
  }) : super._(variant: _SealFilledButtonVariant.accent);
}

/// Redirecting factory for [SealFilledButton.accentSecondary].
class _AccentSecondarySealFilledButton extends SealFilledButton {
  const _AccentSecondarySealFilledButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
  }) : super._(variant: _SealFilledButtonVariant.accentSecondary);
}

/// Redirecting factory for [SealFilledButton.gradient].
class _GradientSealFilledButton extends SealFilledButton {
  const _GradientSealFilledButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
  }) : super._(variant: _SealFilledButtonVariant.gradient);
}

/// Redirecting factory for [SealFilledButton.accentGradient].
class _AccentGradientSealFilledButton extends SealFilledButton {
  const _AccentGradientSealFilledButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
  }) : super._(variant: _SealFilledButtonVariant.accentGradient);
}

/// Redirecting factory for [SealFilledButton.custom].
class _CustomSealFilledButton extends SealFilledButton {
  const _CustomSealFilledButton({
    super.key,
    required super.label,
    super.color,
    super.gradient,
    super.onPressed,
    super.isLoading,
    super.icon,
  }) : assert(
         color != null || gradient != null,
         'SealFilledButton.custom requires either color or gradient.',
       ),
       super._(variant: _SealFilledButtonVariant.custom);
}
