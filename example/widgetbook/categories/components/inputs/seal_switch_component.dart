import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Default', type: SealSwitch, path: '[Components]/Inputs')
Widget buildSealSwitchDefault(BuildContext context) {
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  return SealSwitch(
    value: context.knobs.boolean(label: 'On', initialValue: false),
    enabled: enabled,
    onChanged: enabled ? (_) {} : null,
  );
}

@UseCase(name: 'With Label', type: SealSwitch, path: '[Components]/Inputs')
Widget buildSealSwitchWithLabel(BuildContext context) {
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  final showSublabel = context.knobs.boolean(
    label: 'Show Sublabel',
    initialValue: true,
  );
  return SealSwitch(
    value: context.knobs.boolean(label: 'On', initialValue: false),
    enabled: enabled,
    onChanged: enabled ? (_) {} : null,
    label: Text(
      context.knobs.string(
        label: 'Label',
        initialValue: 'Enable notifications',
      ),
    ),
    sublabel: showSublabel
        ? Text(
            context.knobs.string(
              label: 'Sublabel',
              initialValue: 'Receive push notifications.',
            ),
          )
        : null,
  );
}
