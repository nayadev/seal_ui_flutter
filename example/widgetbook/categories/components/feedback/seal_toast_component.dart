import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Info', type: SealToast, path: '[Components]/Feedback')
Widget buildSealToastInfo(BuildContext context) {
  final message = context.knobs.string(
    label: 'Message',
    initialValue: 'Something you should know.',
  );
  final title = context.knobs.string(label: 'Title', initialValue: 'Info');
  return SealFilledButton.primary(
    label: const Text('Show Info Toast'),
    onPressed: () => SealToast.info(
      message: Text(message),
      title: title.isEmpty ? null : Text(title),
    ).show(context),
  );
}

@UseCase(name: 'Success', type: SealToast, path: '[Components]/Feedback')
Widget buildSealToastSuccess(BuildContext context) {
  final message = context.knobs.string(
    label: 'Message',
    initialValue: 'Your changes have been saved.',
  );
  final title = context.knobs.string(label: 'Title', initialValue: 'Success');
  return SealFilledButton.accent(
    label: const Text('Show Success Toast'),
    onPressed: () => SealToast.success(
      message: Text(message),
      title: title.isEmpty ? null : Text(title),
    ).show(context),
  );
}

@UseCase(name: 'Warning', type: SealToast, path: '[Components]/Feedback')
Widget buildSealToastWarning(BuildContext context) {
  final message = context.knobs.string(
    label: 'Message',
    initialValue: 'This action might have side effects.',
  );
  final title = context.knobs.string(label: 'Title', initialValue: 'Warning');
  return SealFilledButton.primary(
    label: const Text('Show Warning Toast'),
    onPressed: () => SealToast.warning(
      message: Text(message),
      title: title.isEmpty ? null : Text(title),
    ).show(context),
  );
}

@UseCase(name: 'Error', type: SealToast, path: '[Components]/Feedback')
Widget buildSealToastError(BuildContext context) {
  final message = context.knobs.string(
    label: 'Message',
    initialValue: 'Something went wrong. Please try again.',
  );
  final title = context.knobs.string(label: 'Title', initialValue: 'Error');
  final showAction = context.knobs.boolean(
    label: 'Show Action',
    initialValue: false,
  );
  return SealFilledButton.primary(
    label: const Text('Show Error Toast'),
    onPressed: () => SealToast.error(
      message: Text(message),
      title: title.isEmpty ? null : Text(title),
      actionLabel: showAction ? const Text('Retry') : null,
      onAction: showAction ? () {} : null,
    ).show(context),
  );
}
