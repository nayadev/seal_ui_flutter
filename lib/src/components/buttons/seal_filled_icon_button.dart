import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme.dart';
import '../../tokens/base/seal_dimension.dart';
import '../../tokens/base/seal_radius.dart';

/// The visual variant of a [SealFilledIconButton].
enum _SealFilledIconButtonVariant {
  primary,
  accent,
  accentSecondary,
  gradient,
  accentGradient,
  custom,
}

/// A compact icon-only button with a filled background, styled with Seal UI
/// tokens and built on [ShadIconButton].
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
/// - [SealFilledIconButton.custom] — arbitrary color or gradient background.
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
///
/// SealFilledIconButton.custom(
///   icon: Icons.delete_rounded,
///   color: Colors.red,
///   onPressed: () {},
///   tooltip: 'Delete',
/// )
/// ```
class SealFilledIconButton extends StatelessWidget {
  /// Default icon size for filled icon buttons.
  static const double _kIconSize = 20.0;

  /// Opacity applied to gradient variants when disabled.
  static const double _kDisabledOpacity = 0.4;

  const SealFilledIconButton._({
    super.key,
    required this.icon,
    required _SealFilledIconButtonVariant variant,
    this.onPressed,
    this.tooltip,
    this.iconSize = _kIconSize,
    Color? color,
    LinearGradient? gradient,
  })  : _variant = variant,
        _color = color,
        _gradient = gradient;

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

  /// Creates a filled icon button with an arbitrary [color] or [gradient].
  ///
  /// Exactly one of [color] or [gradient] must be provided.
  const factory SealFilledIconButton.custom({
    Key? key,
    required IconData icon,
    Color? color,
    LinearGradient? gradient,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _CustomSealFilledIconButton;

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
  final Color? _color;
  final LinearGradient? _gradient;

  bool get _isDisabled => onPressed == null;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final dimension = context.dimension;
    final scaledIconSize = dimension.scaled(iconSize);
    final buttonSize = scaledIconSize + dimension.sm * 2;

    final bool isGradient =
        _variant == _SealFilledIconButtonVariant.gradient ||
        _variant == _SealFilledIconButtonVariant.accentGradient ||
        (_variant == _SealFilledIconButtonVariant.custom && _gradient != null);

    if (isGradient) {
      final gradient = _variant == _SealFilledIconButtonVariant.gradient
          ? tokens.gradients.primaryGradient
          : _variant == _SealFilledIconButtonVariant.accentGradient
              ? tokens.gradients.accentGradient
              : _gradient!;
      final foregroundColor =
          _variant == _SealFilledIconButtonVariant.accentGradient
              ? colors.onAccent
              : colors.onPrimary;

      Widget button = AnimatedOpacity(
        opacity: _isDisabled ? _kDisabledOpacity : 1.0,
        duration: const Duration(milliseconds: 200),
        child: ShadIconButton.raw(
          variant: ShadButtonVariant.primary,
          icon: Icon(icon, size: scaledIconSize),
          onPressed: _isDisabled ? null : onPressed,
          enabled: !_isDisabled,
          width: buttonSize,
          height: buttonSize,
          gradient: gradient,
          decoration: ShadDecoration(
            border: ShadBorder.all(radius: SealRadius.borderRadiusSm, width: 0),
          ),
          foregroundColor: foregroundColor,
          hoverForegroundColor: foregroundColor,
          pressedForegroundColor: foregroundColor,
          padding: EdgeInsets.all(dimension.sm),
        ),
      );

      if (tooltip == null) return button;
      return Tooltip(message: tooltip!, child: button);
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
      case _SealFilledIconButtonVariant.custom:
        backgroundColor = _color!;
        foregroundColor = Colors.white;
    }

    return ShadIconButton.raw(
      variant: ShadButtonVariant.primary,
      icon: Icon(icon, size: scaledIconSize),
      onPressed: _isDisabled ? null : onPressed,
      enabled: !_isDisabled,
      width: buttonSize,
      height: buttonSize,
      decoration: ShadDecoration(
        border: ShadBorder.all(radius: SealRadius.borderRadiusSm, width: 0),
      ),
      backgroundColor: backgroundColor,
      hoverBackgroundColor: backgroundColor.withValues(alpha: 0.85),
      pressedBackgroundColor: backgroundColor.withValues(alpha: 0.75),
      foregroundColor: foregroundColor,
      hoverForegroundColor: foregroundColor,
      pressedForegroundColor: foregroundColor,
      padding: EdgeInsets.all(dimension.sm),
    );
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

/// Redirecting factory for [SealFilledIconButton.custom].
class _CustomSealFilledIconButton extends SealFilledIconButton {
  const _CustomSealFilledIconButton({
    super.key,
    required super.icon,
    super.color,
    super.gradient,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : assert(
         color != null || gradient != null,
         'SealFilledIconButton.custom requires either color or gradient.',
       ),
       super._(variant: _SealFilledIconButtonVariant.custom);
}
