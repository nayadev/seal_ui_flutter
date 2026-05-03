import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Default', type: SealSlider, path: '[Components]/Inputs')
Widget buildSealSliderDefault(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(context.dimension.lg),
    child: SealSlider(
      value: context.knobs.double.slider(
        label: 'Value',
        initialValue: 0.5,
        min: 0,
        max: 1,
      ),
      enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
      onChanged: (_) {},
    ),
  );
}

@UseCase(name: 'Stepped', type: SealSlider, path: '[Components]/Inputs')
Widget buildSealSliderStepped(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(context.dimension.lg),
    child: SealSlider(
      value: 50,
      min: 0,
      max: 100,
      divisions: context.knobs.double
          .slider(label: 'Divisions', initialValue: 10, min: 2, max: 20)
          .toInt(),
      onChanged: (_) {},
    ),
  );
}
