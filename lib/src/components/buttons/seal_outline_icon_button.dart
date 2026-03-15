import 'package:flutter/material.dart';

import '../../theme/seal_theme.dart';
import '../../tokens/base/seal_dimension.dart';
import '../../tokens/base/seal_radius.dart';

/// The visual variant of a [SealOutlineIconButton].
enum _SealOutlineIconButtonVariant {
  primary,
  accent,
  accentSecondary,
  gradient,
  accentGradient,
}

/// A compact icon-only button with a colored border and transparent background,
/// styled with Seal UI tokens.
///
/// Use for secondary actions that need visual presence without a filled
/// background. Use [tooltip] to maintain accessibility for icon-only controls.
///
/// Use the named constructors to choose a variant:
///
/// - [SealOutlineIconButton.primary] — primary brand color border and icon.
/// - [SealOutlineIconButton.accent] — accent color border and icon.
/// - [SealOutlineIconButton.accentSecondary] — secondary accent border and icon.
/// - [SealOutlineIconButton.gradient] — primary gradient border and icon.
/// - [SealOutlineIconButton.accentGradient] — accent gradient border and icon.
///
/// ```dart
/// SealOutlineIconButton.primary(
///   icon: Icons.share,
///   onPressed: () {},
///   tooltip: 'Share',
/// )
///
/// SealOutlineIconButton.gradient(
///   icon: Icons.tune_rounded,
///   onPressed: () {},
///   tooltip: 'Settings',
/// )
/// ```
class SealOutlineIconButton extends StatelessWidget {
  /// Default icon size for outline icon buttons.
  static const double _kIconSize = 20.0;

  /// Opacity applied to the button when disabled.
  static const double _kDisabledOpacity = 0.4;

  /// Border radius applied to all outline icon button variants.
  static const BorderRadius _kBorderRadius = SealRadius.borderRadiusFull;

  const SealOutlineIconButton._({
    super.key,
    required this.icon,
    required _SealOutlineIconButtonVariant variant,
    this.onPressed,
    this.tooltip,
    this.iconSize = _kIconSize,
  }) : _variant = variant;

  /// Creates an outlined icon button with the **primary** brand color.
  const factory SealOutlineIconButton.primary({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _PrimarySealOutlineIconButton;

  /// Creates an outlined icon button with the **accent** color.
  const factory SealOutlineIconButton.accent({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _AccentSealOutlineIconButton;

  /// Creates an outlined icon button with the **secondary accent** color.
  const factory SealOutlineIconButton.accentSecondary({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _AccentSecondarySealOutlineIconButton;

  /// Creates an outlined icon button with the **primary gradient** border and icon.
  const factory SealOutlineIconButton.gradient({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _GradientSealOutlineIconButton;

  /// Creates an outlined icon button with the **accent gradient** border and icon.
  const factory SealOutlineIconButton.accentGradient({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _AccentGradientSealOutlineIconButton;

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

  final _SealOutlineIconButtonVariant _variant;

  bool get _isDisabled => onPressed == null;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final dimension = context.dimension;
    final iconSize = dimension.scaled(this.iconSize);

    final bool isGradient =
        _variant == _SealOutlineIconButtonVariant.gradient ||
        _variant == _SealOutlineIconButtonVariant.accentGradient;

    if (isGradient) {
      final gradient = _variant == _SealOutlineIconButtonVariant.gradient
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
      case _SealOutlineIconButtonVariant.primary:
        foregroundColor = colors.foreground.active;
      case _SealOutlineIconButtonVariant.accent:
        foregroundColor = colors.accent;
      case _SealOutlineIconButtonVariant.accentSecondary:
        foregroundColor = colors.accentSecondary;
      case _SealOutlineIconButtonVariant.gradient:
      case _SealOutlineIconButtonVariant.accentGradient:
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

/// Redirecting factory for [SealOutlineIconButton.primary].
class _PrimarySealOutlineIconButton extends SealOutlineIconButton {
  const _PrimarySealOutlineIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _SealOutlineIconButtonVariant.primary);
}

/// Redirecting factory for [SealOutlineIconButton.accent].
class _AccentSealOutlineIconButton extends SealOutlineIconButton {
  const _AccentSealOutlineIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _SealOutlineIconButtonVariant.accent);
}

/// Redirecting factory for [SealOutlineIconButton.accentSecondary].
class _AccentSecondarySealOutlineIconButton extends SealOutlineIconButton {
  const _AccentSecondarySealOutlineIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _SealOutlineIconButtonVariant.accentSecondary);
}

/// Redirecting factory for [SealOutlineIconButton.gradient].
class _GradientSealOutlineIconButton extends SealOutlineIconButton {
  const _GradientSealOutlineIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _SealOutlineIconButtonVariant.gradient);
}

/// Redirecting factory for [SealOutlineIconButton.accentGradient].
class _AccentGradientSealOutlineIconButton extends SealOutlineIconButton {
  const _AccentGradientSealOutlineIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: _SealOutlineIconButtonVariant.accentGradient);
}
