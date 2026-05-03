import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealTextButtonComponent extends WidgetbookComponent {
  SealTextButtonComponent()
    : super(
        name: 'SealTextButton',
        useCases: [
          WidgetbookUseCase(
            name: 'Primary',
            builder: (context) => SealTextButton.primary(
              label: Text(
                context.knobs.string(
                  label: 'Label',
                  initialValue: 'Learn more',
                ),
              ),
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
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
            builder: (context) => SealTextButton.accent(
              label: Text(
                context.knobs.string(
                  label: 'Label',
                  initialValue: 'Details',
                ),
              ),
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
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
            builder: (context) => SealTextButton.accentSecondary(
              label: Text(
                context.knobs.string(
                  label: 'Label',
                  initialValue: 'Info',
                ),
              ),
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
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
            builder: (context) => SealTextButton.gradient(
              label: Text(
                context.knobs.string(
                  label: 'Label',
                  initialValue: 'Discover',
                ),
              ),
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
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
            builder: (context) => SealTextButton.accentGradient(
              label: Text(
                context.knobs.string(
                  label: 'Label',
                  initialValue: 'Explore',
                ),
              ),
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
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
            name: 'With Icon',
            builder: (context) => SealTextButton.primary(
              label: Text(
                context.knobs.string(
                  label: 'Label',
                  initialValue: 'Skip',
                ),
              ),
              icon: LucideIcons.arrowRight,
              onPressed: () {},
            ),
          ),
          WidgetbookUseCase(
            name: 'Custom',
            builder: (context) => SealTextButton.custom(
              label: Text(
                context.knobs.string(
                  label: 'Label',
                  initialValue: 'Retry',
                ),
              ),
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
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
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
