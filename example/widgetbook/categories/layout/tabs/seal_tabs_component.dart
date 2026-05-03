import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Default', type: SealTabs, path: '[Layout]/Tabs')
Widget buildSealTabsDefault(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(context.dimension.lg),
    child: SealTabs<String>(
      value: 'account',
      tabs: [
        SealTab(
          value: 'account',
          label: const Text('Account'),
          content: Padding(
            padding: EdgeInsets.all(context.dimension.md),
            child: const Text('Account settings panel.'),
          ),
        ),
        SealTab(
          value: 'security',
          label: const Text('Security'),
          content: Padding(
            padding: EdgeInsets.all(context.dimension.md),
            child: const Text('Security settings panel.'),
          ),
        ),
        SealTab(
          value: 'billing',
          label: const Text('Billing'),
          content: Padding(
            padding: EdgeInsets.all(context.dimension.md),
            child: const Text('Billing information panel.'),
          ),
        ),
      ],
    ),
  );
}

@UseCase(name: 'With Disabled Tab', type: SealTabs, path: '[Layout]/Tabs')
Widget buildSealTabsWithDisabledTab(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(context.dimension.lg),
    child: SealTabs<String>(
      value: 'active',
      tabs: [
        SealTab(
          value: 'active',
          label: const Text('Active'),
          content: Padding(
            padding: EdgeInsets.all(context.dimension.md),
            child: const Text('Active tab content.'),
          ),
        ),
        const SealTab(
          value: 'disabled',
          label: Text('Disabled'),
          content: Text(''),
          enabled: false,
        ),
      ],
    ),
  );
}
