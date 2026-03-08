import 'package:flutter/material.dart';

import 'package:nebula_ui/nebula_ui.dart';

/// Example app demonstrating the Nebula UI Design System.
///
/// For the component catalog, run:
/// ```sh
/// flutter run -t widgetbook/widgetbook_app.dart
/// ```
void main() {
  runApp(const NebulaExampleApp());
}

class NebulaExampleApp extends StatefulWidget {
  const NebulaExampleApp({super.key});

  @override
  State<NebulaExampleApp> createState() => _NebulaExampleAppState();
}

class _NebulaExampleAppState extends State<NebulaExampleApp> {
  bool _isDark = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nebula UI — Example',
      debugShowCheckedModeBanner: false,
      theme: _isDark ? NebulaThemeFactory.dark() : NebulaThemeFactory.light(),
      builder: (context, child) {
        final scaleFactor = NebulaResponsive.scaleOf(context);
        final tokens = _isDark
            ? NebulaThemeFactory.darkTokens(scaleFactor: scaleFactor)
            : NebulaThemeFactory.lightTokens(scaleFactor: scaleFactor);

        return NebulaTheme(tokens: tokens, child: child!);
      },
      home: _ExampleHome(
        isDark: _isDark,
        onToggleTheme: () => setState(() => _isDark = !_isDark),
      ),
    );
  }
}

class _ExampleHome extends StatelessWidget {
  const _ExampleHome({required this.isDark, required this.onToggleTheme});

