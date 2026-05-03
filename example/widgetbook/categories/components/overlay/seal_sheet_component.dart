import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Bottom', type: SealSheet, path: '[Components]/Overlay')
Widget buildSealSheetBottom(BuildContext context) {
  return SealFilledButton.primary(
    label: const Text('Open Sheet'),
    onPressed: () => showSealSheet<void>(
      context: context,
      builder: (ctx) => SealSheet(
        title: Text(
          context.knobs.string(label: 'Title', initialValue: 'Filter'),
        ),
        description: Text(
          context.knobs.string(
            label: 'Description',
            initialValue: 'Narrow down your results.',
          ),
        ),
        actions: [
          SealOutlineButton.primary(
            label: const Text('Reset'),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
          SealFilledButton.primary(
            label: const Text('Apply'),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
        ],
      ),
    ),
  );
}

@UseCase(name: 'Right', type: SealSheet, path: '[Components]/Overlay')
Widget buildSealSheetRight(BuildContext context) {
  return SealFilledButton.primary(
    label: const Text('Open Right Sheet'),
    onPressed: () => showSealSheet<void>(
      context: context,
      side: SealSheetSide.right,
      builder: (ctx) => SealSheet(
        title: const Text('Settings'),
        description: const Text('Configure your preferences.'),
        actions: [
          SealFilledButton.primary(
            label: const Text('Done'),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
        ],
      ),
    ),
  );
}
