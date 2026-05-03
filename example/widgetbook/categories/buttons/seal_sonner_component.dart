import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealSonnerComponent extends WidgetbookComponent {
  SealSonnerComponent()
    : super(
        name: 'SealSonner',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) {
              final dimension = context.dimension;
              return Padding(
                padding: EdgeInsets.all(dimension.lg),
                child: SealSonner(
                  child: Builder(
                    builder: (ctx) => SealFilledButton.primary(
                      label: Text(
                        context.knobs.string(
                          label: 'Title',
                          initialValue: 'File saved',
                        ),
                      ),
                      onPressed: () => showSealSonner(
                        ctx,
                        title: Text(
                          context.knobs.string(
                            label: 'Title',
                            initialValue: 'File saved',
                          ),
                        ),
                        description:
                            context.knobs.boolean(
                              label: 'Show description',
                              initialValue: true,
                            )
                            ? Text(
                                context.knobs.string(
                                  label: 'Description',
                                  initialValue:
                                      'Your changes have been synced.',
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      );
}
