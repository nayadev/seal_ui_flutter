import 'package:flutter/material.dart';

import '../../theme/nebula_theme.dart';
import '../../tokens/base/nebula_dimension.dart';
import '../../tokens/base/nebula_radius.dart';

/// The visual variant of a [NebulaOutlineIconButton].
enum _NebulaOutlineIconButtonVariant {
  primary,
  accent,
  accentSecondary,
  gradient,
  accentGradient,
}

/// A compact icon-only button with a colored border and transparent background,
/// styled with Nebula UI tokens.
///
/// Use for secondary actions that need visual presence without a filled
/// background. Use [tooltip] to maintain accessibility for icon-only controls.
///
/// Use the named constructors to choose a variant:
///
/// - [NebulaOutlineIconButton.primary] — primary brand color border and icon.
/// - [NebulaOutlineIconButton.accent] — accent color border and icon.
/// - [NebulaOutlineIconButton.accentSecondary] — secondary accent border and icon.
/// - [NebulaOutlineIconButton.gradient] — primary gradient border and icon.
/// - [NebulaOutlineIconButton.accentGradient] — accent gradient border and icon.
///
/// ```dart
/// NebulaOutlineIconButton.primary(
///   icon: Icons.share,
///   onPressed: () {},
///   tooltip: 'Share',
/// )
///
/// NebulaOutlineIconButton.gradient(
///   icon: Icons.tune_rounded,
///   onPressed: () {},
///   tooltip: 'Settings',
/// )
/// ```
class NebulaOutlineIconButton extends StatelessWidget {
  /// Default icon size for outline icon buttons.
  static const double _kIconSize = 20.0;

  /// Opacity applied to the button when disabled.
  static const double _kDisabledOpacity = 0.4;

  /// Border radius applied to all outline icon button variants.
  static const BorderRadius _kBorderRadius = NebulaRadius.borderRadiusFull;

  const NebulaOutlineIconButton._({
    super.key,
    required this.icon,
    required _NebulaOutlineIconButtonVariant variant,
    this.onPressed,
    this.tooltip,
    this.iconSize = _kIconSize,
  }) : _variant = variant;

  /// Creates an outlined icon button with the **primary** brand color.
  const factory NebulaOutlineIconButton.primary({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _PrimaryNebulaOutlineIconButton;

  /// Creates an outlined icon button with the **accent** color.
  const factory NebulaOutlineIconButton.accent({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _AccentNebulaOutlineIconButton;

  /// Creates an outlined icon button with the **secondary accent** color.
  const factory NebulaOutlineIconButton.accentSecondary({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _AccentSecondaryNebulaOutlineIconButton;

  /// Creates an outlined icon button with the **primary gradient** border and icon.
  const factory NebulaOutlineIconButton.gradient({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _GradientNebulaOutlineIconButton;

  /// Creates an outlined icon button with the **accent gradient** border and icon.
  const factory NebulaOutlineIconButton.accentGradient({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _AccentGradientNebulaOutlineIconButton;

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

  final _NebulaOutlineIconButtonVariant _variant;

  bool get _isDisabled => onPressed == null;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final dimension = context.dimension;
    final iconSize = dimension.scaled(this.iconSize);

    final bool isGradient =
        _variant == _NebulaOutlineIconButtonVariant.gradient ||
        _variant == _NebulaOutlineIconButtonVariant.accentGradient;

    if (isGradient) {
      final gradient = _variant == _NebulaOutlineIconButtonVariant.gradient
          ? tokens.gradients.primaryGradient
          : tokens.gradients.accentGradient;

      final baseColor = Colors.white;
      final disabledColor = baseColor.withValues(alpha: _kDisabledOpacity);

      final button = IconButton(
        icon: Icon(icon, size: iconSize),
        onPressed: _isDisabled ? null : onPressed,
        tooltip: tooltip,
        style: IconButton.styleFrom(
          foregroundColor: baseColor,
          disabledForegroundColor: disabledColor,
          side: BorderSide(color: _isDisabled ? disabledColor : baseColor),
          padding: EdgeInsets.all(dimension.sm),
          shape: RoundedRectangleBorder(borderRadius: _kBorderRadius),
        ),
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
      case _NebulaOutlineIconButtonVariant.primary:
        foregroundColor = colors.foreground.active;
      case _NebulaOutlineIconButtonVariant.accent:
        foregroundColor = colors.accent;
      case _NebulaOutlineIconButtonVariant.accentSecondary:
        foregroundColor = colors.accentSecondary;
      case _NebulaOutlineIconButtonVariant.gradient:
      case _NebulaOutlineIconButtonVariant.accentGradient:
        foregroundColor = colors.foreground.active;
    }

    final disabledColor = foregroundColor.withValues(alpha: _kDisabledOpacity);

    return IconButton(
      icon: Icon(icon, size: iconSize),
      onPressed: _isDisabled ? null : onPressed,
      tooltip: tooltip,
      style: IconButton.styleFrom(
        foregroundColor: foregroundColor,
        disabledForegroundColor: disabledColor,
        side: BorderSide(color: _isDisabled ? disabledColor : foregroundColor),
        padding: EdgeInsets.all(dimension.sm),
        shape: RoundedRectangleBorder(borderRadius: _kBorderRadius),
      ),
    );
  }
}

/// Redirecting factory for [NebulaOutlineIconButton.primary].
class _PrimaryNebulaOutlineIconButton extends NebulaOutlineIconButton {
  const _PrimaryNebulaOutlineIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _NebulaOutlineIconButtonVariant.primary);
}

/// Redirecting factory for [NebulaOutlineIconButton.accent].
class _AccentNebulaOutlineIconButton extends NebulaOutlineIconButton {
  const _AccentNebulaOutlineIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _NebulaOutlineIconButtonVariant.accent);
}

/// Redirecting factory for [NebulaOutlineIconButton.accentSecondary].
class _AccentSecondaryNebulaOutlineIconButton extends NebulaOutlineIconButton {
  const _AccentSecondaryNebulaOutlineIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _NebulaOutlineIconButtonVariant.accentSecondary);
}

/// Redirecting factory for [NebulaOutlineIconButton.gradient].
class _GradientNebulaOutlineIconButton extends NebulaOutlineIconButton {
  const _GradientNebulaOutlineIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _NebulaOutlineIconButtonVariant.gradient);
}

/// Redirecting factory for [NebulaOutlineIconButton.accentGradient].
class _AccentGradientNebulaOutlineIconButton extends NebulaOutlineIconButton {
  const _AccentGradientNebulaOutlineIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _NebulaOutlineIconButtonVariant.accentGradient);
}
