import 'package:widgetbook/widgetbook.dart';

import 'seal_typography_component.dart';

class TypographyFolder extends WidgetbookFolder {
  TypographyFolder()
    : super(
        name: 'Typography',
        children: [SealTypographyComponent()],
      );
}
