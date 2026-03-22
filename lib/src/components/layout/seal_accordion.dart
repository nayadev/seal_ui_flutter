import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../theme/seal_theme_provider.dart';
import '../../tokens/base/seal_dimension.dart';

/// A single collapsible section within a [SealAccordion].
///
/// ```dart
/// SealAccordionItem(
///   value: 'faq-1',
///   title: const Text('What is Seal UI?'),
///   child: const Text('A token-driven Flutter design system.'),
/// )
/// ```
class SealAccordionItem<T> {
  /// Creates an accordion item with a [value] identifier, [title] header, and
  /// collapsible [child] content.
  const SealAccordionItem({
    required this.value,
    required this.title,
    required this.child,
  });

  /// Unique identifier for this item within the accordion.
  final T value;

  /// Widget shown in the always-visible header row.
  final Widget title;

  /// Widget shown when the item is expanded.
  final Widget child;
}

/// A styled accordion (collapsible sections) for the Seal UI design system,
/// built on [ShadAccordion].
///
/// By default only one item can be open at a time. Use [SealAccordion.multiple]
/// to allow several items open simultaneously.
///
/// ```dart
/// SealAccordion<String>(
///   items: [
///     SealAccordionItem(
///       value: 'section-1',
///       title: const Text('Getting started'),
///       child: const Text('Install the package and wrap your app.'),
///     ),
///     SealAccordionItem(
///       value: 'section-2',
///       title: const Text('Theming'),
///       child: const Text('Use SealThemeScope to inject design tokens.'),
///     ),
///   ],
/// )
/// ```
class SealAccordion<T> extends StatelessWidget {
  /// Creates a **single-open** accordion (at most one item expanded at a time).
  const SealAccordion({
    super.key,
    required this.items,
    this.initialValue,
  }) : _multiple = false,
       _initialValues = null;

  /// Creates a **multi-open** accordion (any number of items can be expanded
  /// simultaneously).
  const SealAccordion.multiple({
    super.key,
    required this.items,
    List<T>? initialValues,
  }) : _multiple = true,
       initialValue = null,
       _initialValues = initialValues;

  /// The accordion item definitions.
  final List<SealAccordionItem<T>> items;

  /// Initially expanded item for single-open mode.
  final T? initialValue;

  final bool _multiple;
  final List<T>? _initialValues;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;
    final dimension = context.dimension;

    final children = items.map((item) {
      return ShadAccordionItem<T>(
        value: item.value,
        title: DefaultTextStyle.merge(
          style: typo.small.copyWith(
            color: colors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
          child: item.title,
        ),
        padding: EdgeInsets.symmetric(vertical: dimension.md),
        child: Padding(
          padding: EdgeInsets.only(bottom: dimension.md),
          child: DefaultTextStyle.merge(
            style: typo.small.copyWith(color: colors.textSecondary),
            child: item.child,
          ),
        ),
      );
    }).toList();

    if (_multiple) {
      return ShadAccordion<T>.multiple(
        initialValue: _initialValues,
        children: children,
      );
    }

    return ShadAccordion<T>(
      initialValue: initialValue,
      children: children,
    );
  }
}
