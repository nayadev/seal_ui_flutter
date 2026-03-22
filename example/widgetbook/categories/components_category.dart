import 'package:flutter/widgets.dart';
import 'package:widgetbook/widgetbook.dart';

import 'package:seal_ui/seal_ui.dart';

/// Builds the **Components** category for the Widgetbook catalog.
WidgetbookCategory buildComponentsCategory() {
  return WidgetbookCategory(
    name: 'Components',
    children: [
      _buildButtonsFolder(),
      _buildInputsFolder(),
      _buildInteractionFolder(),
      _buildFeedbackFolder(),
    ],
  );
}

// ── Buttons ──────────────────────────────────────────────────────────────────

WidgetbookFolder _buildButtonsFolder() {
  return WidgetbookFolder(
    name: 'Buttons',
    children: [
      WidgetbookComponent(
        name: 'SealFilledButton',
        useCases: [
          WidgetbookUseCase(
            name: 'Primary',
            builder: (context) => SealFilledButton.primary(
              label: Text(context.knobs.string(
                label: 'Label',
                initialValue: 'Get Started',
              )),
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Accent',
            builder: (context) => SealFilledButton.accent(
              label: Text(context.knobs.string(
                label: 'Label',
                initialValue: 'Continue',
              )),
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Accent Secondary',
            builder: (context) => SealFilledButton.accentSecondary(
              label: Text(context.knobs.string(
                label: 'Label',
                initialValue: 'Confirm',
              )),
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Gradient',
            builder: (context) => SealFilledButton.gradient(
              label: Text(context.knobs.string(
                label: 'Label',
                initialValue: 'Launch',
              )),
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Accent Gradient',
            builder: (context) => SealFilledButton.accentGradient(
              label: Text(context.knobs.string(
                label: 'Label',
                initialValue: 'Boost',
              )),
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'With Icon',
            builder: (context) => SealFilledButton.gradient(
              label: Text(context.knobs.string(
                label: 'Label',
                initialValue: 'Explore',
              )),
              icon: LucideIcons.rocket,
              onPressed: () {},
            ),
          ),
          WidgetbookUseCase(
            name: 'Custom',
            builder: (context) => SealFilledButton.custom(
              label: Text(context.knobs.string(
                label: 'Label',
                initialValue: 'Delete',
              )),
              color: context.knobs.object.dropdown<Color>(
                label: 'Color',
                options: [
                  ColorX.red,
                  ColorX.teal,
                  ColorX.orange,
                  ColorX.indigo,
                  ColorX.pink,
                ],
                initialOption: ColorX.red,
                labelBuilder: (v) => v.toString(),
              ),
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'SealOutlineButton',
        useCases: [
          WidgetbookUseCase(
            name: 'Primary',
            builder: (context) => SealOutlineButton.primary(
              label: Text(context.knobs.string(
                label: 'Label',
                initialValue: 'Cancel',
              )),
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Accent',
            builder: (context) => SealOutlineButton.accent(
              label: Text(context.knobs.string(
                label: 'Label',
                initialValue: 'Details',
              )),
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Accent Secondary',
            builder: (context) => SealOutlineButton.accentSecondary(
              label: Text(context.knobs.string(
                label: 'Label',
                initialValue: 'Info',
              )),
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Gradient',
            builder: (context) => SealOutlineButton.gradient(
              label: Text(context.knobs.string(
                label: 'Label',
                initialValue: 'Explore',
              )),
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Accent Gradient',
            builder: (context) => SealOutlineButton.accentGradient(
              label: Text(context.knobs.string(
                label: 'Label',
                initialValue: 'Discover',
              )),
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'With Icon',
            builder: (context) => SealOutlineButton.primary(
              label: Text(context.knobs.string(
                label: 'Label',
                initialValue: 'Favorite',
              )),
              icon: LucideIcons.star,
              onPressed: () {},
            ),
          ),
          WidgetbookUseCase(
            name: 'Custom',
            builder: (context) => SealOutlineButton.custom(
              label: Text(context.knobs.string(
                label: 'Label',
                initialValue: 'Retry',
              )),
              color: context.knobs.object.dropdown<Color>(
                label: 'Color',
                options: [
                  ColorX.red,
                  ColorX.teal,
                  ColorX.orange,
                  ColorX.indigo,
                  ColorX.pink,
                ],
                initialOption: ColorX.red,
                labelBuilder: (v) => v.toString(),
              ),
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'SealTextButton',
        useCases: [
          WidgetbookUseCase(
            name: 'Primary',
            builder: (context) => SealTextButton.primary(
              label: Text(context.knobs.string(
                label: 'Label',
                initialValue: 'Learn more',
              )),
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Accent',
            builder: (context) => SealTextButton.accent(
              label: Text(context.knobs.string(
                label: 'Label',
                initialValue: 'Details',
              )),
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Accent Secondary',
            builder: (context) => SealTextButton.accentSecondary(
              label: Text(context.knobs.string(
                label: 'Label',
                initialValue: 'Info',
              )),
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Gradient',
            builder: (context) => SealTextButton.gradient(
              label: Text(context.knobs.string(
                label: 'Label',
                initialValue: 'Discover',
              )),
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Accent Gradient',
            builder: (context) => SealTextButton.accentGradient(
              label: Text(context.knobs.string(
                label: 'Label',
                initialValue: 'Explore',
              )),
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'With Icon',
            builder: (context) => SealTextButton.primary(
              label: Text(context.knobs.string(
                label: 'Label',
                initialValue: 'Skip',
              )),
              icon: LucideIcons.arrowRight,
              onPressed: () {},
            ),
          ),
          WidgetbookUseCase(
            name: 'Custom',
            builder: (context) => SealTextButton.custom(
              label: Text(context.knobs.string(
                label: 'Label',
                initialValue: 'Retry',
              )),
              color: context.knobs.object.dropdown<Color>(
                label: 'Color',
                options: [
                  ColorX.red,
                  ColorX.teal,
                  ColorX.orange,
                  ColorX.indigo,
                  ColorX.pink,
                ],
                initialOption: ColorX.red,
                labelBuilder: (v) => v.toString(),
              ),
              isLoading: context.knobs.boolean(
                label: 'Loading',
                initialValue: false,
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'SealFilledIconButton',
        useCases: [
          WidgetbookUseCase(
            name: 'Primary',
            builder: (context) => SealFilledIconButton.primary(
              icon: LucideIcons.plus,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Add item',
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Accent',
            builder: (context) => SealFilledIconButton.accent(
              icon: LucideIcons.star,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Favorite',
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Accent Secondary',
            builder: (context) => SealFilledIconButton.accentSecondary(
              icon: LucideIcons.pencil,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Edit',
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Gradient',
            builder: (context) => SealFilledIconButton.gradient(
              icon: LucideIcons.rocket,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Launch',
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Accent Gradient',
            builder: (context) => SealFilledIconButton.accentGradient(
              icon: LucideIcons.zap,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Boost',
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Custom',
            builder: (context) => SealFilledIconButton.custom(
              icon: LucideIcons.trash2,
              color: context.knobs.object.dropdown<Color>(
                label: 'Color',
                options: [
                  ColorX.red,
                  ColorX.teal,
                  ColorX.orange,
                  ColorX.indigo,
                  ColorX.pink,
                ],
                initialOption: ColorX.red,
                labelBuilder: (v) => v.toString(),
              ),
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Delete',
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'SealOutlineIconButton',
        useCases: [
          WidgetbookUseCase(
            name: 'Primary',
            builder: (context) => SealOutlineIconButton.primary(
              icon: LucideIcons.share2,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Share',
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Accent',
            builder: (context) => SealOutlineIconButton.accent(
              icon: LucideIcons.bookmark,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Save',
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Accent Secondary',
            builder: (context) => SealOutlineIconButton.accentSecondary(
              icon: LucideIcons.slidersHorizontal,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Filter',
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Gradient',
            builder: (context) => SealOutlineIconButton.gradient(
              icon: LucideIcons.sparkles,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Magic',
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Accent Gradient',
            builder: (context) => SealOutlineIconButton.accentGradient(
              icon: LucideIcons.zap,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Boost',
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Custom',
            builder: (context) => SealOutlineIconButton.custom(
              icon: LucideIcons.triangleAlert,
              color: context.knobs.object.dropdown<Color>(
                label: 'Color',
                options: [
                  ColorX.red,
                  ColorX.teal,
                  ColorX.orange,
                  ColorX.indigo,
                  ColorX.pink,
                ],
                initialOption: ColorX.orange,
                labelBuilder: (v) => v.toString(),
              ),
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Warning',
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'SealIconButton',
        useCases: [
          WidgetbookUseCase(
            name: 'Primary',
            builder: (context) => SealIconButton.primary(
              icon: LucideIcons.x,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Close',
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Accent',
            builder: (context) => SealIconButton.accent(
              icon: LucideIcons.ellipsisVertical,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'More',
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Accent Secondary',
            builder: (context) => SealIconButton.accentSecondary(
              icon: LucideIcons.info,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Info',
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Gradient',
            builder: (context) => SealIconButton.gradient(
              icon: LucideIcons.slidersHorizontal,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Filter',
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Accent Gradient',
            builder: (context) => SealIconButton.accentGradient(
              icon: LucideIcons.search,
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Search',
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
          WidgetbookUseCase(
            name: 'Custom',
            builder: (context) => SealIconButton.custom(
              icon: LucideIcons.star,
              color: context.knobs.object.dropdown<Color>(
                label: 'Color',
                options: [
                  ColorX.red,
                  ColorX.teal,
                  ColorX.orange,
                  ColorX.indigo,
                  ColorX.pink,
                ],
                initialOption: ColorX.teal,
                labelBuilder: (v) => v.toString(),
              ),
              tooltip: context.knobs.string(
                label: 'Tooltip',
                initialValue: 'Favorite',
              ),
              onPressed:
                  context.knobs.boolean(label: 'Enabled', initialValue: true)
                  ? () {}
                  : null,
            ),
          ),
        ],
      ),
    ],
  );
}

// ── Inputs ───────────────────────────────────────────────────────────────────

WidgetbookFolder _buildInputsFolder() {
  return WidgetbookFolder(
    name: 'Inputs',
    children: [
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
                          initialValue: 'You agree to our Terms of Service.',
                        ),
                      )
                    : null,
              );
            },
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
    ],
  );
}

// ── Interaction ──────────────────────────────────────────────────────────────

WidgetbookFolder _buildInteractionFolder() {
  return WidgetbookFolder(
    name: 'Interaction',
    children: [
      WidgetbookComponent(
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
      ),
    ],
  );
}

// ── Feedback ─────────────────────────────────────────────────────────────────

WidgetbookFolder _buildFeedbackFolder() {
  return WidgetbookFolder(
    name: 'Feedback',
    children: [
      WidgetbookComponent(
        name: 'SealProgress',
        useCases: [
          WidgetbookUseCase(
            name: 'Determinate',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealProgress(
                value: context.knobs.double.slider(
                  label: 'Value',
                  initialValue: 0.6,
                  min: 0,
                  max: 1,
                ),
                useAccent: context.knobs.boolean(
                  label: 'Accent',
                  initialValue: false,
                ),
              ),
            ),
          ),
          WidgetbookUseCase(
            name: 'Indeterminate',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealProgress(
                useAccent: context.knobs.boolean(
                  label: 'Accent',
                  initialValue: false,
                ),
              ),
            ),
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'SealLoader',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) {
              final size = context.knobs.object.dropdown<SealLoaderSize>(
                label: 'Size',
                options: SealLoaderSize.values,
                initialOption: SealLoaderSize.medium,
                labelBuilder: (s) => s.name,
              );
              final showLabel = context.knobs.boolean(
                label: 'Show Label',
                initialValue: false,
              );
              return SealLoader(
                size: size,
                label: showLabel ? 'Loading…' : null,
              );
            },
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'SealToast',
        useCases: [
          WidgetbookUseCase(
            name: 'Info',
            builder: (context) {
              final message = context.knobs.string(
                label: 'Message',
                initialValue: 'Something you should know.',
              );
              final title = context.knobs.string(
                label: 'Title',
                initialValue: 'Info',
              );
              return SealFilledButton.primary(
                label: const Text('Show Info Toast'),
                onPressed: () => SealToast.info(
                  message: Text(message),
                  title: title.isEmpty ? null : Text(title),
                ).show(context),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'Success',
            builder: (context) {
              final message = context.knobs.string(
                label: 'Message',
                initialValue: 'Your changes have been saved.',
              );
              final title = context.knobs.string(
                label: 'Title',
                initialValue: 'Success',
              );
              return SealFilledButton.accent(
                label: const Text('Show Success Toast'),
                onPressed: () => SealToast.success(
                  message: Text(message),
                  title: title.isEmpty ? null : Text(title),
                ).show(context),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'Warning',
            builder: (context) {
              final message = context.knobs.string(
                label: 'Message',
                initialValue: 'This action might have side effects.',
              );
              final title = context.knobs.string(
                label: 'Title',
                initialValue: 'Warning',
              );
              return SealFilledButton.primary(
                label: const Text('Show Warning Toast'),
                onPressed: () => SealToast.warning(
                  message: Text(message),
                  title: title.isEmpty ? null : Text(title),
                ).show(context),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'Error',
            builder: (context) {
              final message = context.knobs.string(
                label: 'Message',
                initialValue: 'Something went wrong. Please try again.',
              );
              final title = context.knobs.string(
                label: 'Title',
                initialValue: 'Error',
              );
              final showAction = context.knobs.boolean(
                label: 'Show Action',
                initialValue: false,
              );
              return SealFilledButton.primary(
                label: const Text('Show Error Toast'),
                onPressed: () => SealToast.error(
                  message: Text(message),
                  title: title.isEmpty ? null : Text(title),
                  actionLabel: showAction ? const Text('Retry') : null,
                  onAction: showAction ? () {} : null,
                ).show(context),
              );
            },
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'SealAlert',
        useCases: [
          WidgetbookUseCase(
            name: 'Info',
            builder: (context) {
              final title = context.knobs.string(
                label: 'Title',
                initialValue: 'Heads up!',
              );
              final description = context.knobs.string(
                label: 'Description',
                initialValue: 'You can add components using the CLI.',
              );
              return SealAlert.info(
                title: title.isEmpty ? null : title,
                description: description,
              );
            },
          ),
          WidgetbookUseCase(
            name: 'Success',
            builder: (context) {
              final title = context.knobs.string(
                label: 'Title',
                initialValue: 'Profile updated',
              );
              final description = context.knobs.string(
                label: 'Description',
                initialValue: 'Your changes have been saved successfully.',
              );
              return SealAlert.success(
                title: title.isEmpty ? null : title,
                description: description,
              );
            },
          ),
          WidgetbookUseCase(
            name: 'Warning',
            builder: (context) {
              final title = context.knobs.string(
                label: 'Title',
                initialValue: 'Low storage',
              );
              final description = context.knobs.string(
                label: 'Description',
                initialValue: 'You have less than 1 GB remaining.',
              );
              return SealAlert.warning(
                title: title.isEmpty ? null : title,
                description: description,
              );
            },
          ),
          WidgetbookUseCase(
            name: 'Error',
            builder: (context) {
              final title = context.knobs.string(
                label: 'Title',
                initialValue: 'Upload failed',
              );
              final description = context.knobs.string(
                label: 'Description',
                initialValue:
                    'The file could not be uploaded. Please try again.',
              );
              return SealAlert.error(
                title: title.isEmpty ? null : title,
                description: description,
              );
            },
          ),
        ],
      ),
    ],
  );
}
