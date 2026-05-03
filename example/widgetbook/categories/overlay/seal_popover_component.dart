import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealPopoverComponent extends WidgetbookComponent {
  SealPopoverComponent()
    : super(
        name: 'SealPopover',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) {
              final controller = SealPopoverController();
              return SealPopover(
                controller: controller,
                popover: (ctx) {
                  final colors = ctx.themeTokens.colors;
                  final typo = ctx.themeTokens.typography;
                  final dimension = ctx.dimension;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.knobs.string(
                          label: 'Title',
                          initialValue: 'Popover title',
                        ),
                        style: typo.small.copyWith(
                          color: colors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      dimension.xxs.verticalGap,
                      Text(
                        context.knobs.string(
                          label: 'Content',
                          initialValue: 'Place content for the popover here.',
                        ),
                        style: typo.small.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                    ],
                  );
                },
                child: SealOutlineButton.primary(
                  label: const Text('Open Popover'),
                  onPressed: controller.toggle,
                ),
              );
            },
          ),
        ],
      );
}
