import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealAvatarComponent extends WidgetbookComponent {
  SealAvatarComponent()
    : super(
        name: 'SealAvatar',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) => SealAvatar(
              src: context.knobs.string(
                label: 'Image URL',
                initialValue: 'https://i.pravatar.cc/150',
              ),
              placeholder: const Text('JD'),
            ),
          ),
          WidgetbookUseCase(
            name: 'Sizes',
            builder: (context) => Wrap(
              spacing: context.dimension.md,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: const [
                SealAvatar.small(src: '', placeholder: Text('S')),
                SealAvatar(src: '', placeholder: Text('M')),
                SealAvatar.large(src: '', placeholder: Text('L')),
              ],
            ),
          ),
        ],
      );
}
