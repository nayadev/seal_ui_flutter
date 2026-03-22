import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_dimension.dart';
import '../../tokens/base/seal_radius.dart';

// Default icon sizes mirroring the shadcn_ui defaults.
const double _kSeparatorSize = 14.0;
const double _kEllipsisSize = 16.0;

/// A token-driven breadcrumb navigation built on [ShadBreadcrumb].
///
/// Renders a row of [children] separated by [SealBreadcrumbSeparator]
/// icons. The last child is styled with [ColorPalette.textPrimary]; all other
/// children use [ColorPalette.textSecondary].
///
/// Typically composed with [SealBreadcrumbLink] for interactive items:
///
/// ```dart
/// SealBreadcrumb(
///   children: [
///     SealBreadcrumbLink(
///       onPressed: () => Navigator.pop(context),
///       child: const Text('Home'),
///     ),
///     SealBreadcrumbLink(
///       onPressed: () {},
///       child: const Text('Settings'),
///     ),
///     const Text('Profile'),
///   ],
/// )
/// ```
class SealBreadcrumb extends StatelessWidget {
  /// Creates a [SealBreadcrumb].
  const SealBreadcrumb({
    super.key,
    required this.children,
    this.separator,
  });

  /// The breadcrumb items. The last item receives the active text colour.
  final List<Widget> children;

  /// Custom separator widget. Defaults to [SealBreadcrumbSeparator].
  final Widget? separator;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;
    final typo = context.themeTokens.typography;
    final dimension = context.dimension;

    return ShadBreadcrumb(
      separator: separator ?? const SealBreadcrumbSeparator(),
      spacing: dimension.sm,
      textStyle: typo.small.copyWith(color: colors.textSecondary),
      lastItemTextColor: colors.textPrimary,
      children: children,
    );
  }
}

/// A clickable breadcrumb item built on [ShadBreadcrumbLink].
///
/// Applies [ColorPalette.textSecondary] at rest and [ColorPalette.textPrimary]
/// on hover.
///
/// ```dart
/// SealBreadcrumbLink(
///   onPressed: () => Navigator.pop(context),
///   child: const Text('Home'),
/// )
/// ```
class SealBreadcrumbLink extends StatelessWidget {
  /// Creates a [SealBreadcrumbLink].
  const SealBreadcrumbLink({
    super.key,
    required this.child,
    this.onPressed,
  });

  /// The content of the link (typically a [Text]).
  final Widget child;

  /// Called when the link is tapped.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;
    final typo = context.themeTokens.typography;

    return ShadBreadcrumbLink(
      onPressed: onPressed,
      normalColor: colors.textSecondary,
      hoverColor: colors.textPrimary,
      textStyle: typo.small,
      child: child,
    );
  }
}

/// The separator icon placed between breadcrumb items.
///
/// Renders a chevron-right icon in [ColorPalette.textSecondary].
///
/// ```dart
/// SealBreadcrumb(
///   separator: SealBreadcrumbSeparator(),
///   children: [...],
/// )
/// ```
class SealBreadcrumbSeparator extends StatelessWidget {
  /// Creates a [SealBreadcrumbSeparator].
  const SealBreadcrumbSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;

    return ShadBreadcrumbSeparator(
      color: colors.textSecondary,
      size: context.dimension.scaled(_kSeparatorSize),
    );
  }
}

/// An ellipsis indicator for collapsed breadcrumb levels.
///
/// Typically used as the trigger for a [SealBreadcrumbDropdown] to show
/// hidden navigation levels.
///
/// ```dart
/// SealBreadcrumbDropdown(
///   child: const SealBreadcrumbEllipsis(),
///   items: [...],
/// )
/// ```
class SealBreadcrumbEllipsis extends StatelessWidget {
  /// Creates a [SealBreadcrumbEllipsis].
  const SealBreadcrumbEllipsis({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadBreadcrumbEllipsis(
      size: context.dimension.scaled(_kEllipsisSize),
    );
  }
}

/// A dropdown that reveals hidden breadcrumb levels via a [SealPopover].
///
/// Wrap the trigger (e.g. [SealBreadcrumbEllipsis]) in [child] and supply
/// the hidden items as [SealBreadcrumbDropMenuItem] widgets.
///
/// ```dart
/// SealBreadcrumbDropdown(
///   child: const SealBreadcrumbEllipsis(),
///   items: [
///     SealBreadcrumbDropMenuItem(
///       onPressed: () {},
///       child: const Text('Documentation'),
///     ),
///     SealBreadcrumbDropMenuItem(
///       onPressed: () {},
///       child: const Text('Themes'),
///     ),
///   ],
/// )
/// ```
class SealBreadcrumbDropdown extends StatefulWidget {
  /// Creates a [SealBreadcrumbDropdown].
  const SealBreadcrumbDropdown({
    super.key,
    required this.child,
    required this.items,
  });

  /// The trigger widget (usually [SealBreadcrumbEllipsis]).
  final Widget child;

  /// The items shown in the dropdown. Prefer [SealBreadcrumbDropMenuItem].
  final List<Widget> items;

  @override
  State<SealBreadcrumbDropdown> createState() => _SealBreadcrumbDropdownState();
}

class _SealBreadcrumbDropdownState extends State<SealBreadcrumbDropdown> {
  final _controller = ShadPopoverController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;
    final dimension = context.dimension;

    return ShadPopover(
      controller: _controller,
      anchor: const ShadAnchorAuto(
        offset: Offset(0, 4),
        targetAnchor: AlignmentDirectional.bottomStart,
        followerAnchor: AlignmentDirectional.topStart,
      ),
      padding: EdgeInsets.all(dimension.xxs),
      decoration: ShadDecoration(
        color: colors.surface,
        border: ShadBorder.all(color: colors.border, radius: SealRadius.borderRadiusMd),
      ),
      popover: (_) => IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: widget.items,
        ),
      ),
      child: SealBreadcrumbLink(
        onPressed: _controller.toggle,
        child: widget.child,
      ),
    );
  }
}

/// A single item inside a [SealBreadcrumbDropdown].
///
/// ```dart
/// SealBreadcrumbDropMenuItem(
///   onPressed: () => Navigator.pushNamed(context, '/docs'),
///   child: const Text('Documentation'),
/// )
/// ```
class SealBreadcrumbDropMenuItem extends StatelessWidget {
  /// Creates a [SealBreadcrumbDropMenuItem].
  const SealBreadcrumbDropMenuItem({
    super.key,
    required this.child,
    this.onPressed,
  });

  /// The content of the menu item (typically a [Text]).
  final Widget child;

  /// Called when the item is tapped.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;
    final typo = context.themeTokens.typography;
    final dimension = context.dimension;

    return ShadBreadcrumbDropMenuItem(
      onPressed: onPressed,
      textStyle: typo.small.copyWith(color: colors.textPrimary),
      itemPadding: EdgeInsets.symmetric(
        horizontal: dimension.md,
        vertical: dimension.xs,
      ),
      child: child,
    );
  }
}
