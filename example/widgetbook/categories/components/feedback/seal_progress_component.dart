import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Determinate', type: SealProgress, path: '[Components]/Feedback')
Widget buildSealProgressDeterminate(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(context.dimension.lg),
    child: SealProgress(
      value: context.knobs.double.slider(
        label: 'Value',
        initialValue: 0.6,
        min: 0,
        max: 1,
      ),
      useAccent: context.knobs.boolean(label: 'Accent', initialValue: false),
    ),
  );
}

@UseCase(
  name: 'Indeterminate',
  type: SealProgress,
  path: '[Components]/Feedback',
)
Widget buildSealProgressIndeterminate(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(context.dimension.lg),
    child: SealProgress(
      useAccent: context.knobs.boolean(label: 'Accent', initialValue: false),
    ),
  );
}
