import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_dimension.dart';
import '../../tokens/base/seal_radius.dart';

/// Shows a Seal-themed dialog and returns the value passed to
/// `Navigator.pop`.
///
/// Uses [SealDialog] as the dialog widget. Pass [builder] to supply the
/// content; the [SealDialog] named constructors cover most common layouts.
///
/// ```dart
/// final result = await showSealDialog<bool>(
///   context: context,
///   builder: (context) => SealDialog(
///     title: const Text('Confirm'),
///     description: const Text('Are you sure?'),
///     actions: [
///       SealFilledButton.primary(
///         label: const Text('Yes'),
///         onPressed: () => Navigator.pop(context, true),
///       ),
///     ],
///   ),
/// );
/// ```
Future<T?> showSealDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = true,
}) {
  return showShadDialog<T>(
    context: context,
    builder: builder,
    barrierDismissible: barrierDismissible,
  );
}

/// A styled modal dialog for the Seal UI design system, built on [ShadDialog].
///
/// Use [SealDialog] for informational or action dialogs, and [SealDialog.alert]
/// for confirmation / destructive actions.
///
/// ```dart
/// SealDialog(
///   title: const Text('Edit profile'),
///   description: const Text('Make changes to your profile here.'),
///   actions: [
///     SealOutlineButton.primary(
///       label: const Text('Cancel'),
///       onPressed: () => Navigator.pop(context),
///     ),
///     SealFilledButton.primary(
///       label: const Text('Save'),
///       onPressed: _save,
///     ),
///   ],
/// )
/// ```
class SealDialog extends StatelessWidget {
  /// Creates a standard Seal-themed dialog.
  const SealDialog({
    super.key,
    this.title,
    this.description,
    this.child,
    this.actions = const [],
    this.scrollable = false,
  }) : _isAlert = false;

  /// Creates an alert-variant dialog (centered, for confirmations).
  const SealDialog.alert({
    super.key,
    this.title,
    this.description,
    this.child,
    this.actions = const [],
    this.scrollable = false,
  }) : _isAlert = true;

  /// Optional title widget.
  final Widget? title;

  /// Optional descriptive body widget.
  final Widget? description;

  /// Optional arbitrary content rendered between description and actions.
  final Widget? child;

  /// Action buttons displayed at the bottom of the dialog.
  final List<Widget> actions;

  /// Whether the dialog content scrolls when it overflows.
  final bool scrollable;

  final bool _isAlert;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;
    final dimension = context.dimension;

    final titleWidget = title != null
        ? DefaultTextStyle.merge(
            style: typo.large.copyWith(
              color: colors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
            child: title!,
          )
        : null;

    final descriptionWidget = description != null
        ? DefaultTextStyle.merge(
            style: typo.small.copyWith(color: colors.textSecondary),
            child: description!,
          )
        : null;

    if (_isAlert) {
      return ShadDialog.alert(
        title: titleWidget,
        description: descriptionWidget,
        actions: actions,
        backgroundColor: colors.surface,
        radius: SealRadius.borderRadiusLg,
        padding: EdgeInsets.all(dimension.lg),
        border: Border.all(color: colors.border),
        scrollable: scrollable,
        useSafeArea: false,
        child: child,
      );
    }

    return ShadDialog(
      title: titleWidget,
      description: descriptionWidget,
      actions: actions,
      backgroundColor: colors.surface,
      radius: SealRadius.borderRadiusLg,
      padding: EdgeInsets.all(dimension.lg),
      border: Border.all(color: colors.border),
      scrollable: scrollable,
      useSafeArea: false,
      child: child,
    );
  }
}
