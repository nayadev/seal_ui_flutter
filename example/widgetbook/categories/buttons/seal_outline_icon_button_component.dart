import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealOutlineIconButtonComponent extends WidgetbookComponent {
  SealOutlineIconButtonComponent()
    : super(
        name: 'SealOutlineIconButton',
        useCases: [
          WidgetbookUseCase(
            name: 'Primary',
            builder: (context) => SealOutlineIconButton.primary(
              icon: LucideIcons.share2,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Share',
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
            builder: (context) => SealOutlineIconButton.accent(
              icon: LucideIcons.bookmark,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Save',
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
            builder: (context) => SealOutlineIconButton.accentSecondary(
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
            name: 'Gradient',
            builder: (context) => SealOutlineIconButton.gradient(
              icon: LucideIcons.sparkles,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Magic',
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
            builder: (context) => SealOutlineIconButton.accentGradient(
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
            builder: (context) => SealOutlineIconButton.custom(
              icon: LucideIcons.triangleAlert,
              color: context.knobs.object.dropdown<Color>(
                label: 'Color',
                options: [
                  ColorX.red,
                  ColorX.teal,
                  ColorX.orange,
                  ColorX.indigo,
                  ColorX.pink,
                ],
                initialOption: ColorX.orange,
                labelBuilder: (v) => v.toString(),
              ),
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Warning',
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
