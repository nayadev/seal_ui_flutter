import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme.dart';
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
/// Use the named constructors to choose a semantic variant:
///
/// - [SealToast.info] — informational message.
/// - [SealToast.success] — success confirmation.
/// - [SealToast.warning] — non-critical warning.
/// - [SealToast.error] — error or failure.
///
/// ```dart
/// SealToast.success(message: 'Profile saved!').show(context);
///
/// SealToast.error(
///   message: 'Upload failed.',
///   title: 'Error',
///   actionLabel: 'Retry',
///   onAction: _retryUpload,
/// ).show(context);
/// ```
class SealToast {
  const SealToast._({
    required SealToastVariant variant,
    required this.message,
    this.title,
    this.duration = _kDefaultDuration,
    this.alignment = Alignment.topCenter,
    this.actionLabel,
    this.onAction,
  }) : _variant = variant;

  /// Default display duration when none is specified.
  static const Duration _kDefaultDuration = Duration(seconds: 5);

  /// Creates an **informational** toast.
  const factory SealToast.info({
    required String message,
    String? title,
    Duration duration,
    Alignment? alignment,
    String? actionLabel,
    VoidCallback? onAction,
  }) = _InfoSealToast;

  /// Creates a **success** toast.
  const factory SealToast.success({
    required String message,
    String? title,
    Duration duration,
    Alignment? alignment,
    String? actionLabel,
    VoidCallback? onAction,
  }) = _SuccessSealToast;

  /// Creates a **warning** toast.
  const factory SealToast.warning({
    required String message,
    String? title,
    Duration duration,
    Alignment? alignment,
    String? actionLabel,
    VoidCallback? onAction,
  }) = _WarningSealToast;

  /// Creates an **error** toast.
  const factory SealToast.error({
    required String message,
    String? title,
    Duration duration,
    Alignment? alignment,
    String? actionLabel,
    VoidCallback? onAction,
  }) = _ErrorSealToast;

  /// The primary message displayed in the toast.
  final String message;

  /// Optional bold title shown above [message].
  final String? title;

  /// How long the toast remains visible. Defaults to 5 seconds.
  final Duration duration;

  /// Where on screen the toast appears.
  ///
  /// Defaults to [Alignment.topCenter].
  final Alignment? alignment;

  /// Label for the optional action button.
  ///
  /// Requires [onAction] to be non-null for the button to appear.
  final String? actionLabel;

  /// Callback invoked when the action button is tapped.
  ///
  /// Requires [actionLabel] to be non-null for the button to appear.
  final VoidCallback? onAction;

  final SealToastVariant _variant;

  /// Displays this toast in the widget tree.
  ///
  /// Requires a [ShadToaster] ancestor — provided automatically by
  /// [SealThemeScope].
  void show(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;
    final dimension = context.dimension;

    final accentColor = _accentColorFor(_variant, colors);
    final icon = _iconFor(_variant);

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
        // The icon is embedded in the title row so it appears inline with text.
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: accentColor, size: dimension.scaled(14)),
            SizedBox(width: dimension.xxs),
            Text(title ?? message),
          ],
        ),
        description: title != null
            ? Padding(
                padding: EdgeInsets.only(top: dimension.xxs),
                child: Text(message),
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
