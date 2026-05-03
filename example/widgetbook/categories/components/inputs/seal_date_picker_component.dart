import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealDatePickerComponent extends WidgetbookComponent {
  SealDatePickerComponent()
    : super(
        name: 'SealDatePicker',
        useCases: [
          WidgetbookUseCase(
            name: 'Single',
            builder: (context) {
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
                    enabled: context.knobs.boolean(
                      label: 'Enabled',
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
                  child: SealDatePicker.range(
                    selected: range,
                    placeholder: const Text('Pick a date range'),
                    enabled: context.knobs.boolean(
                      label: 'Enabled',
                      initialValue: true,
                    ),
                    onChanged: (r) => setState(() => range = r),
                  ),
                ),
              );
            },
          ),
        ],
      );
}
