import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Single', type: SealDatePicker, path: '[Components]/Inputs')
Widget buildSealDatePickerSingle(BuildContext context) {
  DateTime? selected;
  return StatefulBuilder(
    builder: (ctx, setState) => Padding(
      padding: EdgeInsets.all(ctx.dimension.lg),
      child: SealDatePicker(
        selected: selected,
        placeholder: const Text('Pick a date'),
        allowDeselection: context.knobs.boolean(
          label: 'Allow Deselection',
          initialValue: true,
        ),
        enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
        onChanged: (date) => setState(() => selected = date),
      ),
    ),
  );
}

@UseCase(name: 'Range', type: SealDatePicker, path: '[Components]/Inputs')
Widget buildSealDatePickerRange(BuildContext context) {
  SealDateTimeRange? range;
  return StatefulBuilder(
    builder: (ctx, setState) => Padding(
      padding: EdgeInsets.all(ctx.dimension.lg),
      child: SealDatePicker.range(
        selected: range,
        placeholder: const Text('Pick a date range'),
        enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
        onChanged: (r) => setState(() => range = r),
      ),
    ),
  );
}
