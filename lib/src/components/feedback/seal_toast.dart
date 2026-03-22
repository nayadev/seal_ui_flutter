import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/abstractions/color_palette.dart';
import '../../tokens/base/seal_dimension.dart';
import '../buttons/seal_text_button.dart';

/// The semantic variant of a [SealToast].
enum SealToastVariant {
  /// Informational message.
  info,

  /// Success confirmation.
  success,

  /// Non-critical warning.
  warning,

  /// Error or failure.
  error,
}

/// A transient floating notification styled with Seal UI tokens, built on
/// [ShadToast] / [ShadToaster].
///
/// Call [show] with a [BuildContext] that has a [ShadToaster] ancestor —
/// [SealThemeScope] injects one automatically.
///
/// Use the named constructors to choose a semantic variant or provide a fully
/// custom appearance:
///
/// - [SealToast.info] — informational message.
/// - [SealToast.success] — success confirmation.
/// - [SealToast.warning] — non-critical warning.
/// - [SealToast.error] — error or failure.
/// - [SealToast.custom] — arbitrary color and optional icon.
///
/// ```dart
/// SealToast.success(message: Text('Profile saved!')).show(context);
///
/// SealToast.error(
///   message: Text('Upload failed.'),
///   title: Text('Error'),
///   actionLabel: Text('Retry'),
///   onAction: _retryUpload,
/// ).show(context);
///
/// SealToast.custom(
///   message: Text('Synced 42 items.'),
///   icon: LucideIcons.refreshCw,
///   color: Color(0xFF00BCD4),
/// ).show(context);
/// ```
class SealToast {
  const SealToast._({
    SealToastVariant? variant,
    required this.message,
    this.title,
    this.duration = _kDefaultDuration,
    this.alignment = Alignment.topCenter,
    this.actionLabel,
    this.onAction,
    IconData? icon,
    Color? color,
  })  : _variant = variant,
        _icon = icon,
        _customColor = color;

  /// Default display duration when none is specified.
  static const Duration _kDefaultDuration = Duration(seconds: 5);

  /// Creates an **informational** toast.
  const factory SealToast.info({
    required Widget message,
    Widget? title,
    Duration duration,
    Alignment? alignment,
    Widget? actionLabel,
    VoidCallback? onAction,
  }) = _InfoSealToast;

  /// Creates a **success** toast.
  const factory SealToast.success({
    required Widget message,
    Widget? title,
    Duration duration,
    Alignment? alignment,
    Widget? actionLabel,
    VoidCallback? onAction,
  }) = _SuccessSealToast;

  /// Creates a **warning** toast.
  const factory SealToast.warning({
    required Widget message,
    Widget? title,
    Duration duration,
    Alignment? alignment,
    Widget? actionLabel,
    VoidCallback? onAction,
  }) = _WarningSealToast;

  /// Creates an **error** toast.
  const factory SealToast.error({
    required Widget message,
    Widget? title,
    Duration duration,
    Alignment? alignment,
    Widget? actionLabel,
    VoidCallback? onAction,
  }) = _ErrorSealToast;

  /// Creates a **custom** toast with an arbitrary accent [color] and an
  /// optional [icon].
  ///
  /// When [icon] is omitted, no icon is shown. When [color] is omitted, the
  /// theme's primary color is used.
  ///
  /// ```dart
  /// SealToast.custom(
  ///   message: Text('All changes saved.'),
  ///   icon: LucideIcons.save,
  ///   color: Color(0xFF4CAF50),
  /// ).show(context);
  /// ```
  const factory SealToast.custom({
    required Widget message,
    Widget? title,
    IconData? icon,
    Color? color,
    Duration duration,
    Alignment? alignment,
    Widget? actionLabel,
    VoidCallback? onAction,
  }) = _CustomSealToast;

  /// The primary message widget displayed in the toast body.
  final Widget message;

  /// Optional title widget shown above [message].
  final Widget? title;

