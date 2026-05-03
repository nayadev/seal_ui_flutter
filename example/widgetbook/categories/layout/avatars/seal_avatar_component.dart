import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Default', type: SealAvatar, path: '[Layout]/Avatars')
Widget buildSealAvatarDefault(BuildContext context) {
  return SealAvatar(
    src: context.knobs.string(
      label: 'Image URL',
      initialValue: 'https://i.pravatar.cc/150',
    ),
    placeholder: const Text('JD'),
  );
}

@UseCase(name: 'Sizes', type: SealAvatar, path: '[Layout]/Avatars')
Widget buildSealAvatarSizes(BuildContext context) {
  return Wrap(
    spacing: context.dimension.md,
    crossAxisAlignment: WrapCrossAlignment.center,
    children: const [
      SealAvatar.small(src: '', placeholder: Text('S')),
      SealAvatar(src: '', placeholder: Text('M')),
      SealAvatar.large(src: '', placeholder: Text('L')),
    ],
  );
}
