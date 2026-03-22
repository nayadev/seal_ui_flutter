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
          WidgetbookUseCase(
            name: 'Custom',
            builder: (context) => SealFilledButton.custom(
              label: context.knobs.string(
                label: 'Label',
                initialValue: 'Delete',
              ),
              color: context.knobs.object.dropdown<Color>(
                label: 'Color',
                options: [Colors.red, Colors.teal, Colors.orange, Colors.indigo, Colors.pink],
                initialOption: Colors.red,
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
          WidgetbookUseCase(
            name: 'Custom',
            builder: (context) => SealOutlineButton.custom(
              label: context.knobs.string(
                label: 'Label',
                initialValue: 'Retry',
              ),
              color: context.knobs.object.dropdown<Color>(
                label: 'Color',
                options: [Colors.red, Colors.teal, Colors.orange, Colors.indigo, Colors.pink],
                initialOption: Colors.red,
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
          WidgetbookUseCase(
            name: 'Custom',
            builder: (context) => SealTextButton.custom(
              label: context.knobs.string(
                label: 'Label',
                initialValue: 'Retry',
              ),
              color: context.knobs.object.dropdown<Color>(
                label: 'Color',
                options: [Colors.red, Colors.teal, Colors.orange, Colors.indigo, Colors.pink],
                initialOption: Colors.red,
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
          WidgetbookUseCase(
            name: 'Custom',
            builder: (context) => SealFilledIconButton.custom(
              icon: Icons.delete_rounded,
              color: context.knobs.object.dropdown<Color>(
                label: 'Color',
                options: [Colors.red, Colors.teal, Colors.orange, Colors.indigo, Colors.pink],
                initialOption: Colors.red,
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
          WidgetbookUseCase(
            name: 'Custom',
            builder: (context) => SealOutlineIconButton.custom(
              icon: Icons.warning_rounded,
              color: context.knobs.object.dropdown<Color>(
                label: 'Color',
                options: [Colors.red, Colors.teal, Colors.orange, Colors.indigo, Colors.pink],
                initialOption: Colors.orange,
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
          WidgetbookUseCase(
            name: 'Custom',
            builder: (context) => SealIconButton.custom(
              icon: Icons.star_rounded,
              color: context.knobs.object.dropdown<Color>(
                label: 'Color',
                options: [Colors.red, Colors.teal, Colors.orange, Colors.indigo, Colors.pink],
                initialOption: Colors.teal,
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
                label: 'Show Info Toast',
                onPressed: () => SealToast.info(
                  message: message,
                  title: title.isEmpty ? null : title,
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
                label: 'Show Success Toast',
                onPressed: () => SealToast.success(
                  message: message,
                  title: title.isEmpty ? null : title,
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
                label: 'Show Warning Toast',
                onPressed: () => SealToast.warning(
                  message: message,
                  title: title.isEmpty ? null : title,
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
                label: 'Show Error Toast',
                onPressed: () => SealToast.error(
                  message: message,
                  title: title.isEmpty ? null : title,
                  actionLabel: showAction ? 'Retry' : null,
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
                initialValue:
                    'You have less than 1 GB remaining.',
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
