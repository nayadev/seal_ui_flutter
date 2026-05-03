import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Default', type: SealTextarea, path: '[Components]/Inputs')
Widget buildSealTextareaDefault(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(context.dimension.lg),
    child: SealTextarea(
      hint: context.knobs.string(
        label: 'Hint',
        initialValue: 'Enter a description…',
      ),
      enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
      resizable: context.knobs.boolean(label: 'Resizable', initialValue: true),
    ),
  );
}

@UseCase(name: 'With Label', type: SealTextarea, path: '[Components]/Inputs')
Widget buildSealTextareaWithLabel(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(context.dimension.lg),
    child: SealTextarea(
      label: context.knobs.string(label: 'Label', initialValue: 'Message'),
      hint: context.knobs.string(
        label: 'Hint',
        initialValue: 'Type your message here…',
      ),
      enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
    ),
  );
}
