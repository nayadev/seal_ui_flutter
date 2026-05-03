import 'package:widgetbook/widgetbook.dart';

import 'seal_resizable_component.dart';

class ResizableFolder extends WidgetbookFolder {
  ResizableFolder()
    : super(
        name: 'Resizable',
        children: [SealResizableComponent()],
      );
}
