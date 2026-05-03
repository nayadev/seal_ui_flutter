import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Variants', type: SealBadge, path: '[Layout]/Badges')
Widget buildSealBadgeVariants(BuildContext context) {
  return Wrap(
    spacing: context.dimension.sm,
    runSpacing: context.dimension.sm,
    children: [
      SealBadge.primary(
        child: Text(
          context.knobs.string(label: 'Label', initialValue: 'Primary'),
        ),
      ),
      const SealBadge.accent(child: Text('Accent')),
      const SealBadge.secondary(child: Text('Secondary')),
      const SealBadge.outline(child: Text('Outline')),
      const SealBadge.success(child: Text('Active')),
      const SealBadge.warning(child: Text('Pending')),
      const SealBadge.error(child: Text('Expired')),
    ],
  );
}

@UseCase(name: 'Interactive', type: SealBadge, path: '[Layout]/Badges')
Widget buildSealBadgeInteractive(BuildContext context) {
  return SealBadge.primary(
    child: Text(
      context.knobs.string(label: 'Label', initialValue: 'Clickable'),
    ),
    onPressed: () {},
  );
}
