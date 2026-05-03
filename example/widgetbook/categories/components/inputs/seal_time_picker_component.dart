import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Default', type: SealTimePicker, path: '[Components]/Inputs')
Widget buildSealTimePickerDefault(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(context.dimension.lg),
    child: SealTimePicker(
      enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
      showSeconds: context.knobs.boolean(
        label: 'Show Seconds',
        initialValue: true,
      ),
      onChanged: (_) {},
    ),
  );
}

@UseCase(
  name: 'Period (AM/PM)',
  type: SealTimePicker,
  path: '[Components]/Inputs',
)
Widget buildSealTimePickerPeriodAmPm(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(context.dimension.lg),
    child: SealTimePicker.period(
      enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
      showSeconds: context.knobs.boolean(
        label: 'Show Seconds',
        initialValue: false,
      ),
      onChanged: (_) {},
    ),
  );
}
