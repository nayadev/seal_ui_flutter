import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_colors.dart';
import '../../tokens/base/seal_dimension.dart';
import '../../tokens/base/seal_radius.dart';
import 'gradient_shader_mask_mixin.dart';
import 'seal_button_variant_enum.dart';

/// A compact ghost icon-only button — no background, no border — styled with
/// Seal UI tokens and built on [ShadIconButton].
///
/// The icon-button equivalent of [SealTextButton]: use for low-emphasis
/// actions in toolbars, app bars, and inline contexts. Use [tooltip] to
/// maintain accessibility for icon-only controls.
///
/// Use the named constructors to choose a variant:
///
/// - [SealIconButton.primary] — primary brand color icon.
/// - [SealIconButton.accent] — accent color icon.
/// - [SealIconButton.accentSecondary] — secondary accent color icon.
/// - [SealIconButton.gradient] — primary gradient icon.
/// - [SealIconButton.accentGradient] — accent gradient icon.
/// - [SealIconButton.custom] — arbitrary color or gradient.
///
/// ```dart
/// SealIconButton.primary(
///   icon: Icons.close,
///   onPressed: () {},
///   tooltip: 'Close',
/// )
///
/// SealIconButton.gradient(
///   icon: Icons.tune_rounded,
///   onPressed: () {},
///   tooltip: 'Filter',
/// )
///
/// SealIconButton.custom(
///   icon: Icons.star,
///   color: Colors.amber,
///   onPressed: () {},
///   tooltip: 'Favorite',
/// )
/// ```
class SealIconButton extends StatelessWidget with GradientShaderMaskMixin {
  /// Default icon size for ghost icon buttons.
  static const double _kIconSize = 24.0;

  /// Opacity applied to the button when disabled.
  static const double _kDisabledOpacity = 0.4;

  const SealIconButton._({
    super.key,
    required this.icon,
    required SealButtonVariant variant,
    this.onPressed,
    this.tooltip,
    this.iconSize = _kIconSize,
    Color? color,
    LinearGradient? gradient,
  }) : _variant = variant,
       _color = color,
       _gradient = gradient;

  /// Creates a ghost icon button with the **primary** brand color.
  const factory SealIconButton.primary({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _PrimarySealIconButton;

  /// Creates a ghost icon button with the **accent** color.
  const factory SealIconButton.accent({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _AccentSealIconButton;

  /// Creates a ghost icon button with the **secondary accent** color.
  const factory SealIconButton.accentSecondary({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _AccentSecondarySealIconButton;

  /// Creates a ghost icon button with a **primary gradient** icon.
  const factory SealIconButton.gradient({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _GradientSealIconButton;

  /// Creates a ghost icon button with an **accent gradient** icon.
  const factory SealIconButton.accentGradient({
    Key? key,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _AccentGradientSealIconButton;

  /// Creates a ghost icon button with an arbitrary [color] or [gradient].
  ///
  /// Exactly one of [color] or [gradient] must be provided.
  const factory SealIconButton.custom({
    Key? key,
    required IconData icon,
    Color? color,
    LinearGradient? gradient,
    VoidCallback? onPressed,
    String? tooltip,
    double iconSize,
  }) = _CustomSealIconButton;

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
  /// Defaults to [_kIconSize] (24.0). The value is scaled proportionally
  /// via [SealDimension.scaled] to match the active breakpoint.
  final double iconSize;

  final SealButtonVariant _variant;
  final Color? _color;
  final LinearGradient? _gradient;

  bool get _isDisabled => onPressed == null;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final dimension = context.dimension;
    final scaledIconSize = dimension.scaled(iconSize);

    if (_variant.isGradientVariant(_gradient)) {
      return _buildGradientButton(context);
    }

    final foregroundColor = _variant.resolveForegroundColor(colors, _color);

    final buttonSize = scaledIconSize + dimension.sm * 2;
    final button = ShadIconButton.raw(
      variant: ShadButtonVariant.ghost,
      icon: Icon(icon, size: scaledIconSize),
      onPressed: _isDisabled ? null : onPressed,
      enabled: !_isDisabled,
      width: buttonSize,
      height: buttonSize,
      decoration: ShadDecoration(
        border: ShadBorder.all(radius: SealRadius.borderRadiusSm, width: 0),
      ),
      foregroundColor: foregroundColor,
      hoverForegroundColor: foregroundColor,
      pressedForegroundColor: foregroundColor,
      backgroundColor: ColorX.transparent,
      hoverBackgroundColor: foregroundColor.withValues(alpha: 0.08),
      padding: EdgeInsets.all(dimension.sm),
    );
    return wrapWithTooltip(button, tooltip);
  }

  Widget _buildGradientButton(BuildContext context) {
    final tokens = context.themeTokens;
    final dimension = context.dimension;
    final scaledIconSize = dimension.scaled(iconSize);
    final buttonSize = scaledIconSize + dimension.sm * 2;

    final gradient = _variant.resolveGradient(tokens.gradients, _gradient);

    const baseColor = ColorX.white;
    final button = ShadIconButton.raw(
      variant: ShadButtonVariant.ghost,
      icon: Icon(icon, size: scaledIconSize),
      onPressed: _isDisabled ? null : onPressed,
      enabled: !_isDisabled,
      width: buttonSize,
      height: buttonSize,
      decoration: ShadDecoration(
        border: ShadBorder.all(radius: SealRadius.borderRadiusSm, width: 0),
      ),
      foregroundColor: baseColor,
      hoverForegroundColor: baseColor,
      pressedForegroundColor: baseColor,
      backgroundColor: ColorX.transparent,
      hoverBackgroundColor: ColorX.white.withValues(alpha: 0.08),
      padding: EdgeInsets.all(dimension.sm),
    );

    return wrapWithGradientShaderMask(
      button,
      gradient,
      isDisabled: _isDisabled,
      disabledOpacity: _kDisabledOpacity,
      tooltip: tooltip,
    );
  }
}

/// Redirecting factory for [SealIconButton.primary].
class _PrimarySealIconButton extends SealIconButton {
  const _PrimarySealIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: SealButtonVariant.primary);
}

/// Redirecting factory for [SealIconButton.accent].
class _AccentSealIconButton extends SealIconButton {
  const _AccentSealIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: SealButtonVariant.accent);
}

/// Redirecting factory for [SealIconButton.accentSecondary].
class _AccentSecondarySealIconButton extends SealIconButton {
  const _AccentSecondarySealIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: SealButtonVariant.accentSecondary);
}

/// Redirecting factory for [SealIconButton.gradient].
class _GradientSealIconButton extends SealIconButton {
  const _GradientSealIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: SealButtonVariant.gradient);
}

/// Redirecting factory for [SealIconButton.accentGradient].
class _AccentGradientSealIconButton extends SealIconButton {
  const _AccentGradientSealIconButton({
    super.key,
    required super.icon,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : super._(variant: SealButtonVariant.accentGradient);
}

/// Redirecting factory for [SealIconButton.custom].
class _CustomSealIconButton extends SealIconButton {
  const _CustomSealIconButton({
    super.key,
    required super.icon,
    super.color,
    super.gradient,
    super.onPressed,
    super.tooltip,
    super.iconSize,
  }) : assert(
         color != null || gradient != null,
         'SealIconButton.custom requires either color or gradient.',
       ),
       super._(variant: SealButtonVariant.custom);
}
