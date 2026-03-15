import 'package:flutter/material.dart';
import 'package:seal_ui/seal_ui.dart';

import 'sections/buttons_section.dart';
import 'sections/cards_section.dart';
import 'sections/containers_section.dart';
import 'sections/inputs_section.dart';
import 'sections/loader_section.dart';
import 'sections/snackbar_section.dart';

/// Example app demonstrating the Seal UI Design System.
///
/// For the component catalog, run:
/// ```sh
/// flutter run -t widgetbook/widgetbook_app.dart
/// ```
void main() {
  runApp(const SealExampleApp());
}

class SealExampleApp extends StatefulWidget {
  const SealExampleApp({super.key});

  @override
  State<SealExampleApp> createState() => _SealExampleAppState();
}

class _SealExampleAppState extends State<SealExampleApp> {
  bool _isDark = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seal UI — Example',
      debugShowCheckedModeBanner: false,
      theme: _isDark ? SealThemeFactory.dark() : SealThemeFactory.light(),
      builder: (context, child) {
        final scaleFactor = SealResponsive.scaleOf(context);
        final tokens = _isDark
            ? SealThemeFactory.darkTokens(scaleFactor: scaleFactor)
            : SealThemeFactory.lightTokens(scaleFactor: scaleFactor);

        return SealTheme(tokens: tokens, child: child!);
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
                    'Seal UI',
                    style: typo.headline.copyWith(color: colors.primary),
                  ),
                  SealIconButton.gradient(
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
