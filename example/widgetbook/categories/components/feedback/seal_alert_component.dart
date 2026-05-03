import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Info', type: SealAlert, path: '[Components]/Feedback')
Widget buildSealAlertInfo(BuildContext context) {
  final title = context.knobs.string(label: 'Title', initialValue: 'Heads up!');
  final description = context.knobs.string(
    label: 'Description',
    initialValue: 'You can add components using the CLI.',
  );
  return SealAlert.info(
    title: title.isEmpty ? null : title,
    description: description,
  );
}

@UseCase(name: 'Success', type: SealAlert, path: '[Components]/Feedback')
Widget buildSealAlertSuccess(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Profile updated',
  );
  final description = context.knobs.string(
    label: 'Description',
    initialValue: 'Your changes have been saved successfully.',
  );
  return SealAlert.success(
    title: title.isEmpty ? null : title,
    description: description,
  );
}

@UseCase(name: 'Warning', type: SealAlert, path: '[Components]/Feedback')
Widget buildSealAlertWarning(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Low storage',
  );
  final description = context.knobs.string(
    label: 'Description',
    initialValue: 'You have less than 1 GB remaining.',
  );
  return SealAlert.warning(
    title: title.isEmpty ? null : title,
    description: description,
  );
}

@UseCase(name: 'Error', type: SealAlert, path: '[Components]/Feedback')
Widget buildSealAlertError(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Upload failed',
  );
  final description = context.knobs.string(
    label: 'Description',
    initialValue: 'The file could not be uploaded. Please try again.',
  );
  return SealAlert.error(
    title: title.isEmpty ? null : title,
    description: description,
  );
}
