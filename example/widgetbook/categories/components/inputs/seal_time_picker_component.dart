import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealTimePickerComponent extends WidgetbookComponent {
  SealTimePickerComponent()
    : super(
        name: 'SealTimePicker',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealTimePicker(
                enabled: context.knobs.boolean(
                  label: 'Enabled',
                  initialValue: true,
                ),
                showSeconds: context.knobs.boolean(
                  label: 'Show Seconds',
                  initialValue: true,
                ),
                onChanged: (_) {},
              ),
            ),
          ),
          WidgetbookUseCase(
            name: 'Period (AM/PM)',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealTimePicker.period(
                enabled: context.knobs.boolean(
                  label: 'Enabled',
                  initialValue: true,
                ),
                showSeconds: context.knobs.boolean(
                  label: 'Show Seconds',
                  initialValue: false,
                ),
                onChanged: (_) {},
              ),
            ),
          ),
        ],
      );
}
