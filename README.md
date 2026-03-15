# Seal UI

A **token-driven Flutter Design System** with space-inspired aesthetics, layered architecture, and responsive scaling.

Purple-based palettes, subtle gradients, and a dark-first experience — designed to be reusable across multiple applications.

## Features

- **Design Tokens** — colors, typography, gradients, spacing, and radius managed as structured tokens
- **Dark & Light Themes** — dark mode is the primary experience, with full light theme support
- **Responsive Scaling** — typography and spacing scale proportionally across mobile, tablet, and desktop
- **Layered Architecture** — strict `foundation → tokens → theme → components` dependency direction
- **Material Integration** — extends and composes Material widgets with token-driven styling
- **Widgetbook Catalog** — visual component catalog for browsing and testing every component

## Quick Start

```dart
import 'package:seal_ui/seal_ui.dart';

MaterialApp(
  theme: SealThemeFactory.dark(),
  builder: (context, child) {
    final scaleFactor = SealResponsive.scaleOf(context);
    final tokens = SealThemeFactory.darkTokens(scaleFactor: scaleFactor);
    return SealTheme(tokens: tokens, child: child!);
  },
  home: const MyHomePage(),
);
```

Access tokens anywhere via context extensions:

```dart
final colors = context.themeTokens.colors;
final typo = context.themeTokens.typography;
padding: EdgeInsets.all(context.dimension.lg),
context.dimension.md.verticalGap,
```

## Architecture

```
foundation → tokens → theme → components
```

| Layer | Purpose |
|---|---|
| **foundation** | Breakpoints, responsive utilities |
| **tokens** | Color palettes, typography, gradients, spacing, radius |
| **theme** | Token container, theme factory, InheritedWidget |
| **components** | Buttons, inputs, containers, loaders |

## Components

- `SealPrimaryButton` — solid and gradient variants, loading state, optional icon
- `SealTextField` — token-styled text input with prefix/suffix icons
- `SealContainer` — surface box with optional gradient and border
- `SealLoader` — spinner with size presets and optional label

## Commands

```sh
flutter analyze                                          # Static analysis
flutter test                                             # Package tests
cd example && flutter run                                # Example app
cd example && flutter run -t widgetbook/widgetbook_app.dart  # Component catalog
```
