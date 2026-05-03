import 'package:widgetbook/widgetbook.dart';

import 'seal_container_component.dart';

class ContainersFolder extends WidgetbookFolder {
  ContainersFolder()
    : super(
        name: 'Containers',
        children: [SealContainerComponent()],
      );
}
