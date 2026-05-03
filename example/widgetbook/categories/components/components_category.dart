import 'package:widgetbook/widgetbook.dart';

import 'buttons/buttons.dart';
import 'feedback/feedback.dart';
import 'inputs/inputs.dart';
import 'interaction/interaction.dart';
import 'overlay/overlay.dart';

/// Builds the **Components** category for the Widgetbook catalog.
class ComponentsCategory extends WidgetbookCategory {
  ComponentsCategory()
    : super(
        name: 'Components',
        children: [
          ButtonsFolder(),
          FeedbackFolder(),
          InputsFolder(),
          InteractionFolder(),
          OverlayFolder(),
        ],
      );
}
