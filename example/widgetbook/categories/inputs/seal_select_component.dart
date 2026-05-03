import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealSelectComponent extends WidgetbookComponent {
  SealSelectComponent()
    : super(
        name: 'SealSelect',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealSelect<String>(
                placeholder: context.knobs.string(
                  label: 'Placeholder',
                  initialValue: 'Choose a theme',
                ),
                enabled: context.knobs.boolean(
                  label: 'Enabled',
                  initialValue: true,
                ),
                options: const [
                  SealSelectOption(value: 'nebula', label: 'Nebula'),
                  SealSelectOption(value: 'arctic', label: 'Arctic'),
                  SealSelectOption(value: 'ocean', label: 'Deep Ocean'),
                  SealSelectOption(value: 'terminal', label: 'Terminal'),
                ],
                onChanged: (_) {},
              ),
            ),
          ),
          WidgetbookUseCase(
            name: 'With Label',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealSelect<String>(
                label: context.knobs.string(
                  label: 'Label',
                  initialValue: 'Theme',
                ),
                placeholder: 'Choose a theme',
                value: 'nebula',
                enabled: context.knobs.boolean(
                  label: 'Enabled',
                  initialValue: true,
                ),
                options: const [
                  SealSelectOption(value: 'nebula', label: 'Nebula'),
                  SealSelectOption(value: 'arctic', label: 'Arctic'),
                  SealSelectOption(value: 'ocean', label: 'Deep Ocean'),
                  SealSelectOption(value: 'terminal', label: 'Terminal'),
                ],
                onChanged: (_) {},
              ),
            ),
          ),
          WidgetbookUseCase(
            name: 'Pre-selected',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealSelect<String>(
                label: context.knobs.string(
                  label: 'Label',
                  initialValue: 'Status',
                ),
                value: 'in_progress',
                enabled: context.knobs.boolean(
                  label: 'Enabled',
                  initialValue: true,
                ),
                onChanged: (_) {},
                options: const [
                  SealSelectOption(value: 'todo', label: 'To Do'),
                  SealSelectOption(value: 'in_progress', label: 'In Progress'),
                  SealSelectOption(value: 'in_review', label: 'In Review'),
                  SealSelectOption(value: 'done', label: 'Done'),
                  SealSelectOption(value: 'cancelled', label: 'Cancelled'),
                ],
              ),
            ),
          ),
          WidgetbookUseCase(
            name: 'Long List',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealSelect<String>(
                label: 'Timezone',
                placeholder: context.knobs.string(
                  label: 'Placeholder',
                  initialValue: 'Select timezone',
                ),
                enabled: context.knobs.boolean(
                  label: 'Enabled',
                  initialValue: true,
                ),
                onChanged: (_) {},
                options: const [
                  SealSelectOption(value: 'utc', label: 'UTC — Universal Time'),
                  SealSelectOption(
                    value: 'us_et',
                    label: 'America/New_York (ET)',
                  ),
                  SealSelectOption(
                    value: 'us_ct',
                    label: 'America/Chicago (CT)',
                  ),
                  SealSelectOption(
                    value: 'us_mt',
                    label: 'America/Denver (MT)',
                  ),
                  SealSelectOption(
                    value: 'us_pt',
                    label: 'America/Los_Angeles (PT)',
                  ),
                  SealSelectOption(
                    value: 'eu_london',
                    label: 'Europe/London (GMT)',
                  ),
                  SealSelectOption(
                    value: 'eu_paris',
                    label: 'Europe/Paris (CET)',
                  ),
                  SealSelectOption(
                    value: 'eu_athens',
                    label: 'Europe/Athens (EET)',
                  ),
                  SealSelectOption(
                    value: 'eu_moscow',
                    label: 'Europe/Moscow (MSK)',
                  ),
                  SealSelectOption(
                    value: 'asia_dubai',
                    label: 'Asia/Dubai (GST)',
                  ),
                  SealSelectOption(
                    value: 'asia_kolkata',
                    label: 'Asia/Kolkata (IST)',
                  ),
                  SealSelectOption(
                    value: 'asia_singapore',
                    label: 'Asia/Singapore (SGT)',
                  ),
                  SealSelectOption(
                    value: 'asia_tokyo',
                    label: 'Asia/Tokyo (JST)',
                  ),
                  SealSelectOption(
                    value: 'aus_sydney',
                    label: 'Australia/Sydney (AEDT)',
                  ),
                  SealSelectOption(
                    value: 'pac_auckland',
                    label: 'Pacific/Auckland (NZST)',
                  ),
                ],
              ),
            ),
          ),
          WidgetbookUseCase(
            name: 'Disabled',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealSelect<String>(
                label: context.knobs.string(
                  label: 'Label',
                  initialValue: 'Plan',
                ),
                placeholder: 'Upgrade to access',
                enabled: false,
                onChanged: null,
                options: const [
                  SealSelectOption(value: 'starter', label: 'Starter'),
                  SealSelectOption(value: 'pro', label: 'Pro'),
                  SealSelectOption(value: 'enterprise', label: 'Enterprise'),
                ],
              ),
            ),
          ),
        ],
      );
}
