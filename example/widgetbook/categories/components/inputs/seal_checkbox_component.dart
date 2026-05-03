import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Default', type: SealCheckbox, path: '[Components]/Inputs')
Widget buildSealCheckboxDefault(BuildContext context) {
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  return SealCheckbox(
    value: context.knobs.boolean(label: 'Checked', initialValue: false),
    enabled: enabled,
    onChanged: enabled ? (_) {} : null,
  );
}

@UseCase(name: 'With Label', type: SealCheckbox, path: '[Components]/Inputs')
Widget buildSealCheckboxWithLabel(BuildContext context) {
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  final showSublabel = context.knobs.boolean(
    label: 'Show Sublabel',
    initialValue: true,
  );
  return SealCheckbox(
    value: context.knobs.boolean(label: 'Checked', initialValue: false),
    enabled: enabled,
    onChanged: enabled ? (_) {} : null,
    label: Text(
      context.knobs.string(
        label: 'Label',
        initialValue: 'Accept terms and conditions',
      ),
    ),
    sublabel: showSublabel
        ? Text(
            context.knobs.string(
              label: 'Sublabel',
              initialValue: 'You agree to our Terms of Service.',
            ),
          )
        : null,
  );
}
