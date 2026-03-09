import 'package:flutter/material.dart';
import 'package:nebula_ui/nebula_ui.dart';

import 'sections/buttons_section.dart';
import 'sections/cards_section.dart';
import 'sections/containers_section.dart';
import 'sections/inputs_section.dart';
import 'sections/loader_section.dart';
import 'sections/snackbar_section.dart';

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
    final colors = context.themeTokens.colors;
    final typo = context.themeTokens.typography;
    final dimension = context.dimension;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(dimension.lg),
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
                  NebulaIconButton.gradient(
                    icon: isDark
                        ? Icons.light_mode_rounded
                        : Icons.dark_mode_rounded,
                    onPressed: onToggleTheme,
                  ),
                ],
              ),
              dimension.xxs.verticalGap,
              Text(
                'A token-driven Flutter Design System with space-inspired aesthetics.',
                style: typo.body.copyWith(color: colors.textSecondary),
              ),
              dimension.xl.verticalGap,
              const ButtonsSection(),
              dimension.xl.verticalGap,
              const InputsSection(),
              dimension.xl.verticalGap,
              const ContainersSection(),
              dimension.xl.verticalGap,
              const CardsSection(),
              dimension.xl.verticalGap,
              const LoaderSection(),
              dimension.xl.verticalGap,
              const SnackbarSection(),
              dimension.xxxl.verticalGap,
            ],
          ),
        ),
      ),
    );
  }
}
