import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadInputFormField;
import 'package:widgetbook/widgetbook.dart';

class InputsFolder extends WidgetbookFolder {
  InputsFolder()
    : super(
        name: 'Inputs',
        children: [
          WidgetbookComponent(
            name: 'SealCalendar',
            useCases: [
              WidgetbookUseCase(
                name: 'Single',
                builder: (context) {
                  DateTime? selected;
                  return StatefulBuilder(
                    builder: (ctx, setState) => Padding(
                      padding: EdgeInsets.all(ctx.dimension.lg),
                      child: SealCalendar(
                        selected: selected,
                        allowDeselection: context.knobs.boolean(
                          label: 'Allow Deselection',
                          initialValue: true,
                        ),
                        onChanged: (date) => setState(() => selected = date),
                      ),
                    ),
                  );
                },
              ),
              WidgetbookUseCase(
                name: 'Range',
                builder: (context) {
                  SealDateTimeRange? range;
                  return StatefulBuilder(
                    builder: (ctx, setState) => Padding(
                      padding: EdgeInsets.all(ctx.dimension.lg),
                      child: SealCalendar.range(
                        selected: range,
                        onChanged: (r) => setState(() => range = r),
                      ),
                    ),
                  );
                },
              ),
              WidgetbookUseCase(
                name: 'Multiple',
                builder: (context) {
                  var selected = <DateTime>[];
                  return StatefulBuilder(
                    builder: (ctx, setState) => Padding(
                      padding: EdgeInsets.all(ctx.dimension.lg),
                      child: SealCalendar.multiple(
                        selected: selected,
                        onChanged: (dates) => setState(() => selected = dates),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          WidgetbookComponent(
            name: 'SealInputOTP',
            useCases: [
              WidgetbookUseCase(
                name: 'Default',
                builder: (context) => Padding(
                  padding: EdgeInsets.all(context.dimension.lg),
                  child: SealInputOTP(
                    maxLength: 6,
                    enabled: context.knobs.boolean(
                      label: 'Enabled',
                      initialValue: true,
                    ),
                    onChanged: (_) {},
                    children: [
                      SealInputOTPGroup(
                        children: List.generate(
                          3,
                          (_) => const SealInputOTPSlot(),
                        ),
                      ),
                      SealInputOTPGroup(
                        children: List.generate(
                          3,
                          (_) => const SealInputOTPSlot(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              WidgetbookUseCase(
                name: 'Four Digit',
                builder: (context) => Padding(
                  padding: EdgeInsets.all(context.dimension.lg),
                  child: SealInputOTP(
                    maxLength: 4,
                    onChanged: (_) {},
                    children: [
                      SealInputOTPGroup(
                        children: List.generate(
                          4,
                          (_) => const SealInputOTPSlot(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          WidgetbookComponent(
            name: 'SealCheckbox',
            useCases: [
              WidgetbookUseCase(
                name: 'Default',
                builder: (context) {
                  final enabled = context.knobs.boolean(
                    label: 'Enabled',
                    initialValue: true,
                  );
                  return SealCheckbox(
                    value: context.knobs.boolean(
                      label: 'Checked',
                      initialValue: false,
                    ),
                    enabled: enabled,
                    onChanged: enabled ? (_) {} : null,
                  );
                },
              ),
              WidgetbookUseCase(
                name: 'With Label',
                builder: (context) {
                  final enabled = context.knobs.boolean(
                    label: 'Enabled',
                    initialValue: true,
                  );
                  final showSublabel = context.knobs.boolean(
                    label: 'Show Sublabel',
                    initialValue: true,
                  );
                  return SealCheckbox(
                    value: context.knobs.boolean(
                      label: 'Checked',
                      initialValue: false,
                    ),
                    enabled: enabled,
                    onChanged: enabled ? (_) {} : null,
                    label: Text(
                      context.knobs.string(
                        label: 'Label',
                        initialValue: 'Accept terms and conditions',
                      ),
                    ),
                    sublabel: showSublabel
                        ? Text(
                            context.knobs.string(
                              label: 'Sublabel',
                              initialValue:
                                  'You agree to our Terms of Service.',
                            ),
                          )
                        : null,
                  );
                },
              ),
            ],
          ),
          WidgetbookComponent(
            name: 'SealRadioGroup',
            useCases: [
              WidgetbookUseCase(
                name: 'Default',
                builder: (context) {
                  final enabled = context.knobs.boolean(
                    label: 'Enabled',
                    initialValue: true,
                  );
                  return SealRadioGroup<String>(
                    value: 'light',
                    enabled: enabled,
                    onChanged: enabled ? (_) {} : null,
                    items: const [
                      SealRadioItem(value: 'light', label: Text('Light')),
                      SealRadioItem(value: 'dark', label: Text('Dark')),
                      SealRadioItem(value: 'system', label: Text('System')),
                    ],
                  );
                },
              ),
              WidgetbookUseCase(
                name: 'Horizontal',
                builder: (context) {
                  final enabled = context.knobs.boolean(
                    label: 'Enabled',
                    initialValue: true,
                  );
                  return SealRadioGroup<String>(
                    value: 'yes',
                    axis: Axis.horizontal,
                    enabled: enabled,
                    onChanged: enabled ? (_) {} : null,
                    items: const [
                      SealRadioItem(value: 'yes', label: Text('Yes')),
                      SealRadioItem(value: 'no', label: Text('No')),
                    ],
                  );
                },
              ),
            ],
          ),
          WidgetbookComponent(
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
                      SealSelectOption(
                        value: 'in_progress',
                        label: 'In Progress',
                      ),
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
                      SealSelectOption(
                        value: 'utc',
                        label: 'UTC — Universal Time',
                      ),
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
                      SealSelectOption(
                        value: 'enterprise',
                        label: 'Enterprise',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          WidgetbookComponent(
            name: 'SealSlider',
            useCases: [
              WidgetbookUseCase(
                name: 'Default',
                builder: (context) => Padding(
                  padding: EdgeInsets.all(context.dimension.lg),
                  child: SealSlider(
                    value: context.knobs.double.slider(
                      label: 'Value',
                      initialValue: 0.5,
                      min: 0,
                      max: 1,
                    ),
                    enabled: context.knobs.boolean(
                      label: 'Enabled',
                      initialValue: true,
                    ),
                    onChanged: (_) {},
                  ),
                ),
              ),
              WidgetbookUseCase(
                name: 'Stepped',
                builder: (context) => Padding(
                  padding: EdgeInsets.all(context.dimension.lg),
                  child: SealSlider(
                    value: 50,
                    min: 0,
                    max: 100,
                    divisions: context.knobs.double
                        .slider(
                          label: 'Divisions',
                          initialValue: 10,
                          min: 2,
                          max: 20,
                        )
                        .toInt(),
                    onChanged: (_) {},
                  ),
                ),
              ),
            ],
          ),
          WidgetbookComponent(
            name: 'SealSwitch',
            useCases: [
              WidgetbookUseCase(
                name: 'Default',
                builder: (context) {
                  final enabled = context.knobs.boolean(
                    label: 'Enabled',
                    initialValue: true,
                  );
                  return SealSwitch(
                    value: context.knobs.boolean(
                      label: 'On',
                      initialValue: false,
                    ),
                    enabled: enabled,
                    onChanged: enabled ? (_) {} : null,
                  );
                },
              ),
              WidgetbookUseCase(
                name: 'With Label',
                builder: (context) {
                  final enabled = context.knobs.boolean(
                    label: 'Enabled',
                    initialValue: true,
                  );
                  final showSublabel = context.knobs.boolean(
                    label: 'Show Sublabel',
                    initialValue: true,
                  );
                  return SealSwitch(
                    value: context.knobs.boolean(
                      label: 'On',
                      initialValue: false,
                    ),
                    enabled: enabled,
                    onChanged: enabled ? (_) {} : null,
                    label: Text(
                      context.knobs.string(
                        label: 'Label',
                        initialValue: 'Enable notifications',
                      ),
                    ),
                    sublabel: showSublabel
                        ? Text(
                            context.knobs.string(
                              label: 'Sublabel',
                              initialValue: 'Receive push notifications.',
                            ),
                          )
                        : null,
                  );
                },
              ),
            ],
          ),
          WidgetbookComponent(
            name: 'SealTextarea',
            useCases: [
              WidgetbookUseCase(
                name: 'Default',
                builder: (context) => Padding(
                  padding: EdgeInsets.all(context.dimension.lg),
                  child: SealTextarea(
                    hint: context.knobs.string(
                      label: 'Hint',
                      initialValue: 'Enter a description…',
                    ),
                    enabled: context.knobs.boolean(
                      label: 'Enabled',
                      initialValue: true,
                    ),
                    resizable: context.knobs.boolean(
                      label: 'Resizable',
                      initialValue: true,
                    ),
                  ),
                ),
              ),
              WidgetbookUseCase(
                name: 'With Label',
                builder: (context) => Padding(
                  padding: EdgeInsets.all(context.dimension.lg),
                  child: SealTextarea(
                    label: context.knobs.string(
                      label: 'Label',
                      initialValue: 'Message',
                    ),
                    hint: context.knobs.string(
                      label: 'Hint',
                      initialValue: 'Type your message here…',
                    ),
                    enabled: context.knobs.boolean(
                      label: 'Enabled',
                      initialValue: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
          WidgetbookComponent(
            name: 'SealTextField',
            useCases: [
              WidgetbookUseCase(
                name: 'Default',
                builder: (context) => Padding(
                  padding: EdgeInsets.all(context.dimension.lg),
                  child: SealTextField(
                    label: context.knobs.string(
                      label: 'Label',
                      initialValue: 'Email',
                    ),
                    hint: context.knobs.string(
                      label: 'Hint',
                      initialValue: 'you@example.com',
                    ),
                    enabled: context.knobs.boolean(
                      label: 'Enabled',
                      initialValue: true,
                    ),
                    prefixIcon:
                        context.knobs.boolean(
                          label: 'Show Prefix Icon',
                          initialValue: true,
                        )
                        ? LucideIcons.mail
                        : null,
                  ),
                ),
              ),
              WidgetbookUseCase(
                name: 'Password',
                builder: (context) => Padding(
                  padding: EdgeInsets.all(context.dimension.lg),
                  child: SealTextField(
                    label: 'Password',
                    hint: '••••••••',
                    obscureText: true,
                    prefixIcon: LucideIcons.lock,
                    suffixIcon: LucideIcons.eyeOff,
                  ),
                ),
              ),
            ],
          ),
          WidgetbookComponent(
            name: 'SealTimePicker',
            useCases: [
              WidgetbookUseCase(
                name: 'Default',
                builder: (context) => Padding(
                  padding: EdgeInsets.all(context.dimension.lg),
                  child: SealTimePicker(
                    enabled: context.knobs.boolean(
                      label: 'Enabled',
                      initialValue: true,
                    ),
                    showSeconds: context.knobs.boolean(
                      label: 'Show Seconds',
                      initialValue: true,
                    ),
                    onChanged: (_) {},
                  ),
                ),
              ),
              WidgetbookUseCase(
                name: 'Period (AM/PM)',
                builder: (context) => Padding(
                  padding: EdgeInsets.all(context.dimension.lg),
                  child: SealTimePicker.period(
                    enabled: context.knobs.boolean(
                      label: 'Enabled',
                      initialValue: true,
                    ),
                    showSeconds: context.knobs.boolean(
                      label: 'Show Seconds',
                      initialValue: false,
                    ),
                    onChanged: (_) {},
                  ),
                ),
              ),
            ],
          ),
          WidgetbookComponent(
            name: 'SealDatePicker',
            useCases: [
              WidgetbookUseCase(
                name: 'Single',
                builder: (context) {
                  DateTime? selected;
                  return StatefulBuilder(
                    builder: (ctx, setState) => Padding(
                      padding: EdgeInsets.all(ctx.dimension.lg),
                      child: SealDatePicker(
                        selected: selected,
                        placeholder: const Text('Pick a date'),
                        allowDeselection: context.knobs.boolean(
                          label: 'Allow Deselection',
                          initialValue: true,
                        ),
                        enabled: context.knobs.boolean(
                          label: 'Enabled',
                          initialValue: true,
                        ),
                        onChanged: (date) => setState(() => selected = date),
                      ),
                    ),
                  );
                },
              ),
              WidgetbookUseCase(
                name: 'Range',
                builder: (context) {
                  SealDateTimeRange? range;
                  return StatefulBuilder(
                    builder: (ctx, setState) => Padding(
                      padding: EdgeInsets.all(ctx.dimension.lg),
                      child: SealDatePicker.range(
                        selected: range,
                        placeholder: const Text('Pick a date range'),
                        enabled: context.knobs.boolean(
                          label: 'Enabled',
                          initialValue: true,
                        ),
                        onChanged: (r) => setState(() => range = r),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          WidgetbookComponent(
            name: 'SealForm',
            useCases: [
              WidgetbookUseCase(
                name: 'Default',
                builder: (context) {
                  final formKey = GlobalKey<SealFormState>();
                  String? result;
                  return StatefulBuilder(
                    builder: (ctx, setState) => Padding(
                      padding: EdgeInsets.all(ctx.dimension.lg),
                      child: SealForm(
                        formKey: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ShadInputFormField(
                              id: 'username',
                              label: const Text('Username'),
                              placeholder: const Text('Enter username'),
                              validator: (v) =>
                                  v.isEmpty ? 'Username is required' : null,
                            ),
                            ctx.dimension.sm.verticalGap,
                            ShadInputFormField(
                              id: 'email',
                              label: const Text('Email'),
                              placeholder: const Text('Enter email'),
                              validator: (v) => !v.contains('@')
                                  ? 'Enter a valid email'
                                  : null,
                            ),
                            ctx.dimension.md.verticalGap,
                            SealFilledButton.primary(
                              label: const Text('Submit'),
                              onPressed: () {
                                if (formKey.currentState!.saveAndValidate()) {
                                  setState(() {
                                    result = formKey.currentState!.value
                                        .toString();
                                  });
                                }
                              },
                            ),
                            if (result != null) ...[
                              ctx.dimension.sm.verticalGap,
                              Text(result!),
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      );
}
