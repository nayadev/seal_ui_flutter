import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Single', type: SealCalendar, path: '[Components]/Inputs')
Widget buildSealCalendarSingle(BuildContext context) {
  DateTime? selected;
  return StatefulBuilder(
    builder: (ctx, setState) => Padding(
      padding: EdgeInsets.all(ctx.dimension.lg),
      child: SealCalendar(
        selected: selected,
        allowDeselection: context.knobs.boolean(
          label: 'Allow Deselection',
          initialValue: true,
        ),
        onChanged: (date) => setState(() => selected = date),
      ),
    ),
  );
}

@UseCase(name: 'Range', type: SealCalendar, path: '[Components]/Inputs')
Widget buildSealCalendarRange(BuildContext context) {
  SealDateTimeRange? range;
  return StatefulBuilder(
    builder: (ctx, setState) => Padding(
      padding: EdgeInsets.all(ctx.dimension.lg),
      child: SealCalendar.range(
        selected: range,
        onChanged: (r) => setState(() => range = r),
      ),
    ),
  );
}

@UseCase(name: 'Multiple', type: SealCalendar, path: '[Components]/Inputs')
Widget buildSealCalendarMultiple(BuildContext context) {
  var selected = <DateTime>[];
  return StatefulBuilder(
    builder: (ctx, setState) => Padding(
      padding: EdgeInsets.all(ctx.dimension.lg),
      child: SealCalendar.multiple(
        selected: selected,
        onChanged: (dates) => setState(() => selected = dates),
      ),
    ),
  );
}
