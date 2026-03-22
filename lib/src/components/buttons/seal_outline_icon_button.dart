import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme.dart';
import '../../tokens/base/seal_colors.dart';
import '../../tokens/base/seal_dimension.dart';
import '../../tokens/base/seal_radius.dart';

/// The visual variant of a [SealOutlineIconButton].
enum _SealOutlineIconButtonVariant {
  primary,
  accent,
  accentSecondary,
  gradient,
  accentGradient,
  custom,
}

/// A compact icon-only button with a colored border and transparent background,
/// styled with Seal UI tokens and built on [ShadIconButton].
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
/// - [SealOutlineIconButton.custom] — arbitrary color or gradient.
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
///
/// SealOutlineIconButton.custom(
///   icon: Icons.warning_rounded,
///   color: Colors.orange,
///   onPressed: () {},
///   tooltip: 'Warning',
/// )
/// ```
class SealOutlineIconButton extends StatelessWidget {
  /// Default icon size for outline icon buttons.
  static const double _kIconSize = 20.0;

  /// Opacity applied to the button when disabled.
  static const double _kDisabledOpacity = 0.4;

  const SealOutlineIconButton._({
    super.key,
    required this.icon,
    required _SealOutlineIconButtonVariant variant,
    this.onPressed,
    this.tooltip,
    this.iconSize = _kIconSize,
    Color? color,
    LinearGradient? gradient,
  }) : _variant = variant,
       _color = color,
       _gradient = gradient;

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

  /// Creates an outlined icon button with an arbitrary [color] or [gradient].
  ///
  /// Exactly one of [color] or [gradient] must be provided.
  const factory SealOutlineIconButton.custom({
    Key? key,
    required IconData icon,
    Color? color,
    LinearGradient? gradient,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _CustomSealOutlineIconButton;

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
  final Color? _color;
  final LinearGradient? _gradient;

  bool get _isDisabled => onPressed == null;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final dimension = context.dimension;
    final scaledIconSize = dimension.scaled(iconSize);

    final bool isGradient =
        _variant == _SealOutlineIconButtonVariant.gradient ||
        _variant == _SealOutlineIconButtonVariant.accentGradient ||
        (_variant == _SealOutlineIconButtonVariant.custom && _gradient != null);

    if (isGradient) {
      final gradient = _variant == _SealOutlineIconButtonVariant.gradient
          ? tokens.gradients.primaryGradient
          : _variant == _SealOutlineIconButtonVariant.accentGradient
          ? tokens.gradients.accentGradient
          : _gradient!;

      const baseColor = ColorX.white;

      final buttonSize = scaledIconSize + dimension.sm * 2;
      Widget button = ShadIconButton.raw(
        variant: ShadButtonVariant.outline,
        icon: Icon(icon, size: scaledIconSize),
        onPressed: _isDisabled ? null : onPressed,
        enabled: !_isDisabled,
        width: buttonSize,
        height: buttonSize,
        decoration: ShadDecoration(
          border: ShadBorder.all(
            radius: SealRadius.borderRadiusSm,
            color: baseColor,
            width: 1,
          ),
        ),
        foregroundColor: baseColor,
        hoverForegroundColor: baseColor,
        pressedForegroundColor: baseColor,
        backgroundColor: ColorX.transparent,
        hoverBackgroundColor: ColorX.white.withValues(alpha: 0.08),
        padding: EdgeInsets.all(dimension.sm),
      );

      Widget result = AnimatedOpacity(
        opacity: _isDisabled ? _kDisabledOpacity : 1.0,
        duration: const Duration(milliseconds: 200),
        child: ShaderMask(
          shaderCallback: (bounds) => gradient.createShader(bounds),
          blendMode: BlendMode.srcIn,
          child: button,
        ),
      );
      if (tooltip != null) {
        result = ShadTooltip(builder: (_) => Text(tooltip!), child: result);
      }
      return result;
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
      case _SealOutlineIconButtonVariant.custom:
        foregroundColor = _color!;
    }

    final buttonSize = scaledIconSize + dimension.sm * 2;
    final button = ShadIconButton.raw(
      variant: ShadButtonVariant.outline,
      icon: Icon(icon, size: scaledIconSize),
      onPressed: _isDisabled ? null : onPressed,
      enabled: !_isDisabled,
      width: buttonSize,
      height: buttonSize,
      decoration: ShadDecoration(
        border: ShadBorder.all(
          radius: SealRadius.borderRadiusSm,
          color: foregroundColor,
          width: 1,
        ),
      ),
      foregroundColor: foregroundColor,
      hoverForegroundColor: foregroundColor,
      pressedForegroundColor: foregroundColor,
      backgroundColor: ColorX.transparent,
      hoverBackgroundColor: foregroundColor.withValues(alpha: 0.08),
      padding: EdgeInsets.all(dimension.sm),
    );
    if (tooltip == null) return button;
    return ShadTooltip(builder: (_) => Text(tooltip!), child: button);
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

/// Redirecting factory for [SealOutlineIconButton.custom].
class _CustomSealOutlineIconButton extends SealOutlineIconButton {
  const _CustomSealOutlineIconButton({
    super.key,
    required super.icon,
    super.color,
    super.gradient,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : assert(
         color != null || gradient != null,
         'SealOutlineIconButton.custom requires either color or gradient.',
       ),
       super._(variant: _SealOutlineIconButtonVariant.custom);
}
