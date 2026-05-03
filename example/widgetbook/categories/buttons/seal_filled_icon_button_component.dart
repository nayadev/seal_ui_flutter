import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealFilledIconButtonComponent extends WidgetbookComponent {
  SealFilledIconButtonComponent()
    : super(
        name: 'SealFilledIconButton',
        useCases: [
          WidgetbookUseCase(
            name: 'Primary',
            builder: (context) => SealFilledIconButton.primary(
              icon: LucideIcons.plus,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Add item',
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
            builder: (context) => SealFilledIconButton.accent(
              icon: LucideIcons.star,
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
          WidgetbookUseCase(
            name: 'Accent Secondary',
            builder: (context) => SealFilledIconButton.accentSecondary(
              icon: LucideIcons.pencil,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Edit',
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
            builder: (context) => SealFilledIconButton.gradient(
              icon: LucideIcons.rocket,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Launch',
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
            builder: (context) => SealFilledIconButton.accentGradient(
              icon: LucideIcons.zap,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Boost',
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
            builder: (context) => SealFilledIconButton.custom(
              icon: LucideIcons.trash2,
              color: context.knobs.object.dropdown<Color>(
                label: 'Color',
                options: [
                  ColorX.red,
                  ColorX.teal,
                  ColorX.orange,
                  ColorX.indigo,
                  ColorX.pink,
                ],
                initialOption: ColorX.red,
                labelBuilder: (v) => v.toString(),
              ),
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Delete',
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
