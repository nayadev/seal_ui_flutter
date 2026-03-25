import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'sections/buttons_section.dart';
import 'sections/feedback_section.dart';
import 'sections/inputs_section.dart';
import 'sections/layout_section.dart';
import 'sections/overlay_section.dart';

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
  /// The Arctic theme — bright, icy blue surfaces.
  arctic('Arctic'),

  /// The Deep Ocean theme — dark navy surfaces with cyan accents.
  deepOcean('Deep Ocean'),

  /// The Nebula theme — space-inspired dark surfaces with purple accents.
  nebula('Nebula'),

  /// The Terminal theme — CRT-inspired near-black surfaces with phosphor tones.
  terminal('Terminal');

  const SealThemeOption(this.label);

  /// Human-readable display name for this theme.
  final String label;
}

/// Root widget for the Seal UI example application.
class SealExampleApp extends StatefulWidget {
  /// Creates the [SealExampleApp].
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
    _brightness =
        _brightness == Brightness.dark ? Brightness.light : Brightness.dark;
  });

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
        SealThemeOption.terminal => TerminalThemeFactory.tokens(
          scaleFactor: scaleFactor,
          brightness: _brightness,
        ),
      };

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      title: 'Seal UI — Example',
      debugShowCheckedModeBanner: false,
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

    return ColoredBox(
      color: colors.background,
      child: SafeArea(
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
                            ? LucideIcons.sun
                            : LucideIcons.moon,
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
                'A token-driven Flutter Design System with bold, curated themes.',
                style: typo.body.copyWith(color: colors.textSecondary),
              ),
              dimension.xl.verticalGap,
              const ButtonsSection(),
              dimension.xl.verticalGap,
              const FeedbackSection(),
              dimension.xl.verticalGap,
              const InputsSection(),
              dimension.xl.verticalGap,
              const LayoutSection(),
              dimension.xl.verticalGap,
              const OverlaySection(),
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
    return SealSelect<SealThemeOption>(
      key: ValueKey(activeTheme),
      value: activeTheme,
      onChanged: (option) {
        if (option != null) onThemeChanged(option);
      },
      options: SealThemeOption.values
          .map((option) => SealSelectOption(value: option, label: option.label))
          .toList(),
    );
  }
}
