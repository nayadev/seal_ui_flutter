import 'package:widgetbook/widgetbook.dart';

import 'seal_separator_component.dart';

class SeparatorFolder extends WidgetbookFolder {
  SeparatorFolder()
    : super(
        name: 'Separator',
        children: [SealSeparatorComponent()],
      );
}
