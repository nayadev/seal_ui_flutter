import 'package:flutter/material.dart' show Theme, ThemeData;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show App;

import 'package:seal_ui/seal_ui.dart';

import 'seal_documentation_addon.dart';
import 'widgetbook_app.directories.g.dart';

/// Entry point for the Seal UI Widgetbook catalog.
///
/// Run with:
/// ```sh
/// flutter run -t widgetbook/widgetbook_app.dart
/// ```
void main() {
  runApp(const SealWidgetbook());
}

@App()
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
              name: 'Arctic · Dark',
              data: ArcticThemeFactory.tokens(brightness: Brightness.dark),
            ),
            WidgetbookTheme(
              name: 'Arctic · Light',
              data: ArcticThemeFactory.tokens(),
            ),
            WidgetbookTheme(
              name: 'Deep Ocean · Dark',
              data: DeepOceanThemeFactory.tokens(),
            ),
            WidgetbookTheme(
              name: 'Deep Ocean · Light',
              data: DeepOceanThemeFactory.tokens(brightness: Brightness.light),
            ),
            WidgetbookTheme(
              name: 'Terminal · Dark',
              data: TerminalThemeFactory.tokens(),
            ),
            WidgetbookTheme(
              name: 'Terminal · Light',
              data: TerminalThemeFactory.tokens(brightness: Brightness.light),
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
            name: 'iPhone 17',
            width: 402,
            height: 874,
            pixelRatio: 3,
            platform: TargetPlatform.iOS,
          ),
          ViewportData(
            name: 'iPad Pro 11" M4',
            width: 834,
            height: 1210,
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
        AlignmentAddon(),
      ],
      directories: directories,
    );
  }
}