  final bool isDark;
  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(context.dimension.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nebula UI',
                    style: typo.headline.copyWith(color: colors.primary),
                  ),
                  IconButton(
                    icon: Icon(
                      isDark
                          ? Icons.light_mode_rounded
                          : Icons.dark_mode_rounded,
                      color: colors.textSecondary,
                    ),
                    onPressed: onToggleTheme,
                  ),
                ],
              ),
              context.dimension.xxs.verticalGap,
              Text(
                'A token-driven Flutter Design System with space-inspired aesthetics.',
                style: typo.body.copyWith(color: colors.textSecondary),
              ),

              context.dimension.xl.verticalGap,

              Text(
                'Buttons',
                style: typo.title.copyWith(color: colors.textPrimary),
              ),

              context.dimension.md.verticalGap,
              Text(
                'Filled',
                style: typo.subtitle.copyWith(color: colors.textSecondary),
              ),
              context.dimension.sm.verticalGap,
              Wrap(
                spacing: context.dimension.sm,
                runSpacing: context.dimension.sm,
                children: [
                  NebulaFilledButton.primary(
                    label: 'Primary',
                    onPressed: () {},
                  ),
                  NebulaFilledButton.accent(label: 'Accent', onPressed: () {}),
                  NebulaFilledButton.accentSecondary(
                    label: 'Accent Secondary',
                    onPressed: () {},
                  ),
                  NebulaFilledButton.gradient(
                    label: 'Gradient',
                    onPressed: () {},
                  ),
                  NebulaFilledButton.accentGradient(
                    label: 'Accent Gradient',
                    onPressed: () {},
                  ),
                  NebulaFilledButton.gradient(
                    label: 'Explore',
                    icon: Icons.rocket_launch_rounded,
                    onPressed: () {},
                  ),
                  const NebulaFilledButton.primary(label: 'Disabled'),
                  const NebulaFilledButton.primary(
                    label: 'Loading',
                    isLoading: true,
                    onPressed: null,
                  ),
                ],
              ),

              context.dimension.md.verticalGap,
              Text(
                'Outline',
                style: typo.subtitle.copyWith(color: colors.textSecondary),
              ),
              context.dimension.sm.verticalGap,
              Wrap(
                spacing: context.dimension.sm,
                runSpacing: context.dimension.sm,
                children: [
                  NebulaOutlineButton.primary(
                    label: 'Primary',
                    onPressed: () {},
                  ),
                  NebulaOutlineButton.accent(label: 'Accent', onPressed: () {}),
                  NebulaOutlineButton.accentSecondary(
                    label: 'Accent Secondary',
                    onPressed: () {},
                  ),
                  NebulaOutlineButton.gradient(
                    label: 'Gradient',
                    onPressed: () {},
                  ),
                  NebulaOutlineButton.accentGradient(
                    label: 'Accent Gradient',
                    onPressed: () {},
                  ),
                  NebulaOutlineButton.primary(
                    label: 'With Icon',
                    icon: Icons.star_outline_rounded,
                    onPressed: () {},
                  ),
                  const NebulaOutlineButton.primary(label: 'Disabled'),
                  const NebulaOutlineButton.primary(
                    label: 'Loading',
                    isLoading: true,
                    onPressed: null,
                  ),
                ],
              ),

              context.dimension.md.verticalGap,
              Text(
                'Text',
                style: typo.subtitle.copyWith(color: colors.textSecondary),
              ),
              context.dimension.sm.verticalGap,
              Wrap(
                spacing: context.dimension.sm,
                runSpacing: context.dimension.sm,
                children: [
                  NebulaTextButton.primary(label: 'Primary', onPressed: () {}),
                  NebulaTextButton.accent(label: 'Accent', onPressed: () {}),
                  NebulaTextButton.accentSecondary(
                    label: 'Accent Secondary',
                    onPressed: () {},
                  ),
                  NebulaTextButton.gradient(
                    label: 'Gradient',
                    onPressed: () {},
                  ),
                  NebulaTextButton.accentGradient(
                    label: 'Accent Gradient',
                    onPressed: () {},
                  ),
                  NebulaTextButton.primary(
                    label: 'With Icon',
                    icon: Icons.arrow_forward_rounded,
                    onPressed: () {},
                  ),
                  const NebulaTextButton.primary(label: 'Disabled'),
                  const NebulaTextButton.primary(
                    label: 'Loading',
                    isLoading: true,
                    onPressed: null,
                  ),
                ],
              ),

              context.dimension.xl.verticalGap,

              Text(
                'Inputs',
                style: typo.title.copyWith(color: colors.textPrimary),
              ),
              context.dimension.md.verticalGap,
              const NebulaTextField(
                label: 'Email',
                hint: 'you@example.com',
                prefixIcon: Icons.email_outlined,
              ),
              context.dimension.sm.verticalGap,
              const NebulaTextField(
                label: 'Password',
                hint: '••••••••',
                obscureText: true,
                prefixIcon: Icons.lock_outline,
                suffixIcon: Icons.visibility_off_outlined,
              ),

              context.dimension.xl.verticalGap,

              Text(
                'Container',
                style: typo.title.copyWith(color: colors.textPrimary),
              ),
              context.dimension.md.verticalGap,
              NebulaContainer(
                child: Row(
                  children: [
                    Icon(Icons.auto_awesome, color: colors.primary),
                    context.dimension.sm.horizontalGap,
                    Expanded(
                      child: Text(
                        'A NebulaContainer using surface color and border tokens.',
                        style: typo.body.copyWith(color: colors.textPrimary),
                      ),
                    ),
                  ],
                ),
              ),
              context.dimension.sm.verticalGap,
              NebulaContainer(
                gradient: tokens.gradients.surfaceGradient,
                child: Text(
                  'Gradient surface container.',
                  style: typo.body.copyWith(color: colors.textPrimary),
                ),
              ),

              context.dimension.xl.verticalGap,

              Text(
                'Card',
                style: typo.title.copyWith(color: colors.textPrimary),
              ),
              context.dimension.md.verticalGap,
              NebulaCard(
                header: Text(
                  'Nebula Card',
                  style: typo.title.copyWith(color: colors.textPrimary),
                ),
                body: Text(
                  'A themed card with header, body, and footer sections using design tokens.',
                  style: typo.body.copyWith(color: colors.textSecondary),
                ),
                footer: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    NebulaOutlineButton.primary(
                      label: 'Cancel',
                      onPressed: () {},
                    ),
                    context.dimension.sm.horizontalGap,
                    NebulaFilledButton.primary(
                      label: 'Confirm',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              context.dimension.sm.verticalGap,
              NebulaCard(
                gradient: tokens.gradients.surfaceGradient,
                showBorder: false,
                header: Row(
                  children: [
                    Icon(Icons.auto_awesome, color: colors.textPrimary),
                    context.dimension.xs.horizontalGap,
                    Text(
                      'Gradient Card',
                      style: typo.title.copyWith(color: colors.textPrimary),
                    ),
                  ],
                ),
                body: Text(
                  'A card with gradient background and no footer.',
                  style: typo.body.copyWith(color: colors.textPrimary),
                ),
              ),

              context.dimension.xl.verticalGap,

              Text(
                'Loader',
                style: typo.title.copyWith(color: colors.textPrimary),
              ),
              context.dimension.md.verticalGap,
              Row(
                spacing: context.dimension.lg,
                children: [
                  NebulaLoader(size: NebulaLoaderSize.small),
                  NebulaLoader(size: NebulaLoaderSize.medium),
                  NebulaLoader(size: NebulaLoaderSize.large),
                  NebulaLoader(
                    size: NebulaLoaderSize.medium,
                    label: 'Loading…',
                  ),
                ],
              ),

              context.dimension.xxxl.verticalGap,
            ],
          ),
        ),
      ),
    );
  }
}
