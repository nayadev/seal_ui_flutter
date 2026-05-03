import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class OverlayFolder extends WidgetbookFolder {
  OverlayFolder()
    : super(
        name: 'Overlay',
        children: [
          WidgetbookComponent(
            name: 'SealContextMenu',
            useCases: [
              WidgetbookUseCase(
                name: 'Default',
                builder: (context) {
                  final colors = context.themeTokens.colors;
                  final typo = context.themeTokens.typography;
                  final dimension = context.dimension;
                  return Padding(
                    padding: EdgeInsets.all(dimension.lg),
                    child: SealContextMenuRegion(
                      items: [
                        SealContextMenuItem(
                          leading: const Icon(LucideIcons.copy, size: 14),
                          child: const Text('Copy'),
                          onPressed: () {},
                        ),
                        SealContextMenuItem(
                          leading: const Icon(LucideIcons.clipboard, size: 14),
                          child: const Text('Paste'),
                          onPressed: () {},
                        ),
                        SealContextMenuItem(
                          leading: const Icon(LucideIcons.trash2, size: 14),
                          enabled: context.knobs.boolean(
                            label: 'Third item enabled',
                            initialValue: true,
                          ),
                          onPressed: () {},
                          child: Text(
                            context.knobs.string(
                              label: 'Third item',
                              initialValue: 'Delete',
                            ),
                          ),
                        ),
                      ],
                      child: SealContainer(
                        child: Padding(
                          padding: EdgeInsets.all(dimension.md),
                          child: Text(
                            'Right-click or long-press here',
                            style: typo.small.copyWith(
                              color: colors.textSecondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              WidgetbookUseCase(
                name: 'With Submenu',
                builder: (context) {
                  final dimension = context.dimension;
                  return Padding(
                    padding: EdgeInsets.all(dimension.lg),
                    child: SealContextMenuRegion(
                      items: [
                        SealContextMenuItem(
                          items: [
                            SealContextMenuItem(
                              child: const Text('Cut'),
                              onPressed: () {},
                            ),
                            SealContextMenuItem(
                              child: const Text('Copy'),
                              onPressed: () {},
                            ),
                            SealContextMenuItem(
                              child: const Text('Paste'),
                              onPressed: () {},
                            ),
                          ],
                          child: const Text('Edit'),
                        ),
                        SealContextMenuItem(
                          child: const Text('Delete'),
                          onPressed: () {},
                        ),
                      ],
                      child: SealContainer(
                        child: Padding(
                          padding: EdgeInsets.all(dimension.md),
                          child: const Text('Right-click for submenu'),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          WidgetbookComponent(
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
                              initialValue:
                                  'Place content for the popover here.',
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
          ),
          WidgetbookComponent(
            name: 'SealDialog',
            useCases: [
              WidgetbookUseCase(
                name: 'Default',
                builder: (context) => SealFilledButton.primary(
                  label: const Text('Open Dialog'),
                  onPressed: () => showSealDialog<void>(
                    context: context,
                    builder: (_) => SealDialog(
                      title: Text(
                        context.knobs.string(
                          label: 'Title',
                          initialValue: 'Edit profile',
                        ),
                      ),
                      description: Text(
                        context.knobs.string(
                          label: 'Description',
                          initialValue: 'Make changes to your profile here.',
                        ),
                      ),
                      actions: [
                        SealOutlineButton.primary(
                          label: const Text('Cancel'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        SealFilledButton.primary(
                          label: const Text('Save'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              WidgetbookUseCase(
                name: 'Alert',
                builder: (context) => SealFilledButton.custom(
                  label: const Text('Open Alert'),
                  color: ColorX.red,
                  onPressed: () => showSealDialog<void>(
                    context: context,
                    builder: (_) => SealDialog.alert(
                      title: Text(
                        context.knobs.string(
                          label: 'Title',
                          initialValue: 'Are you sure?',
                        ),
                      ),
                      description: Text(
                        context.knobs.string(
                          label: 'Description',
                          initialValue: 'This action cannot be undone.',
                        ),
                      ),
                      actions: [
                        SealOutlineButton.primary(
                          label: const Text('Cancel'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        SealFilledButton.custom(
                          label: const Text('Delete'),
                          color: ColorX.red,
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          WidgetbookComponent(
            name: 'SealSheet',
            useCases: [
              WidgetbookUseCase(
                name: 'Bottom',
                builder: (context) => SealFilledButton.primary(
                  label: const Text('Open Sheet'),
                  onPressed: () => showSealSheet<void>(
                    context: context,
                    builder: (ctx) => SealSheet(
                      title: Text(
                        context.knobs.string(
                          label: 'Title',
                          initialValue: 'Filter',
                        ),
                      ),
                      description: Text(
                        context.knobs.string(
                          label: 'Description',
                          initialValue: 'Narrow down your results.',
                        ),
                      ),
                      actions: [
                        SealOutlineButton.primary(
                          label: const Text('Reset'),
                          onPressed: () => Navigator.of(ctx).pop(),
                        ),
                        SealFilledButton.primary(
                          label: const Text('Apply'),
                          onPressed: () => Navigator.of(ctx).pop(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              WidgetbookUseCase(
                name: 'Right',
                builder: (context) => SealFilledButton.primary(
                  label: const Text('Open Right Sheet'),
                  onPressed: () => showSealSheet<void>(
                    context: context,
                    side: SealSheetSide.right,
                    builder: (ctx) => SealSheet(
                      title: const Text('Settings'),
                      description: const Text('Configure your preferences.'),
                      actions: [
                        SealFilledButton.primary(
                          label: const Text('Done'),
                          onPressed: () => Navigator.of(ctx).pop(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
}
