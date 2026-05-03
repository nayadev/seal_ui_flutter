import 'package:widgetbook/widgetbook.dart';

import 'colors/colors.dart';
import 'gradients/gradients.dart';
import 'typography/typography.dart';

/// Builds the **Tokens** category for the Widgetbook catalog.
class TokensCategory extends WidgetbookCategory {
  TokensCategory()
    : super(
        name: 'Tokens',
        children: [
          ColorsFolder(),
          GradientsFolder(),
          TypographyFolder(),
        ],
      );
}
