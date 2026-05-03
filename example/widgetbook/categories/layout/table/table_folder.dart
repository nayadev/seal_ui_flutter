import 'package:widgetbook/widgetbook.dart';

import 'seal_table_component.dart';

class TableFolder extends WidgetbookFolder {
  TableFolder()
    : super(
        name: 'Table',
        children: [SealTableComponent()],
      );
}
