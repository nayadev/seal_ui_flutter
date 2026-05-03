import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealProgressComponent extends WidgetbookComponent {
  SealProgressComponent()
    : super(
        name: 'SealProgress',
        useCases: [
          WidgetbookUseCase(
            name: 'Determinate',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealProgress(
                value: context.knobs.double.slider(
                  label: 'Value',
                  initialValue: 0.6,
                  min: 0,
                  max: 1,
                ),
                useAccent: context.knobs.boolean(
                  label: 'Accent',
                  initialValue: false,
                ),
              ),
            ),
          ),
          WidgetbookUseCase(
            name: 'Indeterminate',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealProgress(
                useAccent: context.knobs.boolean(
                  label: 'Accent',
                  initialValue: false,
                ),
              ),
            ),
          ),
        ],
      );
}
