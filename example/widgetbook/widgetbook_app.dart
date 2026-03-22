import 'package:flutter/material.dart' show Theme, ThemeData;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:widgetbook/widgetbook.dart';

import 'package:seal_ui/seal_ui.dart';

import 'seal_documentation_addon.dart';

import 'categories/components_category.dart';
import 'categories/layout_category.dart';
import 'categories/tokens_category.dart';

/// Entry point for the Seal UI Widgetbook catalog.
///
/// Run with:
/// ```sh
/// flutter run -t widgetbook/widgetbook_app.dart
/// ```
void main() {
  runApp(const SealWidgetbook());
}

class SealWidgetbook extends StatelessWidget {
  const SealWidgetbook({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      appBuilder: (context, child) => ShadApp(
        debugShowCheckedModeBanner: false,
        home: SealThemeScope(
          tokens: NebulaThemeFactory.tokens(),
          // Theme wrapper satisfies `Theme.of(context)` calls inside
          // widgetbook_documentation_addon, which reads brightness to decide
          // its card background color. Without this it always returns light.
          child: Theme(
            data: ThemeData(brightness: Brightness.dark),
            child: child,
          ),
        ),
      ),
      addons: [
        SealDocumentationAddon(assetBundle: rootBundle),
        ThemeAddon<SealThemeTokens>(
          themes: [
            WidgetbookTheme(
              name: 'Nebula · Dark',
              data: NebulaThemeFactory.tokens(),
            ),
            WidgetbookTheme(
              name: 'Nebula · Light',
              data: NebulaThemeFactory.tokens(brightness: Brightness.light),
            ),
            WidgetbookTheme(
              name: 'Arctic · Light',
              data: ArcticThemeFactory.tokens(),
            ),
            WidgetbookTheme(
              name: 'Arctic · Dark',
              data: ArcticThemeFactory.tokens(brightness: Brightness.dark),
            ),
            WidgetbookTheme(
              name: 'Deep Ocean · Dark',
              data: DeepOceanThemeFactory.tokens(),
            ),
            WidgetbookTheme(
              name: 'Deep Ocean · Light',
              data: DeepOceanThemeFactory.tokens(brightness: Brightness.light),
            ),
          ],
          themeBuilder: (context, theme, child) {
            return SealThemeScope(
              tokens: theme,
              child: ColoredBox(color: theme.colors.background, child: child),
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
