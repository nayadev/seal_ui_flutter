import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(
  name: 'Default',
  type: SealContextMenuRegion,
  path: '[Components]/Overlay',
)
Widget buildSealContextMenuDefault(BuildContext context) {
  final colors = context.themeTokens.colors;
  final typo = context.themeTokens.typography;
  final dimension = context.dimension;
  return Padding(
    padding: EdgeInsets.all(dimension.lg),
    child: SealContextMenuRegion(
      items: [
        SealContextMenuItem(
          leading: const Icon(LucideIcons.copy, size: 14),
          child: const Text('Copy'),
          onPressed: () {},
        ),
        SealContextMenuItem(
          leading: const Icon(LucideIcons.clipboard, size: 14),
          child: const Text('Paste'),
          onPressed: () {},
        ),
        SealContextMenuItem(
          leading: const Icon(LucideIcons.trash2, size: 14),
          enabled: context.knobs.boolean(
            label: 'Third item enabled',
            initialValue: true,
          ),
          onPressed: () {},
          child: Text(
            context.knobs.string(label: 'Third item', initialValue: 'Delete'),
          ),
        ),
      ],
      child: SealContainer(
        child: Padding(
          padding: EdgeInsets.all(dimension.md),
          child: Text(
            'Right-click or long-press here',
            style: typo.small.copyWith(color: colors.textSecondary),
          ),
        ),
      ),
    ),
  );
}

@UseCase(
  name: 'With Submenu',
  type: SealContextMenuRegion,
  path: '[Components]/Overlay',
)
Widget buildSealContextMenuWithSubmenu(BuildContext context) {
  final dimension = context.dimension;
  return Padding(
    padding: EdgeInsets.all(dimension.lg),
    child: SealContextMenuRegion(
      items: [
        SealContextMenuItem(
          items: [
            SealContextMenuItem(child: const Text('Cut'), onPressed: () {}),
            SealContextMenuItem(child: const Text('Copy'), onPressed: () {}),
            SealContextMenuItem(child: const Text('Paste'), onPressed: () {}),
          ],
          child: const Text('Edit'),
        ),
        SealContextMenuItem(child: const Text('Delete'), onPressed: () {}),
      ],
      child: SealContainer(
        child: Padding(
          padding: EdgeInsets.all(dimension.md),
          child: const Text('Right-click for submenu'),
        ),
      ),
    ),
  );
}
