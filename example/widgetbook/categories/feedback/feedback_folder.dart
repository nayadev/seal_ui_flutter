import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class FeedbackFolder extends WidgetbookFolder {
  FeedbackFolder()
    : super(
        name: 'Feedback',
        children: [
          WidgetbookComponent(
            name: 'SealAlert',
            useCases: [
              WidgetbookUseCase(
                name: 'Info',
                builder: (context) {
                  final title = context.knobs.string(
                    label: 'Title',
                    initialValue: 'Heads up!',
                  );
                  final description = context.knobs.string(
                    label: 'Description',
                    initialValue: 'You can add components using the CLI.',
                  );
                  return SealAlert.info(
                    title: title.isEmpty ? null : title,
                    description: description,
                  );
                },
              ),
              WidgetbookUseCase(
                name: 'Success',
                builder: (context) {
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
                },
              ),
              WidgetbookUseCase(
                name: 'Warning',
                builder: (context) {
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
                },
              ),
              WidgetbookUseCase(
                name: 'Error',
                builder: (context) {
                  final title = context.knobs.string(
                    label: 'Title',
                    initialValue: 'Upload failed',
                  );
                  final description = context.knobs.string(
                    label: 'Description',
                    initialValue:
                        'The file could not be uploaded. Please try again.',
                  );
                  return SealAlert.error(
                    title: title.isEmpty ? null : title,
                    description: description,
                  );
                },
              ),
            ],
          ),
          WidgetbookComponent(
            name: 'SealLoader',
            useCases: [
              WidgetbookUseCase(
                name: 'Default',
                builder: (context) {
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
                  return SealLoader(
                    size: size,
                    label: showLabel ? 'Loading…' : null,
                  );
                },
              ),
            ],
          ),
          WidgetbookComponent(
            name: 'SealProgress',
            useCases: [
              WidgetbookUseCase(
                name: 'Determinate',
                builder: (context) => Padding(
                  padding: EdgeInsets.all(context.dimension.lg),
                  child: SealProgress(
                    value: context.knobs.double.slider(
                      label: 'Value',
                      initialValue: 0.6,
                      min: 0,
                      max: 1,
                    ),
                    useAccent: context.knobs.boolean(
                      label: 'Accent',
                      initialValue: false,
                    ),
                  ),
                ),
              ),
              WidgetbookUseCase(
                name: 'Indeterminate',
                builder: (context) => Padding(
                  padding: EdgeInsets.all(context.dimension.lg),
                  child: SealProgress(
                    useAccent: context.knobs.boolean(
                      label: 'Accent',
                      initialValue: false,
                    ),
                  ),
                ),
              ),
            ],
          ),
          WidgetbookComponent(
            name: 'SealToast',
            useCases: [
              WidgetbookUseCase(
                name: 'Info',
                builder: (context) {
                  final message = context.knobs.string(
                    label: 'Message',
                    initialValue: 'Something you should know.',
                  );
                  final title = context.knobs.string(
                    label: 'Title',
                    initialValue: 'Info',
                  );
                  return SealFilledButton.primary(
                    label: const Text('Show Info Toast'),
                    onPressed: () => SealToast.info(
                      message: Text(message),
                      title: title.isEmpty ? null : Text(title),
                    ).show(context),
                  );
                },
              ),
              WidgetbookUseCase(
                name: 'Success',
                builder: (context) {
                  final message = context.knobs.string(
                    label: 'Message',
                    initialValue: 'Your changes have been saved.',
                  );
                  final title = context.knobs.string(
                    label: 'Title',
                    initialValue: 'Success',
                  );
                  return SealFilledButton.accent(
                    label: const Text('Show Success Toast'),
                    onPressed: () => SealToast.success(
                      message: Text(message),
                      title: title.isEmpty ? null : Text(title),
                    ).show(context),
                  );
                },
              ),
              WidgetbookUseCase(
                name: 'Warning',
                builder: (context) {
                  final message = context.knobs.string(
                    label: 'Message',
                    initialValue: 'This action might have side effects.',
                  );
                  final title = context.knobs.string(
                    label: 'Title',
                    initialValue: 'Warning',
                  );
                  return SealFilledButton.primary(
                    label: const Text('Show Warning Toast'),
                    onPressed: () => SealToast.warning(
                      message: Text(message),
                      title: title.isEmpty ? null : Text(title),
                    ).show(context),
                  );
                },
              ),
              WidgetbookUseCase(
                name: 'Error',
                builder: (context) {
                  final message = context.knobs.string(
                    label: 'Message',
                    initialValue: 'Something went wrong. Please try again.',
                  );
                  final title = context.knobs.string(
                    label: 'Title',
                    initialValue: 'Error',
                  );
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
                },
              ),
            ],
          ),
        ],
      );
}
