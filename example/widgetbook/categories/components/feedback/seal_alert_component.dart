import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealAlertComponent extends WidgetbookComponent {
  SealAlertComponent()
    : super(
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
      );
}
