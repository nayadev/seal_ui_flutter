import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_dimension.dart';
import 'seal_semantic_variant_enum.dart';

/// The semantic variant of a [SealAlert].
typedef SealAlertVariant = SealSemanticVariant;

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
    Widget? title,
    required Widget description,
  }) = _InfoSealAlert;

  /// Creates a **success** alert.
  const factory SealAlert.success({
    Key? key,
    Widget? title,
    required Widget description,
  }) = _SuccessSealAlert;

  /// Creates a **warning** alert.
  const factory SealAlert.warning({
    Key? key,
    Widget? title,
    required Widget description,
  }) = _WarningSealAlert;

  /// Creates an **error** alert.
  const factory SealAlert.error({
    Key? key,
    Widget? title,
    required Widget description,
  }) = _ErrorSealAlert;

  /// Optional bold title shown above [description].
  final Widget? title;

  /// The primary descriptive message.
  final Widget description;

  final SealAlertVariant _variant;

  /// Background tint opacity for the alert surface.
  static const double _kBackgroundOpacity = 0.08;

  /// Border opacity for the alert container.
  static const double _kBorderOpacity = 0.35;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;
    final dimension = context.dimension;

    final accentColor = _variant.accentColor(colors);
    final icon = _variant.icon;

    return ShadAlert.raw(
      variant: ShadAlertVariant.primary,
      icon: Padding(
        padding: EdgeInsets.only(right: dimension.xs),
        child: Icon(icon),
      ),
      iconColor: accentColor,
      iconSize: dimension.scaled(16),
      title: title != null
          ? DefaultTextStyle.merge(
              style: typo.small.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
              child: title!,
            )
          : null,
      description: Padding(
        padding: EdgeInsets.only(top: title != null ? dimension.xxs : 0),
        child: DefaultTextStyle.merge(
          style: typo.small.copyWith(
            color: title != null ? colors.textSecondary : colors.textPrimary,
          ),
          child: description,
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
