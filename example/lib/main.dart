import 'package:flutter/material.dart';
import 'package:seal_ui/seal_ui.dart';

import 'sections/buttons_section.dart';
import 'sections/cards_section.dart';
import 'sections/containers_section.dart';
import 'sections/inputs_section.dart';
import 'sections/loader_section.dart';
import 'sections/feedback_section.dart';

/// Example app demonstrating the Seal UI Design System.
///
/// For the component catalog, run:
/// ```sh
/// flutter run -t widgetbook/widgetbook_app.dart
/// ```
void main() {
  runApp(const SealExampleApp());
}

/// The available Seal UI themes for runtime switching.
enum SealThemeOption {
  nebula('Nebula'),
  arctic('Arctic'),
  deepOcean('Deep Ocean');

  const SealThemeOption(this.label);

  /// Human-readable display name for this theme.
  final String label;
}

class SealExampleApp extends StatefulWidget {
  const SealExampleApp({super.key});

  @override
  State<SealExampleApp> createState() => _SealExampleAppState();
}

class _SealExampleAppState extends State<SealExampleApp> {
  SealThemeOption _activeTheme = SealThemeOption.nebula;
  Brightness _brightness = Brightness.dark;

  void _handleThemeChange(SealThemeOption option) =>
      setState(() => _activeTheme = option);

  void _toggleBrightness() => setState(() {
    _brightness = _brightness == Brightness.dark
        ? Brightness.light
        : Brightness.dark;
  });

  ThemeData _buildMaterialTheme() => switch (_activeTheme) {
    SealThemeOption.nebula => NebulaThemeFactory.themeData(
      brightness: _brightness,
    ),
    SealThemeOption.arctic => ArcticThemeFactory.themeData(
      brightness: _brightness,
    ),
    SealThemeOption.deepOcean => DeepOceanThemeFactory.themeData(
      brightness: _brightness,
    ),
  };

  SealThemeTokens _buildSealTokens(double scaleFactor) =>
      switch (_activeTheme) {
        SealThemeOption.nebula => NebulaThemeFactory.tokens(
          scaleFactor: scaleFactor,
          brightness: _brightness,
        ),
        SealThemeOption.arctic => ArcticThemeFactory.tokens(
          scaleFactor: scaleFactor,
          brightness: _brightness,
        ),
        SealThemeOption.deepOcean => DeepOceanThemeFactory.tokens(
          scaleFactor: scaleFactor,
          brightness: _brightness,
        ),
      };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seal UI — Example',
      debugShowCheckedModeBanner: false,
      theme: _buildMaterialTheme(),
      builder: (context, child) {
        final scaleFactor = SealResponsive.scaleOf(context);
        return SealThemeScope(
          tokens: _buildSealTokens(scaleFactor),
          child: child!,
        );
      },
      home: _ExampleHome(
        activeTheme: _activeTheme,
        brightness: _brightness,
        onThemeChanged: _handleThemeChange,
        onToggleBrightness: _toggleBrightness,
      ),
    );
  }
}

class _ExampleHome extends StatelessWidget {
  const _ExampleHome({
    required this.activeTheme,
    required this.brightness,
    required this.onThemeChanged,
    required this.onToggleBrightness,
  });

  final SealThemeOption activeTheme;
  final Brightness brightness;
  final ValueChanged<SealThemeOption> onThemeChanged;
  final VoidCallback onToggleBrightness;

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
                  Row(
                    children: [
                      _ThemeSelector(
                        activeTheme: activeTheme,
                        onThemeChanged: onThemeChanged,
                      ),
                      SealIconButton.primary(
                        icon: brightness == Brightness.dark
                            ? Icons.light_mode_rounded
                            : Icons.dark_mode_rounded,
                        onPressed: onToggleBrightness,
                        tooltip: brightness == Brightness.dark
                            ? 'Switch to light mode'
                            : 'Switch to dark mode',
                      ),
                    ],
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
              const FeedbackSection(),
              dimension.xxxl.verticalGap,
            ],
          ),
        ),
      ),
    );
  }
}

/// A compact dropdown that switches between the available Seal UI themes.
class _ThemeSelector extends StatelessWidget {
  const _ThemeSelector({
    required this.activeTheme,
    required this.onThemeChanged,
  });

  final SealThemeOption activeTheme;
  final ValueChanged<SealThemeOption> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;
    final typo = context.themeTokens.typography;
    final dimension = context.dimension;

    return SealContainer(
      color: colors.surfaceAlt,
      padding: EdgeInsets.symmetric(
        horizontal: dimension.sm,
        vertical: dimension.xs,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<SealThemeOption>(
          value: activeTheme,
          isDense: true,
          dropdownColor: colors.surfaceAlt,
          style: typo.small.copyWith(color: colors.textPrimary),
          icon: Row(
            children: [
              dimension.sm.horizontalGap,
              Icon(
                Icons.palette_outlined,
                size: context.dimension.scaled(
                  TypographyTokens.kDefaultButtonIconSize,
                ),
                color: colors.primary,
              ),
            ],
          ),
          items: SealThemeOption.values
              .map(
                (option) =>
                    DropdownMenuItem(value: option, child: Text(option.label)),
              )
              .toList(),
          onChanged: (option) {
            if (option != null) onThemeChanged(option);
          },
        ),
      ),
    );
  }
}
