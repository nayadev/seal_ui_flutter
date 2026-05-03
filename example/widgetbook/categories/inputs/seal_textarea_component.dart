import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealTextareaComponent extends WidgetbookComponent {
  SealTextareaComponent()
    : super(
        name: 'SealTextarea',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealTextarea(
                hint: context.knobs.string(
                  label: 'Hint',
                  initialValue: 'Enter a description…',
                ),
                enabled: context.knobs.boolean(
                  label: 'Enabled',
                  initialValue: true,
                ),
                resizable: context.knobs.boolean(
                  label: 'Resizable',
                  initialValue: true,
                ),
              ),
            ),
          ),
          WidgetbookUseCase(
            name: 'With Label',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealTextarea(
                label: context.knobs.string(
                  label: 'Label',
                  initialValue: 'Message',
                ),
                hint: context.knobs.string(
                  label: 'Hint',
                  initialValue: 'Type your message here…',
                ),
                enabled: context.knobs.boolean(
                  label: 'Enabled',
                  initialValue: true,
                ),
              ),
            ),
          ),
        ],
      );
}
