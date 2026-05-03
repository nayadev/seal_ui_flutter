import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Default', type: SealRadioGroup, path: '[Components]/Inputs')
Widget buildSealRadioGroupDefault(BuildContext context) {
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
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
}

@UseCase(name: 'Horizontal', type: SealRadioGroup, path: '[Components]/Inputs')
Widget buildSealRadioGroupHorizontal(BuildContext context) {
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
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
}
