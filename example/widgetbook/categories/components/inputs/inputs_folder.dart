import 'package:widgetbook/widgetbook.dart';

import 'seal_calendar_component.dart';
import 'seal_checkbox_component.dart';
import 'seal_date_picker_component.dart';
import 'seal_form_component.dart';
import 'seal_input_otp_component.dart';
import 'seal_radio_group_component.dart';
import 'seal_select_component.dart';
import 'seal_slider_component.dart';
import 'seal_switch_component.dart';
import 'seal_text_field_component.dart';
import 'seal_textarea_component.dart';
import 'seal_time_picker_component.dart';

class InputsFolder extends WidgetbookFolder {
  InputsFolder()
    : super(
        name: 'Inputs',
        children: [
          SealCalendarComponent(),
          SealInputOTPComponent(),
          SealCheckboxComponent(),
          SealRadioGroupComponent(),
          SealSelectComponent(),
          SealSliderComponent(),
          SealSwitchComponent(),
          SealTextareaComponent(),
          SealTextFieldComponent(),
          SealTimePickerComponent(),
          SealDatePickerComponent(),
          SealFormComponent(),
        ],
      );
}
