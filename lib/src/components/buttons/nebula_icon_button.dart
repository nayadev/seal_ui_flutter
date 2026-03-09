import 'package:flutter/material.dart';

import '../../theme/nebula_theme.dart';
import '../../tokens/base/nebula_dimension.dart';
import '../../tokens/base/nebula_radius.dart';

/// The visual variant of a [NebulaIconButton].
enum _NebulaIconButtonVariant {
  primary,
  accent,
  accentSecondary,
  gradient,
  accentGradient,
}

/// A compact ghost icon-only button — no background, no border — styled with
/// Nebula UI tokens.
///
/// The icon-button equivalent of [NebulaTextButton]: use for low-emphasis
/// actions in toolbars, app bars, and inline contexts. Use [tooltip] to
/// maintain accessibility for icon-only controls.
///
/// Use the named constructors to choose a variant:
///
/// - [NebulaIconButton.primary] — primary brand color icon.
/// - [NebulaIconButton.accent] — accent color icon.
/// - [NebulaIconButton.accentSecondary] — secondary accent color icon.
/// - [NebulaIconButton.gradient] — primary gradient icon.
/// - [NebulaIconButton.accentGradient] — accent gradient icon.
///
/// ```dart
/// NebulaIconButton.primary(
///   icon: Icons.close,
///   onPressed: () {},
///   tooltip: 'Close',
/// )
///
/// NebulaIconButton.gradient(
///   icon: Icons.tune_rounded,
///   onPressed: () {},
///   tooltip: 'Filter',
/// )
/// ```
class NebulaIconButton extends StatelessWidget {
  /// Default icon size for ghost icon buttons.
  static const double _kIconSize = 24.0;

  /// Opacity applied to the button when disabled.
  static const double _kDisabledOpacity = 0.4;

  /// Border radius applied to all icon button variants.
  static const BorderRadius _kBorderRadius = NebulaRadius.borderRadiusFull;

  const NebulaIconButton._({
    super.key,
    required this.icon,
    required _NebulaIconButtonVariant variant,
    this.onPressed,
    this.tooltip,
    this.iconSize = _kIconSize,
  }) : _variant = variant;

  /// Creates a ghost icon button with the **primary** brand color.
  const factory NebulaIconButton.primary({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _PrimaryNebulaIconButton;

  /// Creates a ghost icon button with the **accent** color.
  const factory NebulaIconButton.accent({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _AccentNebulaIconButton;

  /// Creates a ghost icon button with the **secondary accent** color.
  const factory NebulaIconButton.accentSecondary({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _AccentSecondaryNebulaIconButton;

  /// Creates a ghost icon button with a **primary gradient** icon.
  const factory NebulaIconButton.gradient({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _GradientNebulaIconButton;

  /// Creates a ghost icon button with an **accent gradient** icon.
  const factory NebulaIconButton.accentGradient({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _AccentGradientNebulaIconButton;

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

  final _NebulaIconButtonVariant _variant;

  bool get _isDisabled => onPressed == null;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final dimension = context.dimension;
    final iconSize = dimension.scaled(this.iconSize);

    final bool isGradient =
        _variant == _NebulaIconButtonVariant.gradient ||
        _variant == _NebulaIconButtonVariant.accentGradient;

    if (isGradient) {
      final gradient = _variant == _NebulaIconButtonVariant.gradient
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
      case _NebulaIconButtonVariant.primary:
        foregroundColor = colors.foreground.active;
      case _NebulaIconButtonVariant.accent:
        foregroundColor = colors.accent;
      case _NebulaIconButtonVariant.accentSecondary:
        foregroundColor = colors.accentSecondary;
      case _NebulaIconButtonVariant.gradient:
      case _NebulaIconButtonVariant.accentGradient:
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
        padding: EdgeInsets.all(dimension.sm),
        shape: RoundedRectangleBorder(borderRadius: _kBorderRadius),
      ),
    );
  }
}

/// Redirecting factory for [NebulaIconButton.primary].
class _PrimaryNebulaIconButton extends NebulaIconButton {
  const _PrimaryNebulaIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _NebulaIconButtonVariant.primary);
}

/// Redirecting factory for [NebulaIconButton.accent].
class _AccentNebulaIconButton extends NebulaIconButton {
  const _AccentNebulaIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _NebulaIconButtonVariant.accent);
}

/// Redirecting factory for [NebulaIconButton.accentSecondary].
class _AccentSecondaryNebulaIconButton extends NebulaIconButton {
  const _AccentSecondaryNebulaIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _NebulaIconButtonVariant.accentSecondary);
}

/// Redirecting factory for [NebulaIconButton.gradient].
class _GradientNebulaIconButton extends NebulaIconButton {
  const _GradientNebulaIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _NebulaIconButtonVariant.gradient);
}

/// Redirecting factory for [NebulaIconButton.accentGradient].
class _AccentGradientNebulaIconButton extends NebulaIconButton {
  const _AccentGradientNebulaIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _NebulaIconButtonVariant.accentGradient);
}
