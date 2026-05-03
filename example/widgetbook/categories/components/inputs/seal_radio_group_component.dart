import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealRadioGroupComponent extends WidgetbookComponent {
  SealRadioGroupComponent()
    : super(
        name: 'SealRadioGroup',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) {
              final enabled = context.knobs.boolean(
                label: 'Enabled',
                initialValue: true,
              );
              return SealRadioGroup<String>(
                value: 'light',
                enabled: enabled,
                onChanged: enabled ? (_) {} : null,
                items: const [
                  SealRadioItem(value: 'light', label: Text('Light')),
                  SealRadioItem(value: 'dark', label: Text('Dark')),
                  SealRadioItem(value: 'system', label: Text('System')),
                ],
              );
            },
          ),
          WidgetbookUseCase(
            name: 'Horizontal',
            builder: (context) {
              final enabled = context.knobs.boolean(
                label: 'Enabled',
                initialValue: true,
              );
              return SealRadioGroup<String>(
                value: 'yes',
                axis: Axis.horizontal,
                enabled: enabled,
                onChanged: enabled ? (_) {} : null,
                items: const [
                  SealRadioItem(value: 'yes', label: Text('Yes')),
                  SealRadioItem(value: 'no', label: Text('No')),
                ],
              );
            },
          ),
        ],
      );
}
