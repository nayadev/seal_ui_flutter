import 'package:widgetbook/widgetbook.dart';

import 'seal_spacing_component.dart';

class SpacingFolder extends WidgetbookFolder {
  SpacingFolder()
    : super(
        name: 'Spacing',
        children: [SealSpacingComponent()],
      );
}
