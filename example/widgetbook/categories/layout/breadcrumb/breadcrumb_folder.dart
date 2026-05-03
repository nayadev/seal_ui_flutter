import 'package:widgetbook/widgetbook.dart';

import 'seal_breadcrumb_component.dart';

class BreadcrumbFolder extends WidgetbookFolder {
  BreadcrumbFolder()
    : super(
        name: 'Breadcrumb',
        children: [SealBreadcrumbComponent()],
      );
}
