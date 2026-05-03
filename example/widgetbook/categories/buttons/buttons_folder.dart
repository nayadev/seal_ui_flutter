import 'package:widgetbook/widgetbook.dart';

import 'seal_filled_button_component.dart';
import 'seal_filled_icon_button_component.dart';
import 'seal_icon_button_component.dart';
import 'seal_outline_button_component.dart';
import 'seal_outline_icon_button_component.dart';
import 'seal_sonner_component.dart';
import 'seal_text_button_component.dart';

class ButtonsFolder extends WidgetbookFolder {
  ButtonsFolder()
    : super(
        name: 'Buttons',
        children: [
          SealFilledButtonComponent(),
          SealFilledIconButtonComponent(),
          SealIconButtonComponent(),
          SealOutlineButtonComponent(),
          SealOutlineIconButtonComponent(),
          SealTextButtonComponent(),
          SealSonnerComponent(),
        ],
      );
}
