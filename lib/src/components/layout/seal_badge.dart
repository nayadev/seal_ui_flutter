import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_colors.dart';

/// The visual variant of a [SealBadge].
enum SealBadgeVariant {
  /// Primary brand color background.
  primary,

  /// Accent color background.
  accent,

  /// Muted/secondary background.
  secondary,

  /// Transparent background with a border.
  outline,

  /// Success semantic color.
  success,

  /// Warning semantic color.
  warning,

  /// Error/destructive semantic color.
  error,
}

/// A compact label badge styled with Seal UI tokens, built on [ShadBadge].
///
/// Use the named constructors to choose a semantic variant:
///
/// - [SealBadge.primary] — brand primary color.
/// - [SealBadge.accent] — accent color.
/// - [SealBadge.secondary] — muted background.
/// - [SealBadge.outline] — bordered, no fill.
/// - [SealBadge.success] — success green.
/// - [SealBadge.warning] — warning amber.
/// - [SealBadge.error] — error red.
///
/// ```dart
/// SealBadge.primary(child: const Text('New'))
/// SealBadge.success(child: const Text('Active'))
/// SealBadge.error(child: const Text('Expired'))
/// ```
class SealBadge extends StatelessWidget {
  /// Background opacity for semantic (success/warning/error) badges.
  static const double _kSemanticBgOpacity = 0.15;

  const SealBadge._({
    super.key,
    required this.child,
    required SealBadgeVariant variant,
    this.onPressed,
  }) : _variant = variant;

  /// Creates a **primary** brand-color badge.
  const factory SealBadge.primary({
    Key? key,
    required Widget child,
    VoidCallback? onPressed,
  }) = _PrimarySealBadge;

  /// Creates an **accent**-color badge.
  const factory SealBadge.accent({
    Key? key,
    required Widget child,
    VoidCallback? onPressed,
  }) = _AccentSealBadge;

  /// Creates a **secondary** muted badge.
  const factory SealBadge.secondary({
    Key? key,
    required Widget child,
    VoidCallback? onPressed,
  }) = _SecondarySealBadge;

  /// Creates an **outline** badge with no fill.
  const factory SealBadge.outline({
    Key? key,
    required Widget child,
    VoidCallback? onPressed,
  }) = _OutlineSealBadge;

  /// Creates a **success** semantic badge.
  const factory SealBadge.success({
    Key? key,
    required Widget child,
    VoidCallback? onPressed,
  }) = _SuccessSealBadge;

  /// Creates a **warning** semantic badge.
  const factory SealBadge.warning({
    Key? key,
    required Widget child,
    VoidCallback? onPressed,
  }) = _WarningSealBadge;

  /// Creates an **error** semantic badge.
  const factory SealBadge.error({
    Key? key,
    required Widget child,
    VoidCallback? onPressed,
  }) = _ErrorSealBadge;

  /// The badge content.
  final Widget child;

  /// Optional tap callback.
  final VoidCallback? onPressed;

  final SealBadgeVariant _variant;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;

    switch (_variant) {
      case SealBadgeVariant.primary:
        return ShadBadge.raw(
          variant: ShadBadgeVariant.primary,
          backgroundColor: colors.primary,
          hoverBackgroundColor: colors.primaryShade,
          foregroundColor: colors.onPrimary,
          onPressed: onPressed,
          child: child,
        );

      case SealBadgeVariant.accent:
        return ShadBadge.raw(
          variant: ShadBadgeVariant.primary,
          backgroundColor: colors.accent,
          hoverBackgroundColor: colors.accentSecondary,
          foregroundColor: colors.onAccent,
          onPressed: onPressed,
          child: child,
        );

      case SealBadgeVariant.secondary:
        return ShadBadge.raw(
          variant: ShadBadgeVariant.secondary,
          onPressed: onPressed,
          child: child,
        );

      case SealBadgeVariant.outline:
        return ShadBadge.raw(
          variant: ShadBadgeVariant.outline,
          foregroundColor: colors.textPrimary,
          onPressed: onPressed,
          child: child,
        );

      case SealBadgeVariant.success:
        return ShadBadge.raw(
          variant: ShadBadgeVariant.primary,
          backgroundColor: colors.success.withValues(
            alpha: _kSemanticBgOpacity,
          ),
          hoverBackgroundColor: colors.success.withValues(
            alpha: _kSemanticBgOpacity * 1.5,
          ),
          foregroundColor: colors.success,
          shape: const StadiumBorder(
            side: BorderSide(color: ColorX.transparent),
          ),
          onPressed: onPressed,
          child: child,
        );

      case SealBadgeVariant.warning:
        return ShadBadge.raw(
          variant: ShadBadgeVariant.primary,
          backgroundColor: colors.warning.withValues(
            alpha: _kSemanticBgOpacity,
          ),
          hoverBackgroundColor: colors.warning.withValues(
            alpha: _kSemanticBgOpacity * 1.5,
          ),
          foregroundColor: colors.warning,
          shape: const StadiumBorder(
            side: BorderSide(color: ColorX.transparent),
          ),
          onPressed: onPressed,
          child: child,
        );

      case SealBadgeVariant.error:
        return ShadBadge.raw(
          variant: ShadBadgeVariant.primary,
          backgroundColor: colors.error.withValues(
            alpha: _kSemanticBgOpacity,
          ),
          hoverBackgroundColor: colors.error.withValues(
            alpha: _kSemanticBgOpacity * 1.5,
          ),
          foregroundColor: colors.error,
          shape: const StadiumBorder(
            side: BorderSide(color: ColorX.transparent),
          ),
          onPressed: onPressed,
          child: child,
        );
    }
  }
}

// ── Redirecting factories ────────────────────────────────────────────────────

class _PrimarySealBadge extends SealBadge {
  const _PrimarySealBadge({super.key, required super.child, super.onPressed})
    : super._(variant: SealBadgeVariant.primary);
}

class _AccentSealBadge extends SealBadge {
  const _AccentSealBadge({super.key, required super.child, super.onPressed})
    : super._(variant: SealBadgeVariant.accent);
}

class _SecondarySealBadge extends SealBadge {
  const _SecondarySealBadge({super.key, required super.child, super.onPressed})
    : super._(variant: SealBadgeVariant.secondary);
}

class _OutlineSealBadge extends SealBadge {
  const _OutlineSealBadge({super.key, required super.child, super.onPressed})
    : super._(variant: SealBadgeVariant.outline);
}

class _SuccessSealBadge extends SealBadge {
  const _SuccessSealBadge({super.key, required super.child, super.onPressed})
    : super._(variant: SealBadgeVariant.success);
}

class _WarningSealBadge extends SealBadge {
  const _WarningSealBadge({super.key, required super.child, super.onPressed})
    : super._(variant: SealBadgeVariant.warning);
}

class _ErrorSealBadge extends SealBadge {
  const _ErrorSealBadge({super.key, required super.child, super.onPressed})
    : super._(variant: SealBadgeVariant.error);
}
