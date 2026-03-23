# Seal UI

A **token-driven Flutter Design System** with bold, curated themes, layered architecture, and responsive scaling.

Expressive palettes, subtle gradients, and a dark-first experience — designed to be reusable across multiple applications.

## Features

- **Design Tokens** — colors, typography, gradients, spacing, and radius managed as structured tokens
- **Dark & Light Themes** — dark mode is the primary experience, with full light theme support
- **4 Built-in Themes** — Nebula, Arctic, Deep Ocean, and Terminal, each with dark and light variants
- **Responsive Scaling** — typography and spacing scale proportionally across mobile, tablet, and desktop
- **Layered Architecture** — strict `foundation → tokens → theme → components` dependency direction
- **shadcn_ui Integration** — thin, token-driven wrappers over `shadcn_ui` primitives with no Material dependency
- **Widgetbook Catalog** — visual component catalog for browsing and testing every component

## Quick Start

```dart
import 'package:seal_ui/seal_ui.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

ShadApp(
  builder: (context, child) {
    final scaleFactor = SealResponsive.scaleOf(context);
    return SealThemeScope(
      tokens: NebulaThemeFactory.tokens(scaleFactor: scaleFactor),
      child: child!,
    );
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
| **components** | Buttons, inputs, layout, feedback, overlay, interaction |

## Themes

| Factory | Palette |
|---|---|
| `NebulaThemeFactory` | Cosmic purples and deep space blues |
| `ArcticThemeFactory` | Icy blues and crisp whites |
| `DeepOceanThemeFactory` | Deep teals and ocean depths |
| `TerminalThemeFactory` | Vintage terminal greens and amber |

All themes support dark and light brightness:

```dart
NebulaThemeFactory.tokens(brightness: Brightness.light)
```

## Components

### Buttons

| Component | Description |
|---|---|
| `SealFilledButton` | Solid filled button — primary, accent, gradient, and custom variants |
| `SealOutlineButton` | Border-only button with matching variant set |
| `SealTextButton` | Label-only button with matching variant set |
| `SealFilledIconButton` | Filled icon-only button |
| `SealOutlineIconButton` | Outline icon-only button |
| `SealIconButton` | Ghost icon-only button |

All six button types share the same variant factories: `.primary`, `.accent`, `.accentSecondary`, `.gradient`, `.accentGradient`, `.custom(color:)`, `.custom(gradient:)`.

### Inputs

| Component | Description |
|---|---|
| `SealForm` | Form state manager; integrates with any `ShadFormField` for coordinated validation and value collection |
| `SealCalendar` | Token-styled date picker; `.multiple` for multi-select, `.range` for date ranges |
| `SealDatePicker` | Button-triggered popover date picker; `.range` for date-range selection |
| `SealTimePicker` | Hour/minute/second input fields; `.period` for 12-hour AM/PM format |
| `SealInputOTP` / `SealInputOTPGroup` / `SealInputOTPSlot` | Token-styled OTP input; compose groups and slots for any digit layout |
| `SealCheckbox` | Token-styled checkbox with optional label and sublabel |
| `SealRadioGroup` / `SealRadioItem` | Radio button group, horizontal or vertical |
| `SealSelect` / `SealSelectOption` | Dropdown selector with optional label |
| `SealSlider` | Continuous or stepped range slider |
| `SealSwitch` | Toggle switch with optional label and sublabel |
| `SealTextarea` | Multi-line text input with optional label |
| `SealTextField` | Single-line text input with prefix/suffix icon support |

### Layout

| Component | Description |
|---|---|
| `SealAccordion` / `SealAccordionItem` | Collapsible content sections |
| `SealMenubar` / `SealMenubarItem` | Horizontal menu bar with dropdown menus; compose with `SealContextMenuItem` |
| `SealResizablePanelGroup` / `SealResizablePanel` | Drag-to-resize panel layout; horizontal or vertical axis |
| `SealBreadcrumb` / `SealBreadcrumbLink` | Token-styled breadcrumb navigation with separator, ellipsis, and dropdown support |
| `SealAvatar` | Circular avatar with image or placeholder fallback |
| `SealBadge` | Semantic status pill — primary, accent, secondary, outline, success, warning, error |
| `SealCard` | Themed surface card with header, body, footer, gradient, and tap support |
| `SealContainer` | Surface box with optional gradient and border |
| `SealSeparator` | Token-styled horizontal divider |
| `SealTable` / `SealTableCell` | Token-styled data table; `.list` for static data, builder constructor for large datasets |
| `SealTabs` / `SealTab` | Tabbed content switcher |

### Feedback

| Component | Description |
|---|---|
| `SealAlert` | Inline semantic banner — `.info`, `.success`, `.warning`, `.error` |
| `SealLoader` | Animated spinner with size presets (`small`, `medium`, `large`) and optional label |
| `SealProgress` | Determinate and indeterminate progress bar |
| `SealToast` | Transient notification — `.info`, `.success`, `.warning`, `.error`; shown via `.show(context)` |
| `SealSonner` | Stacked Sonner-style toasts; shown via `showSealSonner(context, title:, description:)` |

### Overlay

| Component | Description |
|---|---|
| `SealContextMenuRegion` | Right-click / long-press triggered menu; compose with `SealContextMenuItem` for items and nested submenus |
| `SealDialog` | Modal dialog with title, description, and actions; `.alert` variant for destructive confirmations |
| `SealPopover` | Token-styled floating panel anchored to any widget; controlled via `SealPopoverController` or `visible` |
| `SealSheet` | Slide-in panel from any edge via `showSealSheet`; smart safe-area padding per side |

`SealSheetSide` controls the sheet edge: `top`, `right`, `bottom` (default), `left`.

### Interaction

| Component | Description |
|---|---|
| `SealTooltip` | Token-styled tooltip wrapping any widget |

## Commands

```sh
flutter analyze                                          # Static analysis
flutter test                                             # Package tests
cd example && flutter run                                # Example app
cd example && flutter run -t widgetbook/widgetbook_app.dart  # Component catalog
```
