import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Default', type: SealDialog, path: '[Components]/Overlay')
Widget buildSealDialogDefault(BuildContext context) {
  return SealFilledButton.primary(
    label: const Text('Open Dialog'),
    onPressed: () => showSealDialog<void>(
      context: context,
      builder: (_) => SealDialog(
        title: Text(
          context.knobs.string(label: 'Title', initialValue: 'Edit profile'),
        ),
        description: Text(
          context.knobs.string(
            label: 'Description',
            initialValue: 'Make changes to your profile here.',
          ),
        ),
        actions: [
          SealOutlineButton.primary(
            label: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          SealFilledButton.primary(
            label: const Text('Save'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    ),
  );
}

@UseCase(name: 'Alert', type: SealDialog, path: '[Components]/Overlay')
Widget buildSealDialogAlert(BuildContext context) {
  return SealFilledButton.custom(
    label: const Text('Open Alert'),
    color: ColorX.red,
    onPressed: () => showSealDialog<void>(
      context: context,
      builder: (_) => SealDialog.alert(
        title: Text(
          context.knobs.string(
            label: 'Title',
            initialValue: 'Are you sure?',
          ),
        ),
        description: Text(
          context.knobs.string(
            label: 'Description',
            initialValue: 'This action cannot be undone.',
          ),
        ),
        actions: [
          SealOutlineButton.primary(
            label: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          SealFilledButton.custom(
            label: const Text('Delete'),
            color: ColorX.red,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    ),
  );
}
