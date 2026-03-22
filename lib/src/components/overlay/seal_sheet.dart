import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_dimension.dart';
import '../../tokens/base/seal_radius.dart';

/// Shows a Seal-themed sheet sliding in from an edge.
///
/// [side] controls which edge the sheet slides from (defaults to bottom).
/// Returns the value passed to `Navigator.pop`.
///
/// ```dart
/// await showSealSheet(
///   context: context,
///   side: ShadSheetSide.right,
///   builder: (context) => SealSheet(
///     title: const Text('Settings'),
///     child: const _SettingsContent(),
///   ),
/// );
/// ```
Future<T?> showSealSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  ShadSheetSide side = ShadSheetSide.bottom,
  bool isDismissible = true,
}) {
  return showShadSheet<T>(
    context: context,
    builder: builder,
    side: side,
    isDismissible: isDismissible,
  );
}

/// A styled slide-in panel for the Seal UI design system, built on [ShadSheet].
///
/// Typically shown via [showSealSheet]. The sheet slides in from the edge
/// specified by [showSealSheet]'s `side` parameter and can contain arbitrary
/// content with optional title, description, and actions.
///
/// ```dart
/// SealSheet(
///   title: const Text('Filter'),
///   description: const Text('Narrow down your results.'),
///   actions: [
///     SealFilledButton.primary(
///       label: const Text('Apply'),
///       onPressed: () => Navigator.pop(context),
///     ),
///   ],
///   child: const _FilterForm(),
/// )
/// ```
class SealSheet extends StatelessWidget {
  /// Creates a Seal-themed sheet.
  const SealSheet({
    super.key,
    this.title,
    this.description,
    this.actions = const [],
    this.scrollable = false,
    this.draggable = true,
    this.child,
  });

  /// Optional title widget.
  final Widget? title;

  /// Optional descriptive body widget.
  final Widget? description;

  /// Action buttons displayed at the bottom.
  final List<Widget> actions;

  /// Whether the sheet content scrolls when it overflows.
  final bool scrollable;

  /// Whether the user can drag the sheet to dismiss it.
  final bool draggable;

  /// Arbitrary content rendered in the sheet body.
  final Widget? child;

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

    return ShadSheet(
      title: titleWidget,
      description: descriptionWidget,
      actions: actions,
      backgroundColor: colors.surface,
      radius: SealRadius.borderRadiusLg,
      padding: EdgeInsets.all(dimension.lg),
      border: Border.all(color: colors.border),
      useSafeArea: false,
      scrollable: scrollable,
      draggable: draggable,
      child: child,
    );
  }
}
