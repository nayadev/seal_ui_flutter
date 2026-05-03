import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealSliderComponent extends WidgetbookComponent {
  SealSliderComponent()
    : super(
        name: 'SealSlider',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealSlider(
                value: context.knobs.double.slider(
                  label: 'Value',
                  initialValue: 0.5,
                  min: 0,
                  max: 1,
                ),
                enabled: context.knobs.boolean(
                  label: 'Enabled',
                  initialValue: true,
                ),
                onChanged: (_) {},
              ),
            ),
          ),
          WidgetbookUseCase(
            name: 'Stepped',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealSlider(
                value: 50,
                min: 0,
                max: 100,
                divisions: context.knobs.double
                    .slider(
                      label: 'Divisions',
                      initialValue: 10,
                      min: 2,
                      max: 20,
                    )
                    .toInt(),
                onChanged: (_) {},
              ),
            ),
          ),
        ],
      );
}
