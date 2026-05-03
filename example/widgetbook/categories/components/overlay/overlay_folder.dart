import 'package:widgetbook/widgetbook.dart';

import 'seal_context_menu_component.dart';
import 'seal_dialog_component.dart';
import 'seal_popover_component.dart';
import 'seal_sheet_component.dart';

class OverlayFolder extends WidgetbookFolder {
  OverlayFolder()
    : super(
        name: 'Overlay',
        children: [
          SealContextMenuComponent(),
          SealPopoverComponent(),
          SealDialogComponent(),
          SealSheetComponent(),
        ],
      );
}
