import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_dimension.dart';

/// A single tab entry for use with [SealTabs].
///
/// [label] is rendered in the tab bar; [content] is shown when selected.
///
/// ```dart
/// SealTab(
///   value: 'overview',
///   label: const Text('Overview'),
///   content: const _OverviewPanel(),
/// )
/// ```
class SealTab<T> {
  /// Creates a tab with a [value] identifier, a tab-bar [label], and panel
  /// [content].
  const SealTab({
    required this.value,
    required this.label,
    required this.content,
    this.enabled = true,
  });

  /// Unique identifier for this tab.
  final T value;

  /// Widget shown in the tab bar header.
  final Widget label;

  /// Widget shown as the panel when this tab is selected.
  final Widget content;

  /// Whether this tab can be selected.
  final bool enabled;
}

/// A styled tab container for the Seal UI design system, built on [ShadTabs].
///
/// Exactly one of [value] or [controller] must be provided.
///
/// ```dart
/// SealTabs<String>(
///   value: _selectedTab,
///   onChanged: (v) => setState(() => _selectedTab = v),
///   tabs: [
///     SealTab(
///       value: 'account',
///       label: const Text('Account'),
///       content: const _AccountPanel(),
///     ),
///     SealTab(
///       value: 'security',
///       label: const Text('Security'),
///       content: const _SecurityPanel(),
///     ),
///   ],
/// )
/// ```
class SealTabs<T> extends StatelessWidget {
  /// Creates Seal-styled tabs driven by an external [value].
  ///
  /// Mutually exclusive with [controller].
  const SealTabs({
    super.key,
    required this.tabs,
    T? value,
    this.onChanged,
    this.scrollable = false,
  }) : _value = value,
       _controller = null,
       assert(value != null, 'SealTabs requires value.');

  /// Creates Seal-styled tabs driven by a [ShadTabsController].
  ///
  /// Mutually exclusive with the default constructor's [value].
  const SealTabs.controlled({
    super.key,
    required this.tabs,
    required ShadTabsController<T> controller,
    this.onChanged,
    this.scrollable = false,
  }) : _value = null,
       _controller = controller;

  /// The tab definitions.
  final List<SealTab<T>> tabs;

  /// Called when the user selects a different tab.
  final ValueChanged<T>? onChanged;

  /// Whether the tab bar scrolls horizontally when tabs overflow.
  final bool scrollable;

  final T? _value;
  final ShadTabsController<T>? _controller;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;
    final dimension = context.dimension;

    final shadTabs = tabs.map((tab) {
      return ShadTab<T>(
        value: tab.value,
        enabled: tab.enabled,
        foregroundColor: colors.textSecondary,
        selectedForegroundColor: colors.textPrimary,
        textStyle: typo.small,
        content: tab.content,
        child: tab.label,
      );
    }).toList();

    if (_controller != null) {
      return ShadTabs<T>(
        controller: _controller,
        tabs: shadTabs,
        onChanged: onChanged,
        scrollable: scrollable,
        gap: dimension.md,
      );
    }

    return ShadTabs<T>(
      value: _value,
      tabs: shadTabs,
      onChanged: onChanged,
      scrollable: scrollable,
      gap: dimension.md,
    );
  }
}
