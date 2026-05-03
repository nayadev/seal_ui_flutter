import 'package:widgetbook/widgetbook.dart';

import 'seal_avatar_component.dart';

class AvatarsFolder extends WidgetbookFolder {
  AvatarsFolder()
    : super(
        name: 'Avatars',
        children: [SealAvatarComponent()],
      );
}
