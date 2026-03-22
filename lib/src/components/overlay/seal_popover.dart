import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_dimension.dart';
import '../../tokens/base/seal_radius.dart';

/// Controls the open/closed state of a [SealPopover].
///
/// Call [show], [hide], or [toggle] to manage visibility.
///
/// ```dart
/// final controller = SealPopoverController();
///
/// SealPopover(
///   controller: controller,
///   popover: (context) => const Text('Content'),
///   child: SealFilledButton.primary(
///     label: const Text('Open'),
///     onPressed: controller.toggle,
///   ),
/// );
/// ```
class SealPopoverController extends ShadPopoverController {
  /// Creates a [SealPopoverController].
  ///
  /// Set [isOpen] to `true` to start with the popover already visible.
  SealPopoverController({super.isOpen});
}

/// A token-driven floating popover built on [ShadPopover].
///
/// Displays arbitrary content in a styled panel anchored next to [child].
/// Provide exactly one of [controller] or [visible] to manage visibility.
///
/// ## Controller-based (recommended)
///
/// ```dart
/// final controller = SealPopoverController();
///
/// SealPopover(
///   controller: controller,
///   popover: (context) => const Text('Popover content'),
///   child: SealFilledButton.primary(
///     label: const Text('Open'),
///     onPressed: controller.toggle,
///   ),
/// );
/// ```
///
/// ## Declarative (controlled externally)
///
/// ```dart
/// SealPopover(
///   visible: _isOpen,
///   popover: (context) => const Text('Popover content'),
///   child: const Text('Trigger'),
/// );
/// ```
class SealPopover extends StatelessWidget {
  /// Creates a [SealPopover].
  ///
  /// Exactly one of [controller] or [visible] must be provided.
  const SealPopover({
    super.key,
    required this.child,
    required this.popover,
    this.controller,
    this.visible,
    this.anchor,
    this.closeOnTapOutside = true,
  }) : assert(
         (controller != null) ^ (visible != null),
         'Provide either controller or visible, not both.',
       );

  /// The widget that triggers the popover (e.g. a button).
  final Widget child;

  /// Builds the content rendered inside the popover panel.
  final WidgetBuilder popover;

  /// Controls the popover's open/closed state programmatically.
  ///
  /// Mutually exclusive with [visible].
  final SealPopoverController? controller;

  /// Declarative visibility flag.
  ///
  /// Mutually exclusive with [controller].
  final bool? visible;

  /// The position of the popover panel relative to [child].
  ///
  /// Defaults to below the child with a 4 px gap, falling back above when
  /// there is not enough space below.
  final ShadAnchorBase? anchor;

  /// Whether tapping outside the popover dismisses it. Defaults to `true`.
  final bool closeOnTapOutside;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;
    final dimension = context.dimension;

    return ShadPopover(
      controller: controller,
      visible: visible,
      anchor: anchor,
      closeOnTapOutside: closeOnTapOutside,
      padding: EdgeInsets.symmetric(
        horizontal: dimension.md,
        vertical: dimension.sm,
      ),
      decoration: ShadDecoration(
        color: colors.surface,
        border: ShadBorder.all(
          color: colors.border,
          radius: SealRadius.borderRadiusMd,
        ),
      ),
      popover: popover,
      child: child,
    );
  }
}