  /// How long the toast remains visible. Defaults to 5 seconds.
  final Duration duration;

  /// Where on screen the toast appears.
  ///
  /// Defaults to [Alignment.topCenter].
  final Alignment? alignment;

  /// Label widget for the optional action button.
  ///
  /// Requires [onAction] to be non-null for the button to appear.
  final Widget? actionLabel;

  /// Callback invoked when the action button is tapped.
  ///
  /// Requires [actionLabel] to be non-null for the button to appear.
  final VoidCallback? onAction;

  final SealToastVariant? _variant;
  final IconData? _icon;
  final Color? _customColor;

  /// Displays this toast in the widget tree.
  ///
  /// Requires a [ShadToaster] ancestor — provided automatically by
  /// [SealThemeScope].
  void show(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;
    final dimension = context.dimension;

    final variant = _variant;
    final accentColor = _customColor ??
        (variant != null ? _accentColorFor(variant, colors) : colors.primary);
    final resolvedIcon =
        _icon ?? (variant != null ? _iconFor(variant) : null);

    final hasAction = actionLabel != null && onAction != null;

    ShadToaster.of(context).show(
      ShadToast(
        duration: duration,
        alignment: alignment,
        backgroundColor: colors.surfaceAlt,
        border: ShadBorder.all(color: colors.border),
        titleStyle: typo.small.copyWith(
          color: colors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        descriptionStyle: typo.small.copyWith(color: colors.textSecondary),
        // Icon is embedded in the title row to appear inline with the text.
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (resolvedIcon != null) ...[
              Icon(resolvedIcon, color: accentColor, size: dimension.scaled(16)),
              SizedBox(width: dimension.xxs),
            ],
            title ?? message,
          ],
        ),
        description: title != null
            ? Padding(
                padding: EdgeInsets.only(top: dimension.xxs),
                child: message,
              )
            : null,
        action: hasAction
            ? SealTextButton.custom(
                label: actionLabel!,
                color: accentColor,
                onPressed: onAction,
              )
            : null,
      ),
    );
  }

  static IconData _iconFor(SealToastVariant variant) => switch (variant) {
        SealToastVariant.info => LucideIcons.info,
        SealToastVariant.success => LucideIcons.circleCheck,
        SealToastVariant.warning => LucideIcons.triangleAlert,
        SealToastVariant.error => LucideIcons.circleX,
      };

  static Color _accentColorFor(SealToastVariant variant, ColorPalette colors) =>
      switch (variant) {
        SealToastVariant.info => colors.info,
        SealToastVariant.success => colors.success,
        SealToastVariant.warning => colors.warning,
        SealToastVariant.error => colors.error,
      };
}

// ── Redirecting factories ────────────────────────────────────────────────────

class _InfoSealToast extends SealToast {
  const _InfoSealToast({
    required super.message,
    super.title,
    super.duration,
    super.alignment,
    super.actionLabel,
    super.onAction,
  }) : super._(variant: SealToastVariant.info);
}

class _SuccessSealToast extends SealToast {
  const _SuccessSealToast({
    required super.message,
    super.title,
    super.duration,
    super.alignment,
    super.actionLabel,
    super.onAction,
  }) : super._(variant: SealToastVariant.success);
}

class _WarningSealToast extends SealToast {
  const _WarningSealToast({
    required super.message,
    super.title,
    super.duration,
    super.alignment,
    super.actionLabel,
    super.onAction,
  }) : super._(variant: SealToastVariant.warning);
}

class _ErrorSealToast extends SealToast {
  const _ErrorSealToast({
    required super.message,
    super.title,
    super.duration,
    super.alignment,
    super.actionLabel,
    super.onAction,
  }) : super._(variant: SealToastVariant.error);
}

class _CustomSealToast extends SealToast {
  const _CustomSealToast({
    required super.message,
    super.title,
    super.icon,
    super.color,
    super.duration,
    super.alignment,
    super.actionLabel,
    super.onAction,
  }) : super._(variant: null);
}
