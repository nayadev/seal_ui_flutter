import 'package:widgetbook/widgetbook.dart';

import 'seal_alert_component.dart';
import 'seal_loader_component.dart';
import 'seal_progress_component.dart';
import 'seal_toast_component.dart';

class FeedbackFolder extends WidgetbookFolder {
  FeedbackFolder()
    : super(
        name: 'Feedback',
        children: [
          SealAlertComponent(),
          SealLoaderComponent(),
          SealProgressComponent(),
          SealToastComponent(),
        ],
      );
}
