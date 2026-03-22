import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/abstractions/color_palette.dart';
import '../../tokens/base/seal_dimension.dart';

/// The semantic variant of a [SealAlert].
enum SealAlertVariant {
  /// Informational message.
  info,

  /// Success confirmation.
  success,

  /// Non-critical warning.
  warning,

  /// Error or failure.
  error,
}

/// An inline alert banner styled with Seal UI tokens, built on [ShadAlert].
///
/// Renders as a static widget inside the layout — use it for contextual
/// feedback that should remain visible until dismissed by the user or by
/// a state change. For transient, auto-dismissing notifications use
/// [SealToast] instead.
///
/// Use the named constructors to choose a semantic variant:
///
/// - [SealAlert.info] — informational message.
/// - [SealAlert.success] — success confirmation.
/// - [SealAlert.warning] — non-critical warning.
/// - [SealAlert.error] — error or failure.
///
/// ```dart
/// SealAlert.success(
///   title: 'Profile updated',
///   description: 'Your changes have been saved.',
/// )
///
/// SealAlert.error(
///   description: 'Upload failed. Please try again.',
/// )
/// ```
class SealAlert extends StatelessWidget {
  const SealAlert._({
    super.key,
    required SealAlertVariant variant,
    this.title,
    required this.description,
  }) : _variant = variant;

  /// Creates an **informational** alert.
  const factory SealAlert.info({
    Key? key,
    String? title,
    required String description,
  }) = _InfoSealAlert;

  /// Creates a **success** alert.
  const factory SealAlert.success({
    Key? key,
    String? title,
    required String description,
  }) = _SuccessSealAlert;

  /// Creates a **warning** alert.
  const factory SealAlert.warning({
    Key? key,
    String? title,
    required String description,
  }) = _WarningSealAlert;

  /// Creates an **error** alert.
  const factory SealAlert.error({
    Key? key,
    String? title,
    required String description,
  }) = _ErrorSealAlert;

  /// Optional bold title shown above [description].
  final String? title;

  /// The primary descriptive message.
  final String description;

  final SealAlertVariant _variant;

  /// Background tint opacity for the alert surface.
  static const double _kBackgroundOpacity = 0.08;

  /// Border opacity for the alert container.
  static const double _kBorderOpacity = 0.35;

  static IconData _iconFor(SealAlertVariant variant) => switch (variant) {
    SealAlertVariant.info => LucideIcons.info,
    SealAlertVariant.success => LucideIcons.circleCheck,
    SealAlertVariant.warning => LucideIcons.triangleAlert,
    SealAlertVariant.error => LucideIcons.circleX,
  };

  static Color _accentColorFor(SealAlertVariant variant, ColorPalette colors) =>
      switch (variant) {
        SealAlertVariant.info => colors.info,
        SealAlertVariant.success => colors.success,
        SealAlertVariant.warning => colors.warning,
        SealAlertVariant.error => colors.error,
      };

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;
    final dimension = context.dimension;

    final accentColor = _accentColorFor(_variant, colors);
    final icon = _iconFor(_variant);

    return ShadAlert.raw(
      variant: ShadAlertVariant.primary,
      icon: Padding(
        padding: EdgeInsets.only(right: dimension.xs),
        child: Icon(icon),
      ),
      iconColor: accentColor,
      iconSize: dimension.scaled(16),
      title: title != null
          ? Text(
              title!,
              style: typo.small.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            )
          : null,
      description: Padding(
        padding: EdgeInsets.only(top: title != null ? dimension.xxs : 0),
        child: Text(
          description,
          style: typo.small.copyWith(
            color: title != null ? colors.textSecondary : colors.textPrimary,
          ),
        ),
      ),
      decoration: ShadDecoration(
        color: accentColor.withValues(alpha: _kBackgroundOpacity),
        border: ShadBorder.all(
          color: accentColor.withValues(alpha: _kBorderOpacity),
        ),
      ),
    );
  }
}

// ── Redirecting factories ────────────────────────────────────────────────────

class _InfoSealAlert extends SealAlert {
  const _InfoSealAlert({super.key, super.title, required super.description})
    : super._(variant: SealAlertVariant.info);
}

class _SuccessSealAlert extends SealAlert {
  const _SuccessSealAlert({super.key, super.title, required super.description})
    : super._(variant: SealAlertVariant.success);
}

class _WarningSealAlert extends SealAlert {
  const _WarningSealAlert({super.key, super.title, required super.description})
    : super._(variant: SealAlertVariant.warning);
}

class _ErrorSealAlert extends SealAlert {
  const _ErrorSealAlert({super.key, super.title, required super.description})
    : super._(variant: SealAlertVariant.error);
}
