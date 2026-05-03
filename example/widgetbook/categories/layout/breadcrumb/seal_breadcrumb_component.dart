import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealBreadcrumbComponent extends WidgetbookComponent {
  SealBreadcrumbComponent()
    : super(
        name: 'SealBreadcrumb',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealBreadcrumb(
                children: [
                  SealBreadcrumbLink(
                    onPressed: () {},
                    child: const Text('Home'),
                  ),
                  SealBreadcrumbLink(
                    onPressed: () {},
                    child: const Text('Settings'),
                  ),
                  const Text('Profile'),
                ],
              ),
            ),
          ),
          WidgetbookUseCase(
            name: 'With Dropdown',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealBreadcrumb(
                children: [
                  SealBreadcrumbLink(
                    onPressed: () {},
                    child: const Text('Home'),
                  ),
                  SealBreadcrumbDropdown(
                    items: [
                      SealBreadcrumbDropMenuItem(
                        onPressed: () {},
                        child: Text(
                          context.knobs.string(
                            label: 'Item 1',
                            initialValue: 'Documentation',
                          ),
                        ),
                      ),
                      SealBreadcrumbDropMenuItem(
                        onPressed: () {},
                        child: Text(
                          context.knobs.string(
                            label: 'Item 2',
                            initialValue: 'Themes',
                          ),
                        ),
                      ),
                    ],
                    child: const SealBreadcrumbEllipsis(),
                  ),
                  const Text('Components'),
                ],
              ),
            ),
          ),
        ],
      );
}
