import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_radius.dart';

/// A controller for [SealResizablePanelGroup].
///
/// Alias for [ShadResizableController].
typedef SealResizableController = ShadResizableController;

/// A token-driven resizable panel group built on [ShadResizablePanelGroup].
///
/// Wrap two or more [SealResizablePanel] children to create a drag-to-resize
/// layout. Panels express their size as a proportion (0–1) of the total
/// available space.
///
/// ```dart
/// SealResizablePanelGroup(
///   children: [
///     SealResizablePanel(
///       id: 'left',
///       defaultSize: 0.5,
///       child: const Text('Left'),
///     ),
///     SealResizablePanel(
///       id: 'right',
///       defaultSize: 0.5,
///       child: const Text('Right'),
///     ),
///   ],
/// )
/// ```
class SealResizablePanelGroup extends StatelessWidget {
  /// Creates a horizontal resizable panel group.
  const SealResizablePanelGroup({
    super.key,
    required this.children,
    this.axis = Axis.horizontal,
    this.controller,
    this.showHandle,
    this.resetOnDoubleTap,
  });

  /// The resizable panels. Must contain at least two [SealResizablePanel]s.
  final List<SealResizablePanel> children;

  /// Orientation of the panel group. Defaults to [Axis.horizontal].
  final Axis axis;

  /// Optional controller for programmatic resize operations.
  final SealResizableController? controller;

  /// Whether to show the drag handle icon between panels.
  final bool? showHandle;

  /// Whether double-tapping the divider resets adjacent panels to their
  /// default sizes. Defaults to `true` in shadcn_ui.
  final bool? resetOnDoubleTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;

    return ShadResizablePanelGroup(
      axis: axis,
      controller: controller,
      showHandle: showHandle,
      resetOnDoubleTap: resetOnDoubleTap,
      dividerColor: colors.border,
      handleDecoration: ShadDecoration(
        color: colors.surface,
        border: ShadBorder.all(
          color: colors.border,
          radius: SealRadius.borderRadiusMd,
        ),
      ),
      children: children,
    );
  }
}

/// A single panel inside a [SealResizablePanelGroup].
///
/// [defaultSize] is a proportion in the range 0–1 representing the initial
/// share of available space.
///
/// ```dart
/// SealResizablePanel(
///   id: 'sidebar',
///   defaultSize: 0.3,
///   minSize: 0.2,
///   maxSize: 0.5,
///   child: const Text('Sidebar'),
/// )
/// ```
class SealResizablePanel extends ShadResizablePanel {
  /// Creates a resizable panel.
  const SealResizablePanel({
    super.key,
    required super.id,
    required super.defaultSize,
    required super.child,
    super.minSize = 0.0,
    super.maxSize = 1.0,
  });
}
