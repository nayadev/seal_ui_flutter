import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_radius.dart';

/// A controller for [SealMenubar].
///
/// Tracks which [SealMenubarItem] is currently open. Alias for
/// [ShadMenubarController].
typedef SealMenubarController = ShadMenubarController;

/// A token-driven horizontal menu bar built on [ShadMenubar].
///
/// Place [SealMenubarItem] children inside [items]. Each item renders a
/// button that opens a dropdown menu when tapped.
///
/// ```dart
/// SealMenubar(
///   items: [
///     SealMenubarItem(
///       child: const Text('File'),
///       items: [
///         SealContextMenuItem(child: const Text('New'), onPressed: () {}),
///         SealContextMenuItem(child: const Text('Open'), onPressed: () {}),
///       ],
///     ),
///   ],
/// )
/// ```
class SealMenubar extends StatelessWidget {
  /// Creates a token-styled menu bar.
  const SealMenubar({
    super.key,
    required this.items,
    this.controller,
  });

  /// The menu-bar trigger buttons. Typically [SealMenubarItem] widgets.
  final Iterable<Widget> items;

  /// Optional controller to manage the open state programmatically.
  final SealMenubarController? controller;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;

    return ShadMenubar(
      controller: controller,
      backgroundColor: colors.surface,
      border: ShadBorder.all(
        color: colors.border,
        radius: SealRadius.borderRadiusMd,
      ),
      radius: SealRadius.borderRadiusMd,
      items: items,
    );
  }
}

/// A single trigger item inside a [SealMenubar].
///
/// Displays a [child] button that opens a dropdown with the provided [items]
/// (typically [SealContextMenuItem] widgets).
///
/// ```dart
/// SealMenubarItem(
///   items: [
///     SealContextMenuItem(child: const Text('Save'), onPressed: () {}),
///   ],
///   child: const Text('File'),
/// )
/// ```
class SealMenubarItem extends StatelessWidget {
  /// Creates a menu-bar trigger item.
  const SealMenubarItem({
    super.key,
    required this.child,
    required this.items,
    this.enabled = true,
  });

  /// The button label shown in the menu bar.
  final Widget child;

  /// Dropdown items shown when this item is tapped. Typically
  /// [SealContextMenuItem] widgets.
  final List<Widget> items;

  /// Whether this item is interactive. Defaults to `true`.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;
    final typo = context.themeTokens.typography;

    return ShadMenubarItem(
      enabled: enabled,
      foregroundColor: colors.textPrimary,
      hoverBackgroundColor: colors.surfaceAlt,
      selectedBackgroundColor: colors.surfaceAlt,
      decoration: ShadDecoration(
        color: colors.surface,
        border: ShadBorder.all(
          color: colors.border,
          radius: SealRadius.borderRadiusMd,
        ),
      ),
      buttonDecoration: const ShadDecoration(),
      items: items,
      child: DefaultTextStyle.merge(
        style: typo.small.copyWith(color: colors.textPrimary),
        child: child,
      ),
    );
  }
}
