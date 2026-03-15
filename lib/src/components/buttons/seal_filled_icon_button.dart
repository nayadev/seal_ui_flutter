import 'package:flutter/material.dart';

import '../../theme/seal_theme.dart';
import '../../theme/seal_theme_tokens.dart';
import '../../tokens/base/seal_dimension.dart';
import '../../tokens/base/seal_radius.dart';

/// The visual variant of a [SealFilledIconButton].
enum _SealFilledIconButtonVariant {
  primary,
  accent,
  accentSecondary,
  gradient,
  accentGradient,
}

/// A compact icon-only button with a filled background, styled with Seal UI tokens.
///
/// Designed for prominent actions in toolbars, app bars, and FAB-like contexts.
/// Use [tooltip] to maintain accessibility for icon-only controls.
///
/// Use the named constructors to choose a variant:
///
/// - [SealFilledIconButton.primary] — primary brand color fill.
/// - [SealFilledIconButton.accent] — accent color fill.
/// - [SealFilledIconButton.accentSecondary] — secondary accent color fill.
/// - [SealFilledIconButton.gradient] — primary gradient background.
/// - [SealFilledIconButton.accentGradient] — accent gradient background.
///
/// ```dart
/// SealFilledIconButton.primary(
///   icon: Icons.add,
///   onPressed: () {},
///   tooltip: 'Add item',
/// )
///
/// SealFilledIconButton.gradient(
///   icon: Icons.rocket_launch_rounded,
///   onPressed: () {},
///   tooltip: 'Launch',
/// )
/// ```
class SealFilledIconButton extends StatelessWidget {
  /// Default icon size for filled icon buttons.
  static const double _kIconSize = 20.0;

  /// Opacity applied to the button when disabled.
  static const double _kDisabledOpacity = 0.4;

  /// Border radius applied to all filled icon button variants.
  static const BorderRadius _kBorderRadius = SealRadius.borderRadiusFull;

  const SealFilledIconButton._({
    super.key,
    required this.icon,
    required _SealFilledIconButtonVariant variant,
    this.onPressed,
    this.tooltip,
    this.iconSize = _kIconSize,
  }) : _variant = variant;

