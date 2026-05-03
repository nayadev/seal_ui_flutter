import 'package:widgetbook/widgetbook.dart';

import 'seal_badge_component.dart';

class BadgesFolder extends WidgetbookFolder {
  BadgesFolder()
    : super(
        name: 'Badges',
        children: [SealBadgeComponent()],
      );
}
