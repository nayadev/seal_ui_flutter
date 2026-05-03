import 'package:widgetbook/widgetbook.dart';

import 'seal_tooltip_component.dart';

class InteractionFolder extends WidgetbookFolder {
  InteractionFolder()
    : super(
        name: 'Interaction',
        children: [SealTooltipComponent()],
      );
}
