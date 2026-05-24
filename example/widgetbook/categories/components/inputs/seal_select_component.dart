import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Default', type: SealSelect, path: '[Components]/Inputs')
Widget buildSealSelectDefault(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(context.dimension.lg),
    child: SealSelect<String>(
      placeholder: Text(
        context.knobs.string(
          label: 'Placeholder',
          initialValue: 'Choose a theme',
        ),
      ),
      enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
      options: const [
        SealSelectOption(value: 'nebula', label: Text('Nebula')),
        SealSelectOption(value: 'arctic', label: Text('Arctic')),
        SealSelectOption(value: 'ocean', label: Text('Deep Ocean')),
        SealSelectOption(value: 'terminal', label: Text('Terminal')),
      ],
      onChanged: (_) {},
    ),
  );
}

@UseCase(name: 'With Label', type: SealSelect, path: '[Components]/Inputs')
Widget buildSealSelectWithLabel(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(context.dimension.lg),
    child: SealSelect<String>(
      label: Text(context.knobs.string(label: 'Label', initialValue: 'Theme')),
      placeholder: const Text('Choose a theme'),
      value: 'nebula',
      enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
      options: const [
        SealSelectOption(value: 'nebula', label: Text('Nebula')),
        SealSelectOption(value: 'arctic', label: Text('Arctic')),
        SealSelectOption(value: 'ocean', label: Text('Deep Ocean')),
        SealSelectOption(value: 'terminal', label: Text('Terminal')),
      ],
      onChanged: (_) {},
    ),
  );
}

@UseCase(name: 'Pre-selected', type: SealSelect, path: '[Components]/Inputs')
Widget buildSealSelectPreSelected(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(context.dimension.lg),
    child: SealSelect<String>(
      label: Text(context.knobs.string(label: 'Label', initialValue: 'Status')),
      value: 'in_progress',
      enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
      onChanged: (_) {},
      options: const [
        SealSelectOption(value: 'todo', label: Text('To Do')),
        SealSelectOption(value: 'in_progress', label: Text('In Progress')),
        SealSelectOption(value: 'in_review', label: Text('In Review')),
        SealSelectOption(value: 'done', label: Text('Done')),
        SealSelectOption(value: 'cancelled', label: Text('Cancelled')),
      ],
    ),
  );
}

@UseCase(name: 'Long List', type: SealSelect, path: '[Components]/Inputs')
Widget buildSealSelectLongList(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(context.dimension.lg),
    child: SealSelect<String>(
      label: const Text('Timezone'),
      placeholder: Text(
        context.knobs.string(
          label: 'Placeholder',
          initialValue: 'Select timezone',
        ),
      ),
      enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
      onChanged: (_) {},
      options: const [
        SealSelectOption(value: 'utc', label: Text('UTC — Universal Time')),
        SealSelectOption(value: 'us_et', label: Text('America/New_York (ET)')),
        SealSelectOption(value: 'us_ct', label: Text('America/Chicago (CT)')),
        SealSelectOption(value: 'us_mt', label: Text('America/Denver (MT)')),
        SealSelectOption(
          value: 'us_pt',
          label: Text('America/Los_Angeles (PT)'),
        ),
        SealSelectOption(
          value: 'eu_london',
          label: Text('Europe/London (GMT)'),
        ),
        SealSelectOption(value: 'eu_paris', label: Text('Europe/Paris (CET)')),
        SealSelectOption(
          value: 'eu_athens',
          label: Text('Europe/Athens (EET)'),
        ),
        SealSelectOption(
          value: 'eu_moscow',
          label: Text('Europe/Moscow (MSK)'),
        ),
        SealSelectOption(value: 'asia_dubai', label: Text('Asia/Dubai (GST)')),
        SealSelectOption(
          value: 'asia_kolkata',
          label: Text('Asia/Kolkata (IST)'),
        ),
        SealSelectOption(
          value: 'asia_singapore',
          label: Text('Asia/Singapore (SGT)'),
        ),
        SealSelectOption(value: 'asia_tokyo', label: Text('Asia/Tokyo (JST)')),
        SealSelectOption(
          value: 'aus_sydney',
          label: Text('Australia/Sydney (AEDT)'),
        ),
        SealSelectOption(
          value: 'pac_auckland',
          label: Text('Pacific/Auckland (NZST)'),
        ),
      ],
    ),
  );
}

@UseCase(name: 'Disabled', type: SealSelect, path: '[Components]/Inputs')
Widget buildSealSelectDisabled(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(context.dimension.lg),
    child: SealSelect<String>(
      label: Text(context.knobs.string(label: 'Label', initialValue: 'Plan')),
      placeholder: const Text('Upgrade to access'),
      enabled: false,
      onChanged: null,
      options: const [
        SealSelectOption(value: 'starter', label: Text('Starter')),
        SealSelectOption(value: 'pro', label: Text('Pro')),
        SealSelectOption(value: 'enterprise', label: Text('Enterprise')),
      ],
    ),
  );
}
