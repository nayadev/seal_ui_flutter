import 'package:flutter/material.dart';

import '../../theme/nebula_theme.dart';
import '../../theme/nebula_theme_tokens.dart';
import '../../tokens/abstractions/typography_tokens.dart';
import '../../tokens/base/nebula_dimension.dart';
import '../../tokens/base/nebula_radius.dart';
import '../feedback/nebula_bouncing_dots.dart';

/// The visual variant of a [NebulaFilledButton].
enum _NebulaFilledButtonVariant {
  primary,
  accent,
  accentSecondary,
  gradient,
  accentGradient,
}

/// A filled action button styled with Nebula UI tokens.
///
/// Use the named constructors to choose a variant:
///
/// - [NebulaFilledButton.primary] — primary brand color fill.
/// - [NebulaFilledButton.accent] — accent color fill.
/// - [NebulaFilledButton.accentSecondary] — secondary accent color fill.
/// - [NebulaFilledButton.gradient] — primary gradient background.
/// - [NebulaFilledButton.accentGradient] — accent gradient background.
///
/// ```dart
/// NebulaFilledButton.primary(
///   label: 'Get Started',
///   onPressed: () {},
/// )
///
/// NebulaFilledButton.accent(
///   label: 'Continue',
///   onPressed: () {},
/// )
///
/// NebulaFilledButton.accentSecondary(
///   label: 'Confirm',
///   onPressed: () {},
/// )
///
/// NebulaFilledButton.gradient(
///   label: 'Launch',
///   onPressed: () {},
/// )
///
/// NebulaFilledButton.accentGradient(
///   label: 'Explore',
///   onPressed: () {},
/// )
/// ```
class NebulaFilledButton extends StatelessWidget {
  /// Opacity applied to foreground text when the button is disabled.
  static const double _kDisabledTextOpacity = 0.4;

  /// Opacity applied to the gradient button shell when disabled.
  static const double _kDisabledButtonOpacity = 0.45;

  const NebulaFilledButton._({
    super.key,
    required this.label,
    required _NebulaFilledButtonVariant variant,
    this.onPressed,
    this.isLoading = false,
    this.icon,
  }) : _variant = variant;

  /// Creates a filled button with the **primary** brand color.
  const factory NebulaFilledButton.primary({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _PrimaryNebulaFilledButton;

  /// Creates a filled button with the **accent** color.
  const factory NebulaFilledButton.accent({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _AccentNebulaFilledButton;

  /// Creates a filled button with the **secondary accent** color.
  const factory NebulaFilledButton.accentSecondary({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _AccentSecondaryNebulaFilledButton;

  /// Creates a filled button with the **primary gradient** background.
  const factory NebulaFilledButton.gradient({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _GradientNebulaFilledButton;

  /// Creates a filled button with the **accent gradient** background.
  const factory NebulaFilledButton.accentGradient({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading,
    IconData? icon,
  }) = _AccentGradientNebulaFilledButton;

  /// Button label text.
  final String label;

  /// Callback when the button is tapped. If `null` the button is disabled.
  final VoidCallback? onPressed;

  /// Shows a loading indicator and disables interaction.
  final bool isLoading;

  /// Optional leading icon.
  final IconData? icon;

  final _NebulaFilledButtonVariant _variant;

  bool get _isDisabled => onPressed == null || isLoading;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;
    final dimension = context.dimension;

    if (_variant == _NebulaFilledButtonVariant.gradient) {
      return _GradientButtonShell(
        tokens: tokens,
        gradient: tokens.gradients.primaryGradient,
        foregroundColor: colors.onPrimary,
        isDisabled: _isDisabled,
        onPressed: onPressed,
        child: _buildContent(context, colors.onPrimary, typo),
      );
    }

    if (_variant == _NebulaFilledButtonVariant.accentGradient) {
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
      case _NebulaFilledButtonVariant.primary:
        backgroundColor = colors.fill.active;
        foregroundColor = colors.onPrimary;
      case _NebulaFilledButtonVariant.accent:
        backgroundColor = colors.accent;
        foregroundColor = colors.onAccent;
      case _NebulaFilledButtonVariant.accentSecondary:
        backgroundColor = colors.accentSecondary;
        foregroundColor = colors.onAccent;
      case _NebulaFilledButtonVariant.gradient:
      case _NebulaFilledButtonVariant.accentGradient:
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
          borderRadius: NebulaRadius.borderRadiusSm,
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
        NebulaBouncingDots(color: textColor, height: lineHeight),
      ],
    );
  }
}

/// Redirecting factory for [NebulaFilledButton.primary].
class _PrimaryNebulaFilledButton extends NebulaFilledButton {
  const _PrimaryNebulaFilledButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
  }) : super._(variant: _NebulaFilledButtonVariant.primary);
}

/// Redirecting factory for [NebulaFilledButton.accent].
class _AccentNebulaFilledButton extends NebulaFilledButton {
  const _AccentNebulaFilledButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
  }) : super._(variant: _NebulaFilledButtonVariant.accent);
}

/// Redirecting factory for [NebulaFilledButton.accentSecondary].
class _AccentSecondaryNebulaFilledButton extends NebulaFilledButton {
  const _AccentSecondaryNebulaFilledButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
  }) : super._(variant: _NebulaFilledButtonVariant.accentSecondary);
}

/// Redirecting factory for [NebulaFilledButton.gradient].
class _GradientNebulaFilledButton extends NebulaFilledButton {
  const _GradientNebulaFilledButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
  }) : super._(variant: _NebulaFilledButtonVariant.gradient);
}

/// Redirecting factory for [NebulaFilledButton.accentGradient].
class _AccentGradientNebulaFilledButton extends NebulaFilledButton {
  const _AccentGradientNebulaFilledButton({
    super.key,
    required super.label,
    super.onPressed,
    super.isLoading,
    super.icon,
  }) : super._(variant: _NebulaFilledButtonVariant.accentGradient);
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

  final NebulaThemeTokens tokens;
  final LinearGradient gradient;
  final Color foregroundColor;
  final bool isDisabled;
  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isDisabled ? NebulaFilledButton._kDisabledButtonOpacity : 1.0,
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
