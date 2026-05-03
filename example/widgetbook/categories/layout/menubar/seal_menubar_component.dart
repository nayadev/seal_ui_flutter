import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealMenubarComponent extends WidgetbookComponent {
  SealMenubarComponent()
    : super(
        name: 'SealMenubar',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealMenubar(
                items: [
                  SealMenubarItem(
                    items: [
                      SealContextMenuItem(
                        leading: const Icon(LucideIcons.filePlus, size: 14),
                        child: const Text('New'),
                        onPressed: () {},
                      ),
                      SealContextMenuItem(
                        leading: const Icon(LucideIcons.folderOpen, size: 14),
                        child: const Text('Open'),
                        onPressed: () {},
                      ),
                      SealContextMenuItem(
                        leading: const Icon(LucideIcons.save, size: 14),
                        child: const Text('Save'),
                        onPressed: () {},
                      ),
                    ],
                    child: const Text('File'),
                  ),
                  SealMenubarItem(
                    items: [
                      SealContextMenuItem(
                        child: const Text('Undo'),
                        onPressed: () {},
                      ),
                      SealContextMenuItem(
                        child: const Text('Redo'),
                        onPressed: () {},
                      ),
                    ],
                    child: const Text('Edit'),
                  ),
                  SealMenubarItem(
                    enabled: context.knobs.boolean(
                      label: 'View enabled',
                      initialValue: true,
                    ),
                    items: [
                      SealContextMenuItem(
                        child: const Text('Zoom In'),
                        onPressed: () {},
                      ),
                      SealContextMenuItem(
                        child: const Text('Zoom Out'),
                        onPressed: () {},
                      ),
                    ],
                    child: const Text('View'),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
