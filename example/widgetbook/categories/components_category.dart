// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'package:seal_ui/seal_ui.dart';

/// Builds the **Components** category for the Widgetbook catalog.
WidgetbookCategory buildComponentsCategory() {
  return WidgetbookCategory(
    name: 'Components',
    children: [
      _buildButtonsFolder(),
      _buildInputsFolder(),
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
              label: context.knobs.string(
                label: 'Label',
                initialValue: 'Get Started',
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
          WidgetbookUseCase(
            name: 'Accent',
            builder: (context) => SealFilledButton.accent(
              label: context.knobs.string(
                label: 'Label',
                initialValue: 'Continue',
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
          WidgetbookUseCase(
            name: 'Accent Secondary',
            builder: (context) => SealFilledButton.accentSecondary(
              label: context.knobs.string(
                label: 'Label',
                initialValue: 'Confirm',
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
          WidgetbookUseCase(
            name: 'Gradient',
            builder: (context) => SealFilledButton.gradient(
              label: context.knobs.string(
                label: 'Label',
                initialValue: 'Launch',
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
          WidgetbookUseCase(
            name: 'Accent Gradient',
            builder: (context) => SealFilledButton.accentGradient(
              label: context.knobs.string(
                label: 'Label',
                initialValue: 'Boost',
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
          WidgetbookUseCase(
            name: 'With Icon',
            builder: (context) => SealFilledButton.gradient(
              label: context.knobs.string(
                label: 'Label',
                initialValue: 'Explore',
              ),
              icon: Icons.rocket_launch_rounded,
              onPressed: () {},
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
              label: context.knobs.string(
                label: 'Label',
                initialValue: 'Cancel',
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
          WidgetbookUseCase(
            name: 'Accent',
            builder: (context) => SealOutlineButton.accent(
              label: context.knobs.string(
                label: 'Label',
                initialValue: 'Details',
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
          WidgetbookUseCase(
            name: 'Accent Secondary',
            builder: (context) => SealOutlineButton.accentSecondary(
              label: context.knobs.string(
                label: 'Label',
                initialValue: 'Info',
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
          WidgetbookUseCase(
            name: 'Gradient',
            builder: (context) => SealOutlineButton.gradient(
              label: context.knobs.string(
                label: 'Label',
                initialValue: 'Explore',
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
          WidgetbookUseCase(
            name: 'Accent Gradient',
            builder: (context) => SealOutlineButton.accentGradient(
              label: context.knobs.string(
                label: 'Label',
                initialValue: 'Discover',
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
          WidgetbookUseCase(
            name: 'With Icon',
            builder: (context) => SealOutlineButton.primary(
              label: context.knobs.string(
                label: 'Label',
                initialValue: 'Favorite',
              ),
              icon: Icons.star_outline_rounded,
              onPressed: () {},
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
              label: context.knobs.string(
                label: 'Label',
                initialValue: 'Learn more',
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
          WidgetbookUseCase(
            name: 'Accent',
            builder: (context) => SealTextButton.accent(
              label: context.knobs.string(
                label: 'Label',
                initialValue: 'Details',
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
          WidgetbookUseCase(
            name: 'Accent Secondary',
            builder: (context) => SealTextButton.accentSecondary(
              label: context.knobs.string(
                label: 'Label',
                initialValue: 'Info',
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
          WidgetbookUseCase(
            name: 'Gradient',
            builder: (context) => SealTextButton.gradient(
              label: context.knobs.string(
                label: 'Label',
                initialValue: 'Discover',
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
          WidgetbookUseCase(
            name: 'Accent Gradient',
            builder: (context) => SealTextButton.accentGradient(
              label: context.knobs.string(
                label: 'Label',
                initialValue: 'Explore',
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
          WidgetbookUseCase(
            name: 'With Icon',
            builder: (context) => SealTextButton.primary(
              label: context.knobs.string(
                label: 'Label',
                initialValue: 'Skip',
              ),
              icon: Icons.arrow_forward_rounded,
              onPressed: () {},
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
              icon: Icons.add_rounded,
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
              icon: Icons.star_rounded,
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
              icon: Icons.edit_rounded,
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
              icon: Icons.rocket_launch_rounded,
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
              icon: Icons.bolt_rounded,
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
        ],
      ),
      WidgetbookComponent(
        name: 'SealOutlineIconButton',
        useCases: [
          WidgetbookUseCase(
            name: 'Primary',
            builder: (context) => SealOutlineIconButton.primary(
              icon: Icons.share_rounded,
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
              icon: Icons.bookmark_outline_rounded,
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
              icon: Icons.tune_rounded,
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
              icon: Icons.auto_awesome_rounded,
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
              icon: Icons.flash_on_rounded,
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
        ],
      ),
      WidgetbookComponent(
        name: 'SealIconButton',
        useCases: [
          WidgetbookUseCase(
            name: 'Primary',
            builder: (context) => SealIconButton.primary(
              icon: Icons.close_rounded,
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
              icon: Icons.more_vert_rounded,
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
              icon: Icons.info_outline_rounded,
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
              icon: Icons.tune_rounded,
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
              icon: Icons.search_rounded,
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
                    ? Icons.email_outlined
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
                prefixIcon: Icons.lock_outline,
                suffixIcon: Icons.visibility_off_outlined,
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
        name: 'SealSnackbar',
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
                initialValue: '',
              );
              final alignment = context.knobs.object
                  .dropdown<SealSnackbarAlignment>(
                    label: 'Alignment',
                    options: SealSnackbarAlignment.values,
                    initialOption: SealSnackbarAlignment.top,
                    labelBuilder: (a) => a.name,
                  );
              return SealFilledButton.primary(
                label: 'Show Info Snackbar',
                onPressed: () => SealSnackbar.info(
                  message: message,
                  title: title.isEmpty ? null : title,
                  alignment: alignment,
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
              final alignment = context.knobs.object
                  .dropdown<SealSnackbarAlignment>(
                    label: 'Alignment',
                    options: SealSnackbarAlignment.values,
                    initialOption: SealSnackbarAlignment.top,
                    labelBuilder: (a) => a.name,
                  );
              return SealFilledButton.accent(
                label: 'Show Success Snackbar',
                onPressed: () => SealSnackbar.success(
                  message: message,
                  title: title.isEmpty ? null : title,
                  alignment: alignment,
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
              final alignment = context.knobs.object
                  .dropdown<SealSnackbarAlignment>(
                    label: 'Alignment',
                    options: SealSnackbarAlignment.values,
                    initialOption: SealSnackbarAlignment.top,
                    labelBuilder: (a) => a.name,
                  );
              return SealFilledButton.primary(
                label: 'Show Warning Snackbar',
                onPressed: () => SealSnackbar.warning(
                  message: message,
                  title: title.isEmpty ? null : title,
                  alignment: alignment,
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
              final alignment = context.knobs.object
                  .dropdown<SealSnackbarAlignment>(
                    label: 'Alignment',
                    options: SealSnackbarAlignment.values,
                    initialOption: SealSnackbarAlignment.top,
                    labelBuilder: (a) => a.name,
                  );
              final showAction = context.knobs.boolean(
                label: 'Show Action',
                initialValue: false,
              );
              return SealFilledButton.primary(
                label: 'Show Error Snackbar',
                onPressed: () => SealSnackbar.error(
                  message: message,
                  title: title.isEmpty ? null : title,
                  alignment: alignment,
                  actionLabel: showAction ? 'Retry' : null,
                  onAction: showAction ? () {} : null,
                ).show(context),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'Custom',
            builder: (context) {
              final message = context.knobs.string(
                label: 'Message',
                initialValue: 'Achievement unlocked!',
              );
              final title = context.knobs.string(
                label: 'Title',
                initialValue: 'Congrats',
              );
              final alignment = context.knobs.object
                  .dropdown<SealSnackbarAlignment>(
                    label: 'Alignment',
                    options: SealSnackbarAlignment.values,
                    initialOption: SealSnackbarAlignment.top,
                    labelBuilder: (a) => a.name,
                  );
              final useGradient = context.knobs.boolean(
                label: 'Use Gradient',
                initialValue: true,
              );
              final showAction = context.knobs.boolean(
                label: 'Show Action',
                initialValue: false,
              );
              return SealFilledButton.gradient(
                label: 'Show Custom Snackbar',
                onPressed: () => SealSnackbar.custom(
                  message: message,
                  title: title.isEmpty ? null : title,
                  icon: Icons.emoji_events_rounded,
                  color: useGradient
                      ? null
                      : context.themeTokens.colors.primary,
                  gradient: useGradient
                      ? context.themeTokens.gradients.primaryGradient
                      : null,
                  alignment: alignment,
                  actionLabel: showAction ? 'View' : null,
                  onAction: showAction ? () {} : null,
                ).show(context),
              );
            },
          ),
        ],
      ),
    ],
  );
}
