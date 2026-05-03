import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Default', type: SealBreadcrumb, path: '[Layout]/Breadcrumb')
Widget buildSealBreadcrumbDefault(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(context.dimension.lg),
    child: SealBreadcrumb(
      children: [
        SealBreadcrumbLink(onPressed: () {}, child: const Text('Home')),
        SealBreadcrumbLink(onPressed: () {}, child: const Text('Settings')),
        const Text('Profile'),
      ],
    ),
  );
}

@UseCase(
  name: 'With Dropdown',
  type: SealBreadcrumb,
  path: '[Layout]/Breadcrumb',
)
Widget buildSealBreadcrumbWithDropdown(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(context.dimension.lg),
    child: SealBreadcrumb(
      children: [
        SealBreadcrumbLink(onPressed: () {}, child: const Text('Home')),
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
  );
}
