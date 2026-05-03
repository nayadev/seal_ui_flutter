import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class ButtonsFolder extends WidgetbookFolder {
  ButtonsFolder()
    : super(
        name: 'Buttons',
        children: [
          WidgetbookComponent(
            name: 'SealFilledButton',
            useCases: [
              WidgetbookUseCase(
                name: 'Primary',
                builder: (context) => SealFilledButton.primary(
                  label: Text(
                    context.knobs.string(
                      label: 'Label',
                      initialValue: 'Get Started',
                    ),
                  ),
                  isLoading: context.knobs.boolean(
                    label: 'Loading',
                    initialValue: false,
                  ),
                  onPressed:
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
                      ? () {}
                      : null,
                ),
              ),
              WidgetbookUseCase(
                name: 'Accent',
                builder: (context) => SealFilledButton.accent(
                  label: Text(
                    context.knobs.string(
                      label: 'Label',
                      initialValue: 'Continue',
                    ),
                  ),
                  isLoading: context.knobs.boolean(
                    label: 'Loading',
                    initialValue: false,
                  ),
                  onPressed:
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
                      ? () {}
                      : null,
                ),
              ),
              WidgetbookUseCase(
                name: 'Accent Secondary',
                builder: (context) => SealFilledButton.accentSecondary(
                  label: Text(
                    context.knobs.string(
                      label: 'Label',
                      initialValue: 'Confirm',
                    ),
                  ),
                  isLoading: context.knobs.boolean(
                    label: 'Loading',
                    initialValue: false,
                  ),
                  onPressed:
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
                      ? () {}
                      : null,
                ),
              ),
              WidgetbookUseCase(
                name: 'Gradient',
                builder: (context) => SealFilledButton.gradient(
                  label: Text(
                    context.knobs.string(
                      label: 'Label',
                      initialValue: 'Launch',
                    ),
                  ),
                  isLoading: context.knobs.boolean(
                    label: 'Loading',
                    initialValue: false,
                  ),
                  onPressed:
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
                      ? () {}
                      : null,
                ),
              ),
              WidgetbookUseCase(
                name: 'Accent Gradient',
                builder: (context) => SealFilledButton.accentGradient(
                  label: Text(
                    context.knobs.string(
                      label: 'Label',
                      initialValue: 'Boost',
                    ),
                  ),
                  isLoading: context.knobs.boolean(
                    label: 'Loading',
                    initialValue: false,
                  ),
                  onPressed:
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
                      ? () {}
                      : null,
                ),
              ),
              WidgetbookUseCase(
                name: 'With Icon',
                builder: (context) => SealFilledButton.gradient(
                  label: Text(
                    context.knobs.string(
                      label: 'Label',
                      initialValue: 'Explore',
                    ),
                  ),
                  icon: LucideIcons.rocket,
                  onPressed: () {},
                ),
              ),
              WidgetbookUseCase(
                name: 'Custom',
                builder: (context) => SealFilledButton.custom(
                  label: Text(
                    context.knobs.string(
                      label: 'Label',
                      initialValue: 'Delete',
                    ),
                  ),
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
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
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
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
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
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
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
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
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
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
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
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
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
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
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
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
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
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
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
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
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
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
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
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
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
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
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
                  label: Text(
                    context.knobs.string(
                      label: 'Label',
                      initialValue: 'Cancel',
                    ),
                  ),
                  isLoading: context.knobs.boolean(
                    label: 'Loading',
                    initialValue: false,
                  ),
                  onPressed:
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
                      ? () {}
                      : null,
                ),
              ),
              WidgetbookUseCase(
                name: 'Accent',
                builder: (context) => SealOutlineButton.accent(
                  label: Text(
                    context.knobs.string(
                      label: 'Label',
                      initialValue: 'Details',
                    ),
                  ),
                  isLoading: context.knobs.boolean(
                    label: 'Loading',
                    initialValue: false,
                  ),
                  onPressed:
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
                      ? () {}
                      : null,
                ),
              ),
              WidgetbookUseCase(
                name: 'Accent Secondary',
                builder: (context) => SealOutlineButton.accentSecondary(
                  label: Text(
                    context.knobs.string(
                      label: 'Label',
                      initialValue: 'Info',
                    ),
                  ),
                  isLoading: context.knobs.boolean(
                    label: 'Loading',
                    initialValue: false,
                  ),
                  onPressed:
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
                      ? () {}
                      : null,
                ),
              ),
              WidgetbookUseCase(
                name: 'Gradient',
                builder: (context) => SealOutlineButton.gradient(
                  label: Text(
                    context.knobs.string(
                      label: 'Label',
                      initialValue: 'Explore',
                    ),
                  ),
                  isLoading: context.knobs.boolean(
                    label: 'Loading',
                    initialValue: false,
                  ),
                  onPressed:
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
                      ? () {}
                      : null,
                ),
              ),
              WidgetbookUseCase(
                name: 'Accent Gradient',
                builder: (context) => SealOutlineButton.accentGradient(
                  label: Text(
                    context.knobs.string(
                      label: 'Label',
                      initialValue: 'Discover',
                    ),
                  ),
                  isLoading: context.knobs.boolean(
                    label: 'Loading',
                    initialValue: false,
                  ),
                  onPressed:
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
                      ? () {}
                      : null,
                ),
              ),
              WidgetbookUseCase(
                name: 'With Icon',
                builder: (context) => SealOutlineButton.primary(
                  label: Text(
                    context.knobs.string(
                      label: 'Label',
                      initialValue: 'Favorite',
                    ),
                  ),
                  icon: LucideIcons.star,
                  onPressed: () {},
                ),
              ),
              WidgetbookUseCase(
                name: 'Custom',
                builder: (context) => SealOutlineButton.custom(
                  label: Text(
                    context.knobs.string(
                      label: 'Label',
                      initialValue: 'Retry',
                    ),
                  ),
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
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
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
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
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
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
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
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
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
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
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
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
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
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
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
                  label: Text(
                    context.knobs.string(
                      label: 'Label',
                      initialValue: 'Learn more',
                    ),
                  ),
                  isLoading: context.knobs.boolean(
                    label: 'Loading',
                    initialValue: false,
                  ),
                  onPressed:
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
                      ? () {}
                      : null,
                ),
              ),
              WidgetbookUseCase(
                name: 'Accent',
                builder: (context) => SealTextButton.accent(
                  label: Text(
                    context.knobs.string(
                      label: 'Label',
                      initialValue: 'Details',
                    ),
                  ),
                  isLoading: context.knobs.boolean(
                    label: 'Loading',
                    initialValue: false,
                  ),
                  onPressed:
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
                      ? () {}
                      : null,
                ),
              ),
              WidgetbookUseCase(
                name: 'Accent Secondary',
                builder: (context) => SealTextButton.accentSecondary(
                  label: Text(
                    context.knobs.string(
                      label: 'Label',
                      initialValue: 'Info',
                    ),
                  ),
                  isLoading: context.knobs.boolean(
                    label: 'Loading',
                    initialValue: false,
                  ),
                  onPressed:
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
                      ? () {}
                      : null,
                ),
              ),
              WidgetbookUseCase(
                name: 'Gradient',
                builder: (context) => SealTextButton.gradient(
                  label: Text(
                    context.knobs.string(
                      label: 'Label',
                      initialValue: 'Discover',
                    ),
                  ),
                  isLoading: context.knobs.boolean(
                    label: 'Loading',
                    initialValue: false,
                  ),
                  onPressed:
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
                      ? () {}
                      : null,
                ),
              ),
              WidgetbookUseCase(
                name: 'Accent Gradient',
                builder: (context) => SealTextButton.accentGradient(
                  label: Text(
                    context.knobs.string(
                      label: 'Label',
                      initialValue: 'Explore',
                    ),
                  ),
                  isLoading: context.knobs.boolean(
                    label: 'Loading',
                    initialValue: false,
                  ),
                  onPressed:
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
                      ? () {}
                      : null,
                ),
              ),
              WidgetbookUseCase(
                name: 'With Icon',
                builder: (context) => SealTextButton.primary(
                  label: Text(
                    context.knobs.string(
                      label: 'Label',
                      initialValue: 'Skip',
                    ),
                  ),
                  icon: LucideIcons.arrowRight,
                  onPressed: () {},
                ),
              ),
              WidgetbookUseCase(
                name: 'Custom',
                builder: (context) => SealTextButton.custom(
                  label: Text(
                    context.knobs.string(
                      label: 'Label',
                      initialValue: 'Retry',
                    ),
                  ),
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
                      context.knobs.boolean(
                        label: 'Enabled',
                        initialValue: true,
                      )
                      ? () {}
                      : null,
                ),
              ),
            ],
          ),
          WidgetbookComponent(
            name: 'SealSonner',
            useCases: [
              WidgetbookUseCase(
                name: 'Default',
                builder: (context) {
                  final dimension = context.dimension;
                  return Padding(
                    padding: EdgeInsets.all(dimension.lg),
                    child: SealSonner(
                      child: Builder(
                        builder: (ctx) => SealFilledButton.primary(
                          label: Text(
                            context.knobs.string(
                              label: 'Title',
                              initialValue: 'File saved',
                            ),
                          ),
                          onPressed: () => showSealSonner(
                            ctx,
                            title: Text(
                              context.knobs.string(
                                label: 'Title',
                                initialValue: 'File saved',
                              ),
                            ),
                            description:
                                context.knobs.boolean(
                                  label: 'Show description',
                                  initialValue: true,
                                )
                                ? Text(
                                    context.knobs.string(
                                      label: 'Description',
                                      initialValue:
                                          'Your changes have been synced.',
                                    ),
                                  )
                                : null,
                          ),
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
