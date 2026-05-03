import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealOutlineButtonComponent extends WidgetbookComponent {
  SealOutlineButtonComponent()
    : super(
        name: 'SealOutlineButton',
        useCases: [
          WidgetbookUseCase(
            name: 'Primary',
            builder: (context) => SealOutlineButton.primary(
              label: Text(
                context.knobs.string(
                  label: 'Label',
                  initialValue: 'Cancel',
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
            builder: (context) => SealOutlineButton.accent(
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
            builder: (context) => SealOutlineButton.accentSecondary(
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
            builder: (context) => SealOutlineButton.gradient(
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
            name: 'Accent Gradient',
            builder: (context) => SealOutlineButton.accentGradient(
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
            name: 'With Icon',
            builder: (context) => SealOutlineButton.primary(
              label: Text(
                context.knobs.string(
                  label: 'Label',
                  initialValue: 'Favorite',
                ),
              ),
              icon: LucideIcons.star,
              onPressed: () {},
            ),
          ),
          WidgetbookUseCase(
            name: 'Custom',
            builder: (context) => SealOutlineButton.custom(
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
