// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'package:nebula_ui/nebula_ui.dart';

import 'categories/components_category.dart';
import 'categories/layout_category.dart';
import 'categories/tokens_category.dart';

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
        buildComponentsCategory(),
        buildTokensCategory(),
        buildLayoutCategory(),
      ],
    );
  }
}
