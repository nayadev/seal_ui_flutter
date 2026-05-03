import 'package:flutter/material.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealFilledButtonComponent extends WidgetbookComponent {
  SealFilledButtonComponent()
    : super(
        name: 'SealFilledButton',
        useCases: [
          WidgetbookUseCase(
            name: 'Primary',
            builder: (context) => SealFilledButton.primary(
              label: Text(
                context.knobs.string(
                  label: 'Label',
                  initialValue: 'Get Started',
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
            builder: (context) => SealFilledButton.accent(
              label: Text(
                context.knobs.string(
                  label: 'Label',
                  initialValue: 'Continue',
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
            builder: (context) => SealFilledButton.accentSecondary(
              label: Text(
                context.knobs.string(
                  label: 'Label',
                  initialValue: 'Confirm',
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
            builder: (context) => SealFilledButton.gradient(
              label: Text(
                context.knobs.string(
                  label: 'Label',
                  initialValue: 'Launch',
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
            builder: (context) => SealFilledButton.accentGradient(
              label: Text(
                context.knobs.string(
                  label: 'Label',
                  initialValue: 'Boost',
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
            builder: (context) => SealFilledButton.gradient(
              label: Text(
                context.knobs.string(
                  label: 'Label',
                  initialValue: 'Explore',
                ),
              ),
              icon: LucideIcons.rocket,
              onPressed: () {},
            ),
          ),
          WidgetbookUseCase(
            name: 'Custom',
            builder: (context) => SealFilledButton.custom(
              label: Text(
                context.knobs.string(
                  label: 'Label',
                  initialValue: 'Delete',
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
