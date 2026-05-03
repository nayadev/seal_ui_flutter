import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealBadgeComponent extends WidgetbookComponent {
  SealBadgeComponent()
    : super(
        name: 'SealBadge',
        useCases: [
          WidgetbookUseCase(
            name: 'Variants',
            builder: (context) => Wrap(
              spacing: context.dimension.sm,
              runSpacing: context.dimension.sm,
              children: [
                SealBadge.primary(
                  child: Text(
                    context.knobs.string(
                      label: 'Label',
                      initialValue: 'Primary',
                    ),
                  ),
                ),
                const SealBadge.accent(child: Text('Accent')),
                const SealBadge.secondary(child: Text('Secondary')),
                const SealBadge.outline(child: Text('Outline')),
                const SealBadge.success(child: Text('Active')),
                const SealBadge.warning(child: Text('Pending')),
                const SealBadge.error(child: Text('Expired')),
              ],
            ),
          ),
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) => SealBadge.primary(
              child: Text(
                context.knobs.string(
                  label: 'Label',
                  initialValue: 'Clickable',
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      );
}