  /// Creates a filled icon button with the **primary** brand color.
  const factory SealFilledIconButton.primary({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _PrimarySealFilledIconButton;

  /// Creates a filled icon button with the **accent** color.
  const factory SealFilledIconButton.accent({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _AccentSealFilledIconButton;

  /// Creates a filled icon button with the **secondary accent** color.
  const factory SealFilledIconButton.accentSecondary({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _AccentSecondarySealFilledIconButton;

  /// Creates a filled icon button with the **primary gradient** background.
  const factory SealFilledIconButton.gradient({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _GradientSealFilledIconButton;

  /// Creates a filled icon button with the **accent gradient** background.
  const factory SealFilledIconButton.accentGradient({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _AccentGradientSealFilledIconButton;

  /// The icon to display inside the button.
  final IconData icon;

  /// Callback invoked when the button is tapped. Pass `null` to disable.
  final VoidCallback? onPressed;

  /// Optional label for accessibility and hover tooltips.
  ///
  /// Strongly recommended for icon-only buttons to ensure screen-reader support.
  final String? tooltip;

  /// The size of the icon in logical pixels before responsive scaling.
  ///
  /// Defaults to [_kIconSize] (20.0). The value is scaled proportionally
  /// via [SealDimension.scaled] to match the active breakpoint.
  final double iconSize;

  final _SealFilledIconButtonVariant _variant;

  bool get _isDisabled => onPressed == null;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final dimension = context.dimension;
    final iconSize = dimension.scaled(this.iconSize);

    if (_variant == _SealFilledIconButtonVariant.gradient) {
      return _GradientFilledIconButtonShell(
        tokens: tokens,
        gradient: tokens.gradients.primaryGradient,
        foregroundColor: colors.onPrimary,
        isDisabled: _isDisabled,
        onPressed: onPressed,
        icon: icon,
        iconSize: iconSize,
        tooltip: tooltip,
      );
    }

    if (_variant == _SealFilledIconButtonVariant.accentGradient) {
      return _GradientFilledIconButtonShell(
        tokens: tokens,
        gradient: tokens.gradients.accentGradient,
        foregroundColor: colors.onAccent,
        isDisabled: _isDisabled,
        onPressed: onPressed,
        icon: icon,
        iconSize: iconSize,
        tooltip: tooltip,
      );
    }

    final Color backgroundColor;
    final Color foregroundColor;

    switch (_variant) {
      case _SealFilledIconButtonVariant.primary:
        backgroundColor = colors.fill.active;
        foregroundColor = colors.onPrimary;
      case _SealFilledIconButtonVariant.accent:
        backgroundColor = colors.accent;
        foregroundColor = colors.onAccent;
      case _SealFilledIconButtonVariant.accentSecondary:
        backgroundColor = colors.accentSecondary;
        foregroundColor = colors.onAccent;
      case _SealFilledIconButtonVariant.gradient:
      case _SealFilledIconButtonVariant.accentGradient:
        backgroundColor = colors.fill.active;
        foregroundColor = colors.onPrimary;
    }

    return IconButton(
      icon: Icon(icon, size: iconSize),
      onPressed: _isDisabled ? null : onPressed,
      tooltip: tooltip,
      style: IconButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        disabledBackgroundColor: backgroundColor.withValues(
          alpha: _kDisabledOpacity,
        ),
        disabledForegroundColor: foregroundColor.withValues(
          alpha: _kDisabledOpacity,
        ),
        padding: EdgeInsets.all(dimension.sm),
        shape: RoundedRectangleBorder(borderRadius: _kBorderRadius),
      ),
    );
  }
}

/// Internal widget that renders the gradient filled icon button shell.
class _GradientFilledIconButtonShell extends StatelessWidget {
  const _GradientFilledIconButtonShell({
    required this.tokens,
    required this.gradient,
    required this.foregroundColor,
    required this.isDisabled,
    required this.onPressed,
    required this.icon,
    required this.iconSize,
    this.tooltip,
  });

  final SealThemeTokens tokens;
  final LinearGradient gradient;
  final Color foregroundColor;
  final bool isDisabled;
  final VoidCallback? onPressed;
  final IconData icon;
  final double iconSize;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final dimension = context.dimension;

    Widget shell = AnimatedOpacity(
      opacity: isDisabled ? SealFilledIconButton._kDisabledOpacity : 1.0,
      duration: const Duration(milliseconds: 200),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: SealFilledIconButton._kBorderRadius,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: SealFilledIconButton._kBorderRadius,
            onTap: isDisabled ? null : onPressed,
            child: Padding(
              padding: EdgeInsets.all(dimension.sm),
              child: Icon(icon, size: iconSize, color: foregroundColor),
            ),
          ),
        ),
      ),
    );

    if (tooltip == null) return shell;

    return Tooltip(message: tooltip!, child: shell);
  }
}

/// Redirecting factory for [SealFilledIconButton.primary].
class _PrimarySealFilledIconButton extends SealFilledIconButton {
  const _PrimarySealFilledIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _SealFilledIconButtonVariant.primary);
}

/// Redirecting factory for [SealFilledIconButton.accent].
class _AccentSealFilledIconButton extends SealFilledIconButton {
  const _AccentSealFilledIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _SealFilledIconButtonVariant.accent);
}

/// Redirecting factory for [SealFilledIconButton.accentSecondary].
class _AccentSecondarySealFilledIconButton extends SealFilledIconButton {
  const _AccentSecondarySealFilledIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _SealFilledIconButtonVariant.accentSecondary);
}

/// Redirecting factory for [SealFilledIconButton.gradient].
class _GradientSealFilledIconButton extends SealFilledIconButton {
  const _GradientSealFilledIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _SealFilledIconButtonVariant.gradient);
}

/// Redirecting factory for [SealFilledIconButton.accentGradient].
class _AccentGradientSealFilledIconButton extends SealFilledIconButton {
  const _AccentGradientSealFilledIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _SealFilledIconButtonVariant.accentGradient);
}
