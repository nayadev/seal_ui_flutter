import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';

/// A token-driven Sonner-style toast stack built on [ShadSonner].
///
/// Wrap any subtree with [SealSonner] and call [showSealSonner] on a
/// descendant context to display stacked toasts. Unlike [SealToast] (which
/// uses [ShadToaster]), [SealSonner] renders toasts as a collapsible stack
/// in a corner of the screen.
///
/// ```dart
/// SealSonner(
///   child: Builder(
///     builder: (context) => SealFilledButton.primary(
///       label: const Text('Show toast'),
///       onPressed: () => showSealSonner(
///         context,
///         title: const Text('File saved'),
///         description: const Text('Your changes have been synced.'),
///       ),
///     ),
///   ),
/// )
/// ```
class SealSonner extends StatelessWidget {
  /// Creates a Sonner toast scope.
  const SealSonner({
    super.key,
    required this.child,
    this.alignment,
    this.visibleToastsAmount,
  });

  /// The widget tree beneath this Sonner scope.
  final Widget child;

  /// Where on screen the toast stack appears.
  ///
  /// Defaults to [Alignment.bottomRight].
  final AlignmentGeometry? alignment;

  /// Maximum number of toasts visible at once. Defaults to `3`.
  final int? visibleToastsAmount;

  /// Returns the nearest [ShadSonnerState] ancestor.
  ///
  /// Throws if no [SealSonner] (or [ShadSonner]) ancestor is found.
  static ShadSonnerState of(BuildContext context) => ShadSonner.of(context);

  /// Returns the nearest [ShadSonnerState] ancestor, or `null` if absent.
  static ShadSonnerState? maybeOf(BuildContext context) =>
      ShadSonner.maybeOf(context);

  @override
  Widget build(BuildContext context) {
    return ShadSonner(
      alignment: alignment ?? Alignment.bottomRight,
      visibleToastsAmount: visibleToastsAmount,
      child: child,
    );
  }
}

/// Displays a token-styled Sonner toast in the nearest [SealSonner] ancestor.
///
/// Returns the toast identifier, which can be passed to
/// [ShadSonnerState.hide] to dismiss the toast programmatically.
///
/// Requires a [SealSonner] (or [ShadSonner]) ancestor in the widget tree.
///
/// ```dart
/// showSealSonner(
///   context,
///   title: const Text('Upload complete'),
///   description: const Text('3 files were uploaded successfully.'),
/// );
/// ```
Object? showSealSonner(
  BuildContext context, {
  required Widget title,
  Widget? description,
  Widget? action,
}) {
  final colors = context.themeTokens.colors;
  final typo = context.themeTokens.typography;

  return ShadSonner.of(context).show(
    ShadToast(
      title: title,
      description: description,
      action: action,
      backgroundColor: colors.surfaceAlt,
      border: ShadBorder.all(color: colors.border),
      titleStyle: typo.small.copyWith(
        color: colors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
      descriptionStyle: typo.small.copyWith(color: colors.textSecondary),
    ),
  );
}
