import 'package:widgetbook/widgetbook.dart';

import 'seal_colors_component.dart';

class ColorsFolder extends WidgetbookFolder {
  ColorsFolder()
    : super(
        name: 'Colors',
        children: [SealColorsComponent()],
      );
}
