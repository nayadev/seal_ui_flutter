import 'package:widgetbook/widgetbook.dart';

import 'seal_accordion_component.dart';

class AccordionFolder extends WidgetbookFolder {
  AccordionFolder()
    : super(
        name: 'Accordion',
        children: [SealAccordionComponent()],
      );
}
