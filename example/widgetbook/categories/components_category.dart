// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'package:nebula_ui/nebula_ui.dart';

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
        name: 'NebulaFilledButton',
        useCases: [
          WidgetbookUseCase(
            name: 'Primary',
            builder: (context) => Center(
              child: NebulaFilledButton.primary(
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
          ),
          WidgetbookUseCase(
            name: 'Accent',
            builder: (context) => Center(
              child: NebulaFilledButton.accent(
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
          ),
          WidgetbookUseCase(
            name: 'Accent Secondary',
            builder: (context) => Center(
              child: NebulaFilledButton.accentSecondary(
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
          ),
          WidgetbookUseCase(
            name: 'Gradient',
            builder: (context) => Center(
              child: NebulaFilledButton.gradient(
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
          ),
          WidgetbookUseCase(
            name: 'Accent Gradient',
            builder: (context) => Center(
              child: NebulaFilledButton.accentGradient(
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
          ),
          WidgetbookUseCase(
            name: 'With Icon',
            builder: (context) => Center(
              child: NebulaFilledButton.gradient(
                label: context.knobs.string(
                  label: 'Label',
                  initialValue: 'Explore',
                ),
                icon: Icons.rocket_launch_rounded,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'NebulaOutlineButton',
        useCases: [
          WidgetbookUseCase(
            name: 'Primary',
            builder: (context) => Center(
              child: NebulaOutlineButton.primary(
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
          ),
          WidgetbookUseCase(
            name: 'Accent',
            builder: (context) => Center(
              child: NebulaOutlineButton.accent(
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
          ),
          WidgetbookUseCase(
            name: 'Accent Secondary',
            builder: (context) => Center(
              child: NebulaOutlineButton.accentSecondary(
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
          ),
          WidgetbookUseCase(
            name: 'Gradient',
            builder: (context) => Center(
              child: NebulaOutlineButton.gradient(
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
          ),
          WidgetbookUseCase(
            name: 'Accent Gradient',
            builder: (context) => Center(
              child: NebulaOutlineButton.accentGradient(
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
          ),
          WidgetbookUseCase(
            name: 'With Icon',
            builder: (context) => Center(
              child: NebulaOutlineButton.primary(
                label: context.knobs.string(
                  label: 'Label',
                  initialValue: 'Favorite',
                ),
                icon: Icons.star_outline_rounded,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'NebulaTextButton',
        useCases: [
          WidgetbookUseCase(
            name: 'Primary',
            builder: (context) => Center(
              child: NebulaTextButton.primary(
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
          ),
          WidgetbookUseCase(
            name: 'Accent',
            builder: (context) => Center(
              child: NebulaTextButton.accent(
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
          ),
          WidgetbookUseCase(
            name: 'Accent Secondary',
            builder: (context) => Center(
              child: NebulaTextButton.accentSecondary(
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
          ),
          WidgetbookUseCase(
            name: 'Gradient',
            builder: (context) => Center(
              child: NebulaTextButton.gradient(
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
          ),
          WidgetbookUseCase(
            name: 'Accent Gradient',
            builder: (context) => Center(
              child: NebulaTextButton.accentGradient(
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
          ),
          WidgetbookUseCase(
            name: 'With Icon',
            builder: (context) => Center(
              child: NebulaTextButton.primary(
                label: context.knobs.string(
                  label: 'Label',
                  initialValue: 'Skip',
                ),
                icon: Icons.arrow_forward_rounded,
                onPressed: () {},
              ),
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
        name: 'NebulaTextField',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: NebulaTextField(
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
              child: NebulaTextField(
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
        name: 'NebulaLoader',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) {
              final size = context.knobs.object.dropdown<NebulaLoaderSize>(
                label: 'Size',
                options: NebulaLoaderSize.values,
                initialOption: NebulaLoaderSize.medium,
                labelBuilder: (s) => s.name,
              );
              final showLabel = context.knobs.boolean(
                label: 'Show Label',
                initialValue: false,
              );
              return Center(
                child: NebulaLoader(
                  size: size,
                  label: showLabel ? 'Loading…' : null,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
