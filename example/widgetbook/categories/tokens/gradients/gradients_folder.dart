import 'package:widgetbook/widgetbook.dart';

import 'seal_gradients_component.dart';

class GradientsFolder extends WidgetbookFolder {
  GradientsFolder()
    : super(
        name: 'Gradients',
        children: [SealGradientsComponent()],
      );
}
