// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'package:nebula_ui/nebula_ui.dart';

/// Entry point for the Nebula UI Widgetbook catalog.
///
/// Run with:
/// ```sh
/// flutter run -t widgetbook/widgetbook_app.dart
/// ```
void main() {
  runApp(const NebulaWidgetbook());
}

class NebulaWidgetbook extends StatelessWidget {
  const NebulaWidgetbook({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      appBuilder: (context, child) {
        return NebulaTheme(
          tokens: NebulaThemeFactory.darkTokens(),
          child: child,
        );
      },
      addons: [
        ThemeAddon<NebulaThemeTokens>(
          themes: [
            WidgetbookTheme(
              name: 'Dark',
              data: NebulaThemeFactory.darkTokens(),
            ),
            WidgetbookTheme(
              name: 'Light',
              data: NebulaThemeFactory.lightTokens(),
            ),
          ],
          themeBuilder: (context, theme, child) {
            final isDark = theme.colors is DarkColorPalette;
            return NebulaTheme(
              tokens: theme,
              child: Theme(
                data: isDark
                    ? NebulaThemeFactory.dark()
                    : NebulaThemeFactory.light(),
                child: ColoredBox(color: theme.colors.background, child: child),
              ),
            );
          },
        ),
        ViewportAddon([
          ViewportData(
            name: 'iPhone 13',
            width: 390,
            height: 844,
            pixelRatio: 3,
            platform: TargetPlatform.iOS,
          ),
          ViewportData(
            name: 'iPad Pro 11"',
            width: 834,
            height: 1194,
            pixelRatio: 2,
            platform: TargetPlatform.iOS,
          ),
          ViewportData(
            name: 'Desktop',
            width: 1440,
            height: 900,
            pixelRatio: 2,
            platform: TargetPlatform.macOS,
          ),
        ]),
        GridAddon(50),
        AlignmentAddon(),
      ],
      directories: [
        // ── Components ───────────────────────────────────────────────────
        WidgetbookCategory(
          name: 'Components',
          children: [
            WidgetbookFolder(
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
                              context.knobs.boolean(
                                label: 'Enabled',
                                initialValue: true,
                              )
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
                              context.knobs.boolean(
                                label: 'Enabled',
                                initialValue: true,
                              )
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
                              context.knobs.boolean(
                                label: 'Enabled',
                                initialValue: true,
                              )
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
                              context.knobs.boolean(
                                label: 'Enabled',
                                initialValue: true,
                              )
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
                              context.knobs.boolean(
                                label: 'Enabled',
                                initialValue: true,
                              )
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
                              context.knobs.boolean(
                                label: 'Enabled',
                                initialValue: true,
                              )
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
                              context.knobs.boolean(
                                label: 'Enabled',
                                initialValue: true,
                              )
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
                              context.knobs.boolean(
                                label: 'Enabled',
                                initialValue: true,
                              )
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
                              context.knobs.boolean(
                                label: 'Enabled',
                                initialValue: true,
                              )
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
                              context.knobs.boolean(
                                label: 'Enabled',
                                initialValue: true,
                              )
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
                              context.knobs.boolean(
                                label: 'Enabled',
                                initialValue: true,
                              )
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
                              context.knobs.boolean(
                                label: 'Enabled',
                                initialValue: true,
                              )
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
                              context.knobs.boolean(
                                label: 'Enabled',
                                initialValue: true,
                              )
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
                              context.knobs.boolean(
                                label: 'Enabled',
                                initialValue: true,
                              )
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
                              context.knobs.boolean(
                                label: 'Enabled',
                                initialValue: true,
                              )
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
            ),
            WidgetbookFolder(
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
            ),
            WidgetbookFolder(
              name: 'Feedback',
              children: [
                WidgetbookComponent(
                  name: 'NebulaLoader',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) {
                        final size = context.knobs.object
                            .dropdown<NebulaLoaderSize>(
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
            ),
          ],
        ),

        // ── Tokens ───────────────────────────────────────────────────────
        WidgetbookCategory(
          name: 'Tokens',
          children: [
            WidgetbookFolder(
              name: 'Colors',
              children: [
                WidgetbookComponent(
                  name: 'Palette Overview',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'All Colors',
                      builder: (context) {
                        final tokens = context.themeTokens;
                        final dimension = context.dimension;
                        final colors = tokens.colors;
                        final entries = <String, Color>{
                          'primary': colors.primary,
                          'primaryTint': colors.primaryTint,
                          'primaryShade': colors.primaryShade,
                          'accent': colors.accent,
                          'accentSecondary': colors.accentSecondary,
                          'background': colors.background,
                          'surface': colors.surface,
                          'surfaceAlt': colors.surfaceAlt,
                          'textPrimary': colors.textPrimary,
                          'textSecondary': colors.textSecondary,
                          'border': colors.border,
                          'success': colors.success,
                          'warning': colors.warning,
                          'error': colors.error,
                        };

                        return SingleChildScrollView(
                          padding: EdgeInsets.all(dimension.lg),
                          child: Wrap(
                            spacing: dimension.sm,
                            runSpacing: dimension.sm,
                            children: entries.entries.map((e) {
                              return _ColorSwatch(
                                name: e.key,
                                color: e.value,
                                textColor: tokens.colors.textPrimary,
                              );
                            }).toList(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            WidgetbookFolder(
              name: 'Typography',
              children: [
                WidgetbookComponent(
                  name: 'Type Scale',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'All Styles',
                      builder: (context) {
                        final tokens = context.themeTokens;
                        final dimension = context.dimension;
                        final typo = tokens.typography;
                        final color = tokens.colors.textPrimary;

                        return SingleChildScrollView(
                          padding: EdgeInsets.all(dimension.lg),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Display',
                                style: typo.display.copyWith(color: color),
                              ),
                              dimension.md.verticalGap,
                              Text(
                                'Headline',
                                style: typo.headline.copyWith(color: color),
                              ),
                              dimension.md.verticalGap,
                              Text(
                                'Title',
                                style: typo.title.copyWith(color: color),
                              ),
                              dimension.md.verticalGap,
                              Text(
                                'Body — The quick brown fox jumps over the lazy dog.',
                                style: typo.body.copyWith(color: color),
                              ),
                              dimension.md.verticalGap,
                              Text(
                                'Small — The quick brown fox jumps over the lazy dog.',
                                style: typo.small.copyWith(color: color),
                              ),
                              dimension.md.verticalGap,
                              Text(
                                'CAPTION — METADATA & LABELS',
                                style: typo.caption.copyWith(color: color),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            WidgetbookFolder(
              name: 'Gradients',
              children: [
                WidgetbookComponent(
                  name: 'Gradient Preview',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'All Gradients',
                      builder: (context) {
                        final tokens = context.themeTokens;
                        final dimension = context.dimension;
                        final gradients = tokens.gradients;

                        return SingleChildScrollView(
                          padding: EdgeInsets.all(dimension.lg),
                          child: Column(
                            children: [
                              _GradientPreview(
                                label: 'Primary Gradient',
                                gradient: gradients.primaryGradient,
                                textColor: tokens.colors.textPrimary,
                              ),
                              dimension.md.verticalGap,
                              _GradientPreview(
                                label: 'Accent Gradient',
                                gradient: gradients.accentGradient,
                                textColor: tokens.colors.textPrimary,
                              ),
                              dimension.md.verticalGap,
                              _GradientPreview(
                                label: 'Surface Gradient',
                                gradient: gradients.surfaceGradient,
                                textColor: tokens.colors.textPrimary,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        // ── Layout ───────────────────────────────────────────────────────
        WidgetbookCategory(
          name: 'Layout',
          children: [
            WidgetbookFolder(
              name: 'Cards',
              children: [
                WidgetbookComponent(
                  name: 'NebulaCard',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) {
                        final tokens = context.themeTokens;
                        final colors = tokens.colors;
                        final typo = tokens.typography;
                        return Center(
                          child: NebulaCard(
                            showBorder: context.knobs.boolean(
                              label: 'Show Border',
                              initialValue: true,
                            ),
                            elevation: context.knobs.object.dropdown<double>(
                              label: 'Elevation',
                              options: [0, 2, 4, 8],
                              initialOption: 2,
                              labelBuilder: (v) => v.toString(),
                            ),
                            header: Text(
                              context.knobs.string(
                                label: 'Header',
                                initialValue: 'Card Title',
                              ),
                              style: typo.title.copyWith(
                                color: colors.textPrimary,
                              ),
                            ),
                            body: Text(
                              'This is the card body with some descriptive content.',
                              style: typo.body.copyWith(
                                color: colors.textSecondary,
                              ),
                            ),
                            footer: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                NebulaTextButton.primary(
                                  label: 'Cancel',
                                  onPressed: () {},
                                ),
                                NebulaFilledButton.primary(
                                  label: 'Confirm',
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    WidgetbookUseCase(
                      name: 'With Gradient',
                      builder: (context) {
                        final tokens = context.themeTokens;
                        final colors = tokens.colors;
                        final typo = tokens.typography;
                        return Center(
                          child: NebulaCard(
                            gradient: tokens.gradients.surfaceGradient,
                            showBorder: false,
                            header: Text(
                              'Gradient Card',
                              style: typo.title.copyWith(
                                color: colors.textPrimary,
                              ),
                            ),
                            body: Text(
                              'A card with a gradient background.',
                              style: typo.body.copyWith(
                                color: colors.textPrimary,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    WidgetbookUseCase(
                      name: 'Tappable',
                      builder: (context) {
                        final tokens = context.themeTokens;
                        final colors = tokens.colors;
                        final typo = tokens.typography;
                        return Center(
                          child: NebulaCard(
                            onTap: () {},
                            header: Row(
                              children: [
                                Icon(
                                  Icons.touch_app_rounded,
                                  color: colors.primary,
                                ),
                                SizedBox(width: context.dimension.xs),
                                Expanded(
                                  child: Text(
                                    'Tappable Card',
                                    style: typo.title.copyWith(
                                      color: colors.textPrimary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            body: Text(
                              'Tap this card to trigger an action.',
                              style: typo.body.copyWith(
                                color: colors.textSecondary,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            WidgetbookFolder(
              name: 'Containers',
              children: [
                WidgetbookComponent(
                  name: 'NebulaContainer',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) {
                        final tokens = context.themeTokens;
                        return Center(
                          child: NebulaContainer(
                            showBorder: context.knobs.boolean(
                              label: 'Show Border',
                              initialValue: true,
                            ),
                            child: Text(
                              'Nebula UI Container',
                              style: tokens.typography.body.copyWith(
                                color: tokens.colors.textPrimary,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    WidgetbookUseCase(
                      name: 'With Gradient',
                      builder: (context) {
                        final tokens = context.themeTokens;
                        return Center(
                          child: NebulaContainer(
                            gradient: tokens.gradients.surfaceGradient,
                            showBorder: true,
                            child: Text(
                              'Gradient surface container',
                              style: tokens.typography.body.copyWith(
                                color: tokens.colors.textPrimary,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            WidgetbookFolder(
              name: 'Spacing',
              children: [
                WidgetbookComponent(
                  name: 'Spacing Scale',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Visual Guide',
                      builder: (context) {
                        final tokens = context.themeTokens;
                        final dimension = context.dimension;
                        final entries = <String, double>{
                          'xxxs (2)': dimension.xxxs,
                          'xxs (4)': dimension.xxs,
                          'xs (8)': dimension.xs,
                          'sm (12)': dimension.sm,
                          'md (16)': dimension.md,
                          'lg (24)': dimension.lg,
                          'xl (32)': dimension.xl,
                          'xxl (48)': dimension.xxl,
                          'xxxl (64)': dimension.xxxl,
                        };

                        return SingleChildScrollView(
                          padding: EdgeInsets.all(dimension.lg),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: entries.entries.map((e) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: dimension.sm),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 90,
                                      child: Text(
                                        e.key,
                                        style: tokens.typography.caption
                                            .copyWith(
                                              color:
                                                  tokens.colors.textSecondary,
                                            ),
                                      ),
                                    ),
                                    Container(
                                      width: e.value,
                                      height: dimension.md,
                                      decoration: BoxDecoration(
                                        color: tokens.colors.primary,
                                        borderRadius:
                                            NebulaRadius.borderRadiusXs,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

// ── Helper widgets for Widgetbook previews ─────────────────────────────────

class _ColorSwatch extends StatelessWidget {
  const _ColorSwatch({
    required this.name,
    required this.color,
    required this.textColor,
  });

  final String name;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: color,
            borderRadius: NebulaRadius.borderRadiusSm,
            border: Border.all(color: textColor.withValues(alpha: 0.12)),
          ),
        ),
        context.dimension.xxs.verticalGap,
        Text(name, style: TextStyle(fontSize: 10, color: textColor)),
      ],
    );
  }
}

class _GradientPreview extends StatelessWidget {
  const _GradientPreview({
    required this.label,
    required this.gradient,
    required this.textColor,
  });

  final String label;
  final LinearGradient gradient;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: NebulaRadius.borderRadiusMd,
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}
