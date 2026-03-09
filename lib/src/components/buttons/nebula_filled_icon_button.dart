import 'package:flutter/material.dart';

import '../../theme/nebula_theme.dart';
import '../../theme/nebula_theme_tokens.dart';
import '../../tokens/base/nebula_dimension.dart';
import '../../tokens/base/nebula_radius.dart';

/// The visual variant of a [NebulaFilledIconButton].
enum _NebulaFilledIconButtonVariant {
  primary,
  accent,
  accentSecondary,
  gradient,
  accentGradient,
}

/// A compact icon-only button with a filled background, styled with Nebula UI tokens.
///
/// Designed for prominent actions in toolbars, app bars, and FAB-like contexts.
/// Use [tooltip] to maintain accessibility for icon-only controls.
///
/// Use the named constructors to choose a variant:
///
/// - [NebulaFilledIconButton.primary] — primary brand color fill.
/// - [NebulaFilledIconButton.accent] — accent color fill.
/// - [NebulaFilledIconButton.accentSecondary] — secondary accent color fill.
/// - [NebulaFilledIconButton.gradient] — primary gradient background.
/// - [NebulaFilledIconButton.accentGradient] — accent gradient background.
///
/// ```dart
/// NebulaFilledIconButton.primary(
///   icon: Icons.add,
///   onPressed: () {},
///   tooltip: 'Add item',
/// )
///
/// NebulaFilledIconButton.gradient(
///   icon: Icons.rocket_launch_rounded,
///   onPressed: () {},
///   tooltip: 'Launch',
/// )
/// ```
class NebulaFilledIconButton extends StatelessWidget {
  /// Default icon size for filled icon buttons.
  static const double _kIconSize = 20.0;

  /// Opacity applied to the button when disabled.
  static const double _kDisabledOpacity = 0.4;

  /// Border radius applied to all filled icon button variants.
  static const BorderRadius _kBorderRadius = NebulaRadius.borderRadiusFull;

  const NebulaFilledIconButton._({
    super.key,
    required this.icon,
    required _NebulaFilledIconButtonVariant variant,
    this.onPressed,
    this.tooltip,
    this.iconSize = _kIconSize,
  }) : _variant = variant;

  /// Creates a filled icon button with the **primary** brand color.
  const factory NebulaFilledIconButton.primary({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _PrimaryNebulaFilledIconButton;

  /// Creates a filled icon button with the **accent** color.
  const factory NebulaFilledIconButton.accent({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _AccentNebulaFilledIconButton;

  /// Creates a filled icon button with the **secondary accent** color.
  const factory NebulaFilledIconButton.accentSecondary({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _AccentSecondaryNebulaFilledIconButton;

  /// Creates a filled icon button with the **primary gradient** background.
  const factory NebulaFilledIconButton.gradient({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _GradientNebulaFilledIconButton;

  /// Creates a filled icon button with the **accent gradient** background.
  const factory NebulaFilledIconButton.accentGradient({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _AccentGradientNebulaFilledIconButton;

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
  /// via [NebulaDimension.scaled] to match the active breakpoint.
  final double iconSize;

  final _NebulaFilledIconButtonVariant _variant;

  bool get _isDisabled => onPressed == null;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final dimension = context.dimension;
    final iconSize = dimension.scaled(this.iconSize);

    if (_variant == _NebulaFilledIconButtonVariant.gradient) {
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

    if (_variant == _NebulaFilledIconButtonVariant.accentGradient) {
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
      case _NebulaFilledIconButtonVariant.primary:
        backgroundColor = colors.fill.active;
        foregroundColor = colors.onPrimary;
      case _NebulaFilledIconButtonVariant.accent:
        backgroundColor = colors.accent;
        foregroundColor = colors.onAccent;
      case _NebulaFilledIconButtonVariant.accentSecondary:
        backgroundColor = colors.accentSecondary;
        foregroundColor = colors.onAccent;
      case _NebulaFilledIconButtonVariant.gradient:
      case _NebulaFilledIconButtonVariant.accentGradient:
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

  final NebulaThemeTokens tokens;
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
      opacity: isDisabled ? NebulaFilledIconButton._kDisabledOpacity : 1.0,
      duration: const Duration(milliseconds: 200),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: NebulaFilledIconButton._kBorderRadius,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: NebulaFilledIconButton._kBorderRadius,
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

/// Redirecting factory for [NebulaFilledIconButton.primary].
class _PrimaryNebulaFilledIconButton extends NebulaFilledIconButton {
  const _PrimaryNebulaFilledIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _NebulaFilledIconButtonVariant.primary);
}

/// Redirecting factory for [NebulaFilledIconButton.accent].
class _AccentNebulaFilledIconButton extends NebulaFilledIconButton {
  const _AccentNebulaFilledIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _NebulaFilledIconButtonVariant.accent);
}

/// Redirecting factory for [NebulaFilledIconButton.accentSecondary].
class _AccentSecondaryNebulaFilledIconButton extends NebulaFilledIconButton {
  const _AccentSecondaryNebulaFilledIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _NebulaFilledIconButtonVariant.accentSecondary);
}

/// Redirecting factory for [NebulaFilledIconButton.gradient].
class _GradientNebulaFilledIconButton extends NebulaFilledIconButton {
  const _GradientNebulaFilledIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _NebulaFilledIconButtonVariant.gradient);
}

/// Redirecting factory for [NebulaFilledIconButton.accentGradient].
class _AccentGradientNebulaFilledIconButton extends NebulaFilledIconButton {
  const _AccentGradientNebulaFilledIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _NebulaFilledIconButtonVariant.accentGradient);
}
