import 'package:widgetbook/widgetbook.dart';

import 'accordion/accordion.dart';
import 'avatars/avatars.dart';
import 'badges/badges.dart';
import 'breadcrumb/breadcrumb.dart';
import 'cards/cards.dart';
import 'containers/containers.dart';
import 'menubar/menubar.dart';
import 'resizable/resizable.dart';
import 'separator/separator.dart';
import 'spacing/spacing.dart';
import 'table/table.dart';
import 'tabs/tabs.dart';

/// Builds the **Layout** category for the Widgetbook catalog.
class LayoutCategory extends WidgetbookCategory {
  LayoutCategory()
    : super(
        name: 'Layout',
        children: [
          AccordionFolder(),
          AvatarsFolder(),
          BadgesFolder(),
          BreadcrumbFolder(),
          CardsFolder(),
          ContainersFolder(),
          MenubarFolder(),
          ResizableFolder(),
          SeparatorFolder(),
          SpacingFolder(),
          TableFolder(),
          TabsFolder(),
        ],
      );
}
