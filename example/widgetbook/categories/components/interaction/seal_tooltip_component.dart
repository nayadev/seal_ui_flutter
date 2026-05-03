import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealTooltipComponent extends WidgetbookComponent {
  SealTooltipComponent()
    : super(
        name: 'SealTooltip',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) => SealTooltip(
              message: context.knobs.string(
                label: 'Message',
                initialValue: 'Delete item',
              ),
              child: SealFilledButton.primary(
                label: const Text('Hover me'),
                onPressed: () {},
              ),
            ),
          ),
          WidgetbookUseCase(
            name: 'Custom',
            builder: (context) => SealTooltip.custom(
              builder: (ctx) => const Text('Custom tooltip content'),
              child: SealOutlineButton.primary(
                label: const Text('Hover me'),
                onPressed: () {},
              ),
            ),
          ),
        ],
      );
}
