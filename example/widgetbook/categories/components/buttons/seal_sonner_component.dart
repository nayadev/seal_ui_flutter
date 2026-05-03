import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Default', type: SealSonner, path: '[Components]/Buttons')
Widget buildSealSonnerDefault(BuildContext context) {
  final dimension = context.dimension;
  return Padding(
    padding: EdgeInsets.all(dimension.lg),
    child: SealSonner(
      child: Builder(
        builder: (ctx) => SealFilledButton.primary(
          label: Text(
            context.knobs.string(label: 'Title', initialValue: 'File saved'),
          ),
          onPressed: () => showSealSonner(
            ctx,
            title: Text(
              context.knobs.string(label: 'Title', initialValue: 'File saved'),
            ),
            description:
                context.knobs.boolean(
                      label: 'Show description',
                      initialValue: true,
                    )
                    ? Text(
                        context.knobs.string(
                          label: 'Description',
                          initialValue: 'Your changes have been synced.',
                        ),
                      )
                    : null,
          ),
        ),
      ),
    ),
  );
}
