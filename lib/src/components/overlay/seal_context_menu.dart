import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_radius.dart';

/// A controller for [SealContextMenuRegion] and [SealContextMenu].
///
/// Alias for [ShadContextMenuController] (which is itself a
/// [ShadPopoverController]).
typedef SealContextMenuController = ShadContextMenuController;

/// A token-driven context menu region built on [ShadContextMenuRegion].
///
/// Wrap any widget with [SealContextMenuRegion] to show a floating menu on
/// right-click (desktop) or long-press (mobile). Pass [SealContextMenuItem]
/// widgets as [items].
///
/// ```dart
/// SealContextMenuRegion(
///   items: [
///     SealContextMenuItem(
///       child: const Text('Copy'),
///       onPressed: () {},
///     ),
///     SealContextMenuItem(
///       child: const Text('Paste'),
///       onPressed: () {},
///     ),
///   ],
///   child: const Text('Right-click me'),
/// )
/// ```
class SealContextMenuRegion extends StatelessWidget {
  /// Creates a context-menu region that shows [items] on right-click or
  /// long-press.
  const SealContextMenuRegion({
    super.key,
    required this.child,
    required this.items,
    this.controller,
    this.visible,
  });

  /// The widget that triggers the context menu.
  final Widget child;

  /// Menu items shown in the context menu. Typically [SealContextMenuItem]s.
  final List<Widget> items;

  /// Optional controller to programmatically show or hide the menu.
  final SealContextMenuController? controller;

  /// When non-null, overrides the menu visibility programmatically.
  final bool? visible;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;

    return ShadContextMenuRegion(
      controller: controller,
      visible: visible,
      decoration: ShadDecoration(
        color: colors.surface,
        border: ShadBorder.all(
          color: colors.border,
          radius: SealRadius.borderRadiusMd,
        ),
      ),
      items: items,
      child: child,
    );
  }
}

/// A single item inside a [SealContextMenuRegion] or [SealContextMenu].
///
/// Supports optional [leading] and [trailing] slots, nested [items] for
/// submenus, and an [enabled] flag.
///
/// ```dart
/// SealContextMenuItem(
///   leading: const Icon(LucideIcons.copy, size: 14),
///   child: const Text('Copy'),
///   onPressed: () {},
/// )
/// ```
class SealContextMenuItem extends StatelessWidget {
  /// Creates a primary context menu item.
  const SealContextMenuItem({
    super.key,
    required this.child,
    this.onPressed,
    this.leading,
    this.trailing,
    this.items = const [],
    this.enabled = true,
    this.inset = false,
  });

  /// The label widget for this item.
  final Widget child;

  /// Callback fired when this item is tapped.
  final VoidCallback? onPressed;

  /// Optional widget displayed before the label (e.g. an icon).
  final Widget? leading;

  /// Optional widget displayed after the label (e.g. a shortcut hint).
  final Widget? trailing;

  /// Nested submenu items. When non-empty, hovering this item opens a submenu.
  final List<Widget> items;

  /// Whether this item is interactive. Defaults to `true`.
  final bool enabled;

  /// When `true`, adds extra leading padding to align with non-icon siblings.
  final bool inset;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;
    final typo = context.themeTokens.typography;

    final textStyle = typo.small.copyWith(color: colors.textPrimary);

    if (inset) {
      return ShadContextMenuItem.inset(
        onPressed: onPressed,
        leading: leading,
        trailing: trailing,
        items: items,
        enabled: enabled,
        textStyle: textStyle,
        selectedBackgroundColor: colors.surfaceAlt,
        child: child,
      );
    }

    return ShadContextMenuItem(
      onPressed: onPressed,
      leading: leading,
      trailing: trailing,
      items: items,
      enabled: enabled,
      textStyle: textStyle,
      selectedBackgroundColor: colors.surfaceAlt,
      child: child,
    );
  }
}
