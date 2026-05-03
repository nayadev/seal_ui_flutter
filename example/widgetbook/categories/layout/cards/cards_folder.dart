import 'package:widgetbook/widgetbook.dart';

import 'seal_card_component.dart';

class CardsFolder extends WidgetbookFolder {
  CardsFolder()
    : super(
        name: 'Cards',
        children: [SealCardComponent()],
      );
}
