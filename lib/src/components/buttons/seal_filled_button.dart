import 'package:flutter/material.dart';

import '../../theme/seal_theme.dart';
import '../../theme/seal_theme_tokens.dart';
import '../../tokens/abstractions/typography_tokens.dart';
import '../../tokens/base/seal_dimension.dart';
import '../../tokens/base/seal_radius.dart';
import '../feedback/seal_bouncing_dots.dart';

/// The visual variant of a [SealFilledButton].
enum _SealFilledButtonVariant {
  primary,
  accent,
  accentSecondary,
  gradient,
  accentGradient,
}

/// A filled action button styled with Seal UI tokens.
///
/// Use the named constructors to choose a variant:
///
/// - [SealFilledButton.primary] — primary brand color fill.
/// - [SealFilledButton.accent] — accent color fill.
/// - [SealFilledButton.accentSecondary] — secondary accent color fill.
/// - [SealFilledButton.gradient] — primary gradient background.
/// - [SealFilledButton.accentGradient] — accent gradient background.
///
/// ```dart
/// SealFilledButton.primary(
///   label: 'Get Started',
///   onPressed: () {},
/// )
///
/// SealFilledButton.accent(
///   label: 'Continue',
///   onPressed: () {},
/// )
///
/// SealFilledButton.accentSecondary(
///   label: 'Confirm',
///   onPressed: () {},
/// )
///
/// SealFilledButton.gradient(
///   label: 'Launch',
///   onPressed: () {},
/// )
///
/// SealFilledButton.accentGradient(
///   label: 'Explore',
///   onPressed: () {},
/// )
/// ```
class SealFilledButton extends StatelessWidget {
  /// Opacity applied to foreground text when the button is disabled.
  static const double _kDisabledTextOpacity = 0.4;

  /// Opacity applied to the gradient button shell when disabled.
  static const double _kDisabledButtonOpacity = 0.45;

  const SealFilledButton._({
    super.key,
    required this.label,
    required _SealFilledButtonVariant variant,
    this.onPressed,
    this.isLoading = false,
    this.icon,
  }) : _variant = variant;

  /// Creates a filled button with the **primary** brand color.
  const factory SealFilledButton.primary({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _PrimarySealFilledButton;

  /// Creates a filled button with the **accent** color.
  const factory SealFilledButton.accent({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _AccentSealFilledButton;

  /// Creates a filled button with the **secondary accent** color.
  const factory SealFilledButton.accentSecondary({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _AccentSecondarySealFilledButton;

  /// Creates a filled button with the **primary gradient** background.
  const factory SealFilledButton.gradient({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _GradientSealFilledButton;

  /// Creates a filled button with the **accent gradient** background.
  const factory SealFilledButton.accentGradient({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _AccentGradientSealFilledButton;

  /// Button label text.
  final String label;

  /// Callback when the button is tapped. If `null` the button is disabled.
  final VoidCallback? onPressed;

  /// Shows a loading indicator and disables interaction.
  final bool isLoading;

  /// Optional leading icon.
  final IconData? icon;

  final _SealFilledButtonVariant _variant;

  bool get _isDisabled => onPressed == null || isLoading;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;
    final dimension = context.dimension;

    if (_variant == _SealFilledButtonVariant.gradient) {
      return _GradientButtonShell(
        tokens: tokens,
        gradient: tokens.gradients.primaryGradient,
        foregroundColor: colors.onPrimary,
        isDisabled: _isDisabled,
        onPressed: onPressed,
        child: _buildContent(context, colors.onPrimary, typo),
      );
    }

    if (_variant == _SealFilledButtonVariant.accentGradient) {
      return _GradientButtonShell(
        tokens: tokens,
        gradient: tokens.gradients.accentGradient,
        foregroundColor: colors.onAccent,
        isDisabled: _isDisabled,
        onPressed: onPressed,
        child: _buildContent(context, colors.onAccent, typo),
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
    }

    return FilledButton(
      onPressed: _isDisabled ? null : onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        disabledBackgroundColor: backgroundColor.withValues(
          alpha: _kDisabledButtonOpacity,
        ),
        disabledForegroundColor: foregroundColor.withValues(
          alpha: _kDisabledTextOpacity,
        ),
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

  Widget _buildContent(
    BuildContext context,
    Color textColor,
    TypographyTokens typography,
  ) {
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

/// Internal widget that renders the gradient button shell.
class _GradientButtonShell extends StatelessWidget {
  const _GradientButtonShell({
    required this.tokens,
    required this.gradient,
    required this.foregroundColor,
    required this.isDisabled,
    required this.onPressed,
    required this.child,
  });

  final SealThemeTokens tokens;
  final LinearGradient gradient;
  final Color foregroundColor;
  final bool isDisabled;
  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isDisabled ? SealFilledButton._kDisabledButtonOpacity : 1.0,
      duration: const Duration(milliseconds: 200),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: SealRadius.borderRadiusSm,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: SealRadius.borderRadiusSm,
            onTap: isDisabled ? null : onPressed,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.dimension.lg,
                vertical: context.dimension.md,
              ),
              child: DefaultTextStyle.merge(
                style: tokens.typography.body.copyWith(
                  color: foregroundColor,
                  fontWeight: FontWeight.w600,
                ),
                child: IconTheme.merge(
                  data: IconThemeData(color: foregroundColor),
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
