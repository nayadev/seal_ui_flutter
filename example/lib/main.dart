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
              Wrap(
                spacing: context.dimension.sm,
                runSpacing: context.dimension.sm,
                children: [
                  NebulaPrimaryButton(label: 'Solid', onPressed: () {}),
                  NebulaPrimaryButton(
                    label: 'Gradient',
                    useGradient: true,
                    onPressed: () {},
                  ),
                  NebulaPrimaryButton(
                    label: 'Explore',
                    icon: Icons.rocket_launch_rounded,
                    useGradient: true,
                    onPressed: () {},
                  ),
                  const NebulaPrimaryButton(label: 'Disabled'),
                  const NebulaPrimaryButton(
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
