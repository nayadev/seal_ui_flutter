import 'package:widgetbook/widgetbook.dart';

import 'seal_menubar_component.dart';

class MenubarFolder extends WidgetbookFolder {
  MenubarFolder()
    : super(
        name: 'Menubar',
        children: [SealMenubarComponent()],
      );
}
