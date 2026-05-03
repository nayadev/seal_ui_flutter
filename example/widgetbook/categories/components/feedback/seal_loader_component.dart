import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Default', type: SealLoader, path: '[Components]/Feedback')
Widget buildSealLoaderDefault(BuildContext context) {
  final size = context.knobs.object.dropdown<SealLoaderSize>(
    label: 'Size',
    options: SealLoaderSize.values,
    initialOption: SealLoaderSize.medium,
    labelBuilder: (s) => s.name,
  );
  final showLabel = context.knobs.boolean(
    label: 'Show Label',
    initialValue: false,
  );
  return SealLoader(size: size, label: showLabel ? 'Loading…' : null);
}
