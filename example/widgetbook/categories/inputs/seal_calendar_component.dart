import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealCalendarComponent extends WidgetbookComponent {
  SealCalendarComponent()
    : super(
        name: 'SealCalendar',
        useCases: [
          WidgetbookUseCase(
            name: 'Single',
            builder: (context) {
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
            },
          ),
          WidgetbookUseCase(
            name: 'Range',
            builder: (context) {
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
            },
          ),
          WidgetbookUseCase(
            name: 'Multiple',
            builder: (context) {
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
            },
          ),
        ],
      );
}
