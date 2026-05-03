import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealContainerComponent extends WidgetbookComponent {
  SealContainerComponent()
    : super(
        name: 'SealContainer',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) {
              final tokens = context.themeTokens;
              return Center(
                child: SealContainer(
                  showBorder: context.knobs.boolean(
                    label: 'Show Border',
                    initialValue: true,
                  ),
                  child: Text(
                    'Seal UI Container',
                    style: tokens.typography.body.copyWith(
                      color: tokens.colors.textPrimary,
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'With Gradient',
            builder: (context) {
              final tokens = context.themeTokens;
              return Center(
                child: SealContainer(
                  gradient: tokens.gradients.surfaceGradient,
                  showBorder: true,
                  child: Text(
                    'Gradient surface container',
                    style: tokens.typography.body.copyWith(
                      color: tokens.colors.textPrimary,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      );
}
