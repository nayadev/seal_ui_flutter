import 'package:seal_ui/seal_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetbook/widgetbook.dart';

class SealIconButtonComponent extends WidgetbookComponent {
  SealIconButtonComponent()
    : super(
        name: 'SealIconButton',

        useCases: [
          WidgetbookUseCase(
            name: 'Primary',
            builder: (context) => SealIconButton.primary(
              icon: LucideIcons.x,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Close',
              ),
              onPressed:
                  context.knobs.boolean(
                    label: 'Enabled',
                    initialValue: true,
                  )
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Accent',
            builder: (context) => SealIconButton.accent(
              icon: LucideIcons.ellipsisVertical,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'More',
              ),
              onPressed:
                  context.knobs.boolean(
                    label: 'Enabled',
                    initialValue: true,
                  )
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Accent Secondary',
            builder: (context) => SealIconButton.accentSecondary(
              icon: LucideIcons.info,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Info',
              ),
              onPressed:
                  context.knobs.boolean(
                    label: 'Enabled',
                    initialValue: true,
                  )
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Gradient',
            builder: (context) => SealIconButton.gradient(
              icon: LucideIcons.slidersHorizontal,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Filter',
              ),
              onPressed:
                  context.knobs.boolean(
                    label: 'Enabled',
                    initialValue: true,
                  )
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Accent Gradient',
            builder: (context) => SealIconButton.accentGradient(
              icon: LucideIcons.search,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Search',
              ),
              onPressed:
                  context.knobs.boolean(
                    label: 'Enabled',
                    initialValue: true,
                  )
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Custom',
            builder: (context) => SealIconButton.custom(
              icon: LucideIcons.star,
              color: context.knobs.object.dropdown<Color>(
                label: 'Color',
                options: [
                  ColorX.red,
                  ColorX.teal,
                  ColorX.orange,
                  ColorX.indigo,
                  ColorX.pink,
                ],
                initialOption: ColorX.teal,
                labelBuilder: (v) => v.toString(),
              ),
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Favorite',
              ),
              onPressed:
                  context.knobs.boolean(
                    label: 'Enabled',
                    initialValue: true,
                  )
                  ? () {}
                  : null,
            ),
          ),
        ],
      );
}
