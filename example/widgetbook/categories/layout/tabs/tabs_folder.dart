import 'package:widgetbook/widgetbook.dart';

import 'seal_tabs_component.dart';

class TabsFolder extends WidgetbookFolder {
  TabsFolder()
    : super(
        name: 'Tabs',
        children: [SealTabsComponent()],
      );
}
