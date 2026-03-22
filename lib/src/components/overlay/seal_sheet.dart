import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_dimension.dart';
import '../../tokens/base/seal_radius.dart';

/// The edge from which a [SealSheet] slides in.
enum SealSheetSide {
  /// Sheet slides in from the top.
  top,

  /// Sheet slides in from the right.
  right,

  /// Sheet slides in from the bottom.
  bottom,

  /// Sheet slides in from the left.
  left
  ;

  ShadSheetSide toShadSide() => switch (this) {
    SealSheetSide.top => ShadSheetSide.top,
    SealSheetSide.right => ShadSheetSide.right,
    SealSheetSide.bottom => ShadSheetSide.bottom,
    SealSheetSide.left => ShadSheetSide.left,
  };
}

/// Shows a Seal-themed sheet sliding in from an edge.
///
/// [side] controls which edge the sheet slides from (defaults to bottom).
/// Returns the value passed to `Navigator.pop`.
///
/// ```dart
/// await showSealSheet(
///   context: context,
///   side: SealSheetSide.right,
///   builder: (context) => SealSheet(
///     title: const Text('Settings'),
///     child: const _SettingsContent(),
///   ),
/// );
/// ```
Future<T?> showSealSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  SealSheetSide side = SealSheetSide.bottom,
  bool isDismissible = true,
}) {
  return showShadSheet<T>(
    context: context,
    builder: (ctx) {
      final viewPadding = MediaQuery.viewPaddingOf(ctx);
      final edgePadding = switch (side) {
        SealSheetSide.bottom => EdgeInsets.only(bottom: viewPadding.bottom),
        SealSheetSide.top ||
        SealSheetSide.right ||
        SealSheetSide.left => EdgeInsets.only(top: viewPadding.top),
      };
      return _SealSheetEdgePadding(padding: edgePadding, child: builder(ctx));
    },
    side: side.toShadSide(),
    isDismissible: isDismissible,
  );
}

/// Injects safe-area edge padding into the nearest [SealSheet] descendant so
/// that the sheet background fills the screen edge while content stays clear
/// of system UI.
class _SealSheetEdgePadding extends InheritedWidget {
  const _SealSheetEdgePadding({
    required this.padding,
    required super.child,
  });

  final EdgeInsets padding;

  static EdgeInsets of(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<_SealSheetEdgePadding>()
          ?.padding ??
      EdgeInsets.zero;

  @override
  bool updateShouldNotify(_SealSheetEdgePadding old) => padding != old.padding;
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

    final edgePadding = _SealSheetEdgePadding.of(context);

    return ShadSheet(
      title: titleWidget,
      description: descriptionWidget,
      actions: actions,
      backgroundColor: colors.surface,
      radius: SealRadius.borderRadiusLg,
      padding: EdgeInsets.all(dimension.lg) + edgePadding,
      border: Border.all(color: colors.border),
      useSafeArea: false,
      scrollable: scrollable,
      draggable: draggable,
      child: child,
    );
  }
}
