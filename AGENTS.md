# Seal UI — AI Agent Instructions

## Project Overview

Seal UI is a **token-driven Flutter Design System package** built on top of [`shadcn_ui`](https://pub.dev/packages/shadcn_ui).
It is designed to be reusable across multiple applications — it is **not** a standalone app.

Each theme has its own distinct visual identity — from cosmic nebulae to vintage terminals — united by subtle gradients and a modern developer tool aesthetic. The feel is **modern, minimal, elegant, slightly futuristic, and professional**.

**Dark mode is the primary experience**, but a light theme must always be supported.

---

## Architecture

The codebase follows a strict **layered architecture**:

```
foundation → tokens → theme → components
```

**Dependency direction is strictly enforced — no layer may depend on a higher layer.**

| Layer | Purpose | Path |
|---|---|---|
| **foundation** | Breakpoints, responsive utilities, `SealUnderlineExtension` | `lib/src/foundation/` |
| **tokens** | Color palettes, typography, gradients, spacing, radius | `lib/src/tokens/` |
| **theme** | Token container, theme factory, InheritedWidget | `lib/src/theme/` |
| **components** | Reusable UI widgets (buttons, inputs, layout, feedback, overlay, interaction) | `lib/src/components/` |

### Token Architecture

Tokens follow an **abstraction + implementation** pattern:

- Abstract classes define the contract (e.g., `ColorPalette`, `TypographyTokens`, `GradientTokens`)
- Concrete classes bridge the external token package to Flutter (e.g., `NebulaColorPalette`, `NebulaLightColorPalette`, `DefaultTypography`)
- Spacing and radius are static base-token classes (`SealDimension`, `SealRadius`)

**`seal_ui_tokens` is the single source of truth for all token values.**
All raw values — colors, gradients, typography properties, spacing, radius, and constants — come exclusively from the `seal_ui_tokens` package (`SealBaseTokens`, `SealNebulaDarkTokens`, etc.).
The Flutter abstraction layer (`ColorPalette`, `TypographyTokens`, etc.) is a thin interface that components depend on; concrete implementations simply map `seal_ui_tokens` values into Flutter types.
Never hardcode hex colors, font sizes, or spacing literals in implementations — always reference a named token from `seal_ui_tokens`.

### Responsive Scaling

Typography and spacing scale proportionally across breakpoints via a **scale factor**:

| Device  | Factor  |
|---------|---------|
| mobile  | `1.0`   |
| tablet  | `1.125` |
| desktop | `1.333` |
- `DefaultTypography(scaleFactor:)` produces proportionally scaled font sizes.
- `SealDimension(factor)` provides pre-scaled spacing values.
- `context.dimension` is the preferred way to access scaled spacing.
- `SealThemeFactory.darkTokens(scaleFactor:)` wires everything together.

### Theme System

- `SealThemeTokens` is the token container holding colors, typography, and gradients.
- `SealThemeFactory` builds dark/light `SealThemeTokens` and `ShadThemeData` — no Material dependency.
- `SealThemeController` is a `ChangeNotifier` that allows runtime theme switching.
- `SealThemeProvider` is an `InheritedNotifier` that exposes the controller to the tree.
- `SealThemeScope` is the **recommended entry point** — it wires `ShadTheme`, `ShadToaster`, and `SealThemeProvider` together in a single widget.

### App Setup Pattern

Wrap your root widget with `SealThemeScope`. It automatically injects the shadcn theme, the toast system, and the Seal token provider:

```dart
ShadApp(
  builder: (context, child) => SealThemeScope(
    tokens: NebulaThemeFactory.tokens(),
    child: child!,
  ),
  home: MyHome(),
)
```

For runtime theme switching, use `SealThemeProvider` + `SealThemeController` directly:

```dart
final controller = SealThemeController(
  initialTokens: NebulaThemeFactory.tokens(),
);

ShadApp(
  builder: (context, child) => SealThemeProvider(
    controller: controller,
    child: child!,
  ),
  home: MyHome(),
)

// Switch theme at runtime:
controller.setTheme(ArcticThemeFactory.tokens());
```

### shadcn_ui Integration

Seal UI components are **thin, token-driven wrappers** over `shadcn_ui` primitives:

- **Never use raw `Shad*` widgets directly in consuming apps** — always use the `Seal*` wrappers.
- When building a new Seal component, **prefer composing an existing `Shad*` widget** rather than building from scratch with Material or basic Flutter widgets.
- Pass Seal design tokens (colors, typography, radius, spacing) into the `Shad*` widget's styling parameters.
- When a `Shad*` widget doesn't support the styling needed, wrap it with a `DecoratedBox`, `ClipRRect`, or similar Flutter primitive — do not reach for Material widgets.

**Key shadcn primitives currently in use:**

| `Shad*` primitive | Seal wrapper |
|---|---|
| `ShadForm` | `SealForm` — re-exports `SealFormState`, `SealFormFields`, `SealAutovalidateMode` |
| `ShadButton.raw(...)` | `SealFilledButton`, `SealOutlineButton`, `SealTextButton` |
| `ShadIconButton.raw(...)` | `SealFilledIconButton`, `SealOutlineIconButton`, `SealIconButton` |
| `ShadInput` | `SealTextField` |
| `ShadTextarea` | `SealTextarea` |
| `ShadCheckbox` | `SealCheckbox` |
| `ShadSwitch` | `SealSwitch` |
| `ShadSlider` | `SealSlider` |
| `ShadRadioGroup` / `ShadRadioItem` | `SealRadioGroup` / `SealRadioItem` |
| `ShadSelect` / `ShadOption` | `SealSelect` / `SealSelectOption` |
| `ShadAlert.raw(...)` | `SealAlert` |
| `ShadToast` / `ShadToaster` | `SealToast` |
| `ShadCard` | `SealCard` |
| `ShadDialog.raw(...)` | `SealDialog` |
| `ShadCalendar` | `SealCalendar` (`.multiple`, `.range`) — exports `SealDateTimeRange` typedef |
| `ShadDatePicker` | `SealDatePicker` (`.range`) — button-triggered popover calendar |
| `ShadTimePicker` | `SealTimePicker` (`.period`) — exports `SealTimeOfDay`, `SealDayPeriod`, `SealTimePickerController` typedefs |
| `ShadContextMenuRegion` / `ShadContextMenuItem` | `SealContextMenuRegion` / `SealContextMenuItem` (`.inset`) — exports `SealContextMenuController` typedef |
| `ShadMenubar` / `ShadMenubarItem` | `SealMenubar` / `SealMenubarItem` — exports `SealMenubarController` typedef |
| `ShadResizablePanelGroup` / `ShadResizablePanel` | `SealResizablePanelGroup` / `SealResizablePanel` — exports `SealResizableController` typedef |
| `ShadSonner` | `SealSonner` — show via `showSealSonner(context, title:, description:)` |
| `ShadInputOTP` / `ShadInputOTPGroup` / `ShadInputOTPSlot` | `SealInputOTP` / `SealInputOTPGroup` / `SealInputOTPSlot` |
| `ShadBreadcrumb` / `ShadBreadcrumbLink` / `ShadBreadcrumbSeparator` / `ShadBreadcrumbEllipsis` / `ShadBreadcrumbDropdown` / `ShadBreadcrumbDropMenuItem` | `SealBreadcrumb` / `SealBreadcrumbLink` / `SealBreadcrumbSeparator` / `SealBreadcrumbEllipsis` / `SealBreadcrumbDropdown` / `SealBreadcrumbDropMenuItem` |
| `ShadPopover` / `ShadPopoverController` | `SealPopover` / `SealPopoverController` |
| `ShadSheet` / `showShadSheet` | `SealSheet` / `showSealSheet` |
| `ShadAccordion` / `ShadAccordionItem` | `SealAccordion` / `SealAccordionItem` |
| `ShadTabs` / `ShadTabsList` / `ShadTabsContent` | `SealTabs` / `SealTab` |
| `ShadAvatar` | `SealAvatar` |
| `ShadBadge` | `SealBadge` |
| `ShadSeparator` | `SealSeparator` (`.vertical`) |
| `ShadTable` / `ShadTableCell` | `SealTable` (`.list`) / `SealTableCell` (`.header`, `.footer`) |
| `ShadTooltip` | `SealTooltip` |
| *(native Flutter)* | `SealPressable` — press-feedback animation wrapper; no `Shad*` equivalent |
| *(native Flutter)* | `SealBouncingDots` — animated bouncing-dot loading indicator; used internally by button loading states |

**Using a component inside another component:**
When a Seal component needs to render another interactive element (e.g., an action button inside a toast), always use the corresponding `Seal*` wrapper — never the underlying `Shad*` widget directly. If no existing `Seal*` variant supports the required styling, add a `custom` factory to the wrapper first.

---

## Naming Conventions

- All public classes use the `Seal` prefix: `SealTheme`, `SealFilledButton`, `SealTextField`, `SealContainer`, `SealLoader`, `SealDimension`, `SealRadius`, `SealBreakpoints`, `SealResponsive`.
- File names mirror class names in snake_case with the `seal_` prefix: `seal_theme.dart`, `seal_filled_button.dart`, etc.
- Token abstractions keep their descriptive names without prefix: `ColorPalette`, `TypographyTokens`, `GradientTokens`.
- Implementations use theme-specific and descriptive names: `NebulaColorPalette`, `NebulaLightColorPalette`, `DefaultTypography`, `NebulaGradients`.

---

## Public API

The barrel file `lib/seal_ui.dart` exports only the **intended public API** — theme, components, and essential tokens.

Internal implementation details (`src/`) must remain private. Never import from `src/` directly in consuming apps.

---

## Coding Standards

### General

- Write **idiomatic Flutter/Dart** code.
- Always respect the configured linter (`package:flutter_lints`). Run `flutter analyze` and resolve all warnings before considering work done.
- Use `const` constructors wherever possible.
- Prefer `final` variables over mutable ones.

### Import Policy

**Never import `package:flutter/material.dart` or `package:flutter/cupertino.dart`** in library code (`lib/`). Use the narrowest import that satisfies the need:

| Need | Import |
|---|---|
| Widgets, layout, gestures | `package:flutter/widgets.dart` |
| Colors, gradients, text styles | `package:flutter/painting.dart` |
| `Brightness`, `Color` | `dart:ui` |
| shadcn_ui primitives | `package:shadcn_ui/shadcn_ui.dart` |

Material imports are only acceptable in `example/` code that interacts with third-party packages that themselves require Material (e.g., `widgetbook_documentation_addon`). Even then, use `show` to import the minimum: `import 'package:flutter/material.dart' show Theme, ThemeData;`.

### Primitive Colors

Use the `ColorX` extension (from `lib/src/tokens/base/seal_colors.dart`) for raw color constants instead of `Colors.*`:

```dart
// ❌ Bad — requires material.dart
color: Colors.white,
color: Colors.red,

// ✅ Good
color: ColorX.white,
color: ColorX.red,
```

Available constants: `ColorX.white`, `ColorX.black`, `ColorX.transparent`, `ColorX.red`, `ColorX.teal`, `ColorX.orange`, `ColorX.indigo`, `ColorX.pink`. Add new primitives to `ColorX` when a raw color literal is needed more than once.

### Magic Numbers

- **Never use magic numbers.** Extract numeric literals into named constants, design tokens, or well-named variables.
- If a value is used in more than one place, it **must** be a shared constant.
- Even if used once, a literal without clear meaning should be assigned to a descriptive variable or constant.

```dart
// ❌ Bad
final lineHeight = fontSize * 1.2;
padding: EdgeInsets.all(16),

// ✅ Good
final lineHeight = fontSize * TypographyTokens.kDefaultLineHeightMultiplier;
padding: EdgeInsets.all(context.dimension.md),
```

### Early Return

- **Always prefer early return** to reduce nesting and improve readability.
- Guard clauses should come before the main logic.

```dart
// ✅ Good
void doSomething(String? value) {
  if (value == null) return;

  // main logic here
}

// ❌ Bad
void doSomething(String? value) {
  if (value != null) {
    // deeply nested logic
  }
}
```

### Documentation

- **All public APIs must be documented** using `///` doc comments that conform to [`dartdoc`](https://dart.dev/tools/dart-doc) standards.
- Start doc comments with a **single-sentence summary** (third person, present tense).
- Use `///` for all doc comments (never `/** */`).
- Document parameters, return values, and exceptions when non-obvious.
- Include code examples in doc comments for important classes and methods using fenced Dart blocks.
- Private members do **not** require documentation unless the logic is complex.

```dart
/// A themed container that wraps its [child] with Seal surface styling.
///
/// Optionally applies a [gradient] background instead of a solid color.
///
/// ```dart
/// SealContainer(
///   showBorder: true,
///   child: Text('Hello'),
/// )
/// ```
class SealContainer extends StatelessWidget { ... }
```

### Comments

- **Do not write obvious comments.** Comments should explain *why*, not *what*.
- Never comment self-explanatory code.

```dart
// ❌ Bad
// Returns the color palette
ColorPalette get colors => _colors;

// ❌ Bad
// Set loading to true
setState(() => _isLoading = true);

// ✅ Good — explains intent that isn't obvious
// Fall back to dark tokens when no SealThemeProvider ancestor is found,
// since dark is the primary experience.
return SealThemeProvider.maybeTokensOf(this) ?? SealThemeFactory.darkTokens();
```

### Context Extensions

- **Always prefer `BuildContext` extensions** over static `of(context)` calls.
- Use `context.themeTokens` to access design tokens.
- Use `context.dimension` instead of `SealDimension.of(context)` to access scaled spacing.
- Use the `SealDimensionDouble` extension for gaps: `dimension.md.verticalGap`, `dimension.sm.horizontalGap`, `dimension.lg.squareGap`.

```dart
// ✅ Good
final tokens = context.themeTokens;
final colors = tokens.colors;
padding: EdgeInsets.all(context.dimension.lg),

// ✅ Good — gap via extension
context.dimension.md.verticalGap,
context.dimension.sm.horizontalGap,

// ❌ Bad
final tokens = SealThemeProvider.of(context).tokens;
SizedBox(height: context.dimension.md),
```

### Components

- Components must use **design tokens** — never hardcode colors, spacing, or typography.
- Access tokens via `context.themeTokens`.
- Respect `SealDimension` for padding/margins and `SealRadius` for border radius.
- **Wrap `shadcn_ui` primitives** — do not compose raw Material or basic Flutter widgets when an equivalent `Shad*` widget exists.
- When using a Seal component inside another Seal component, always use the `Seal*` wrapper — never the underlying `Shad*` primitive.
- Design for future extension: prefer composition, accept optional parameters.

### Button Variants

All six button types follow a consistent variant pattern with named factories:

| Factory | Description |
|---|---|
| `.primary` | Brand primary color |
| `.accent` | Accent color |
| `.accentSecondary` | Muted accent |
| `.gradient` | Primary gradient fill |
| `.accentGradient` | Accent gradient fill |
| `.custom(color:)` | Arbitrary solid color |
| `.custom(gradient:)` | Arbitrary gradient |

The `custom` factory is available on all six button types (`SealFilledButton`, `SealOutlineButton`, `SealTextButton`, `SealFilledIconButton`, `SealOutlineIconButton`, `SealIconButton`).

### Responsive Dimensions

- **Every numeric value that affects visual size must scale responsively** — use `context.dimension` tokens or `context.dimension.scaled()` instead of raw constants.
- For standard spacing, use the named tokens: `dimension.xs`, `dimension.md`, `dimension.lg`, etc.
- For custom sizes (icon sizes, fallback font sizes, loader dimensions, etc.), wrap them with `context.dimension.scaled()`.
- This ensures all visual measurements participate in breakpoint scaling (mobile 1.0×, tablet 1.125×, desktop 1.5×).

```dart
// ❌ Bad — raw constant doesn't scale with breakpoint
Icon(icon, size: TypographyTokens.kDefaultButtonIconSize),

// ❌ Bad — hardcoded pixel value
Icon(icon, size: 18),

// ✅ Good — scales proportionally across breakpoints
Icon(icon, size: context.dimension.scaled(TypographyTokens.kDefaultButtonIconSize)),

// ✅ Good — standard spacing token already scales
padding: EdgeInsets.all(context.dimension.md),
```

### Font Sizes

- **Never write a raw `fontSize:` number in component code.** All font sizes must either come from a typography token or use `context.fontSize()` so they scale with the current breakpoint.
- Use typography tokens (`context.themeTokens.typography.body`, `.small`, etc.) as the primary source of truth — they are already breakpoint-scaled.
- For ad-hoc sizes that aren't in the token scale, use `context.fontSize(base)` — never a bare literal.
- Magic-number fallbacks (e.g., `?? 14`) must reference a named constant from `TypographyTokens` (e.g., `TypographyTokens.kSmallFontSize`).
- Token definitions inside `DefaultTypography` are exempt — they use the internal `_s()` helper which applies the scale factor at theme-build time.

```dart
// ❌ Bad — raw literal, doesn't scale with breakpoint
Text('Hello', style: TextStyle(fontSize: 48)),

// ✅ Good — scales proportionally across breakpoints
Text('Hello', style: TextStyle(fontSize: context.fontSize(48))),

// ✅ Good — token-driven (already scaled inside DefaultTypography)
Text('Hello', style: context.themeTokens.typography.display),

// ✅ Good — fallback uses a named constant, not a literal
final lineHeight = (style.fontSize ?? TypographyTokens.kSmallFontSize) * ...;
```

### Testing

- Avoid `pumpAndSettle()` when the widget tree contains indefinite animations (e.g., `SealLoader`). Use `pump()` instead.
- Test files live in `test/` mirroring the `lib/src/` structure.

### Widgetbook

- The component catalog lives in `example/widgetbook/widgetbook_app.dart`.
- Category builders are split into separate files under `example/widgetbook/categories/`.
- Components are organized into categories: **Components**, **Tokens**, **Layout**.
- Every new component should include at least one Widgetbook use case.
- Run with: `cd example && flutter run -t widgetbook/widgetbook_app.dart`

---

## New Component Checklist

When adding a new component to Seal UI, follow these steps in order:

1. **Create the widget file** in the appropriate subfolder under `lib/src/components/` (e.g., `buttons/`, `feedback/`, `inputs/`, `interaction/`, `layout/`, `overlay/`).
   - File name: `seal_<component_name>.dart` (snake_case with `seal_` prefix).
   - Class name: `Seal<ComponentName>` (PascalCase with `Seal` prefix).
   - **Wrap the closest `shadcn_ui` primitive** — check if a `Shad*` widget already covers the use case before building from scratch.
   - Use design tokens via `context.themeTokens` — never hardcode colors, spacing, or typography.
   - Use `context.dimension` for padding/margins and `SealRadius` for border radius.
   - Add `///` doc comments to the class and all public members.

2. **Export in the barrel file** `lib/seal_ui.dart` under the `Components` section, keeping alphabetical order within each subfolder group.

3. **Write tests** in `test/` mirroring the `lib/src/` path (e.g., `test/components/buttons/seal_outline_button_test.dart`).
   - Wrap widgets with `ShadApp` + `SealThemeScope` in test helpers — no Material dependency needed.
   - Test: rendering, interaction (tap/enabled/disabled), loading state, and icon/slot variants.
   - Use `pump()` instead of `pumpAndSettle()` when indefinite animations are present.

4. **Add Widgetbook use cases** in the appropriate category file under `example/widgetbook/categories/`.
   - Place the new `WidgetbookComponent` inside the correct `WidgetbookFolder` and category.
   - Include at least one use case with relevant knobs (string, boolean, dropdown).

5. **Create Widgetbook documentation snippets** for every use case added in the previous step.
   - For each `WidgetbookUseCase`, create a Markdown file at:
     `example/assets/markdown/<WidgetbookCategory>/<WidgetbookFolder>/<WidgetbookComponent>/<WidgetbookUseCase>.md`
   - All path segments must be **lowercased** and **spaces replaced by `-`** (mirrors the widgetbook URL `?path=` parameter).
   - Example: a use case named `"With Icon"` inside `Components > Buttons > SealFilledButton` maps to:
     `example/assets/markdown/components/buttons/sealfilledbutton/with-icon.md`
   - Each file must contain at minimum: a short description and a fenced `dart` code block with a minimal, copy-paste-ready snippet.
   - Declare the new folder in `example/pubspec.yaml` under `flutter: assets:` (one entry per directory, trailing `/`).

6. **Update the example app** in `example/lib/main.dart` to showcase the new component.

7. **Run validation**:
   - `flutter analyze` — must pass with zero warnings.
   - `flutter test` — all tests must pass.

---

## Project Commands

| Command | Purpose |
|---|---|
| `flutter analyze` | Run static analysis (package) |
| `flutter test` | Run package tests |
| `cd example && flutter run` | Run the example app |
| `cd example && flutter run -t widgetbook/widgetbook_app.dart` | Run the Widgetbook catalog |

---

## Key Dependencies

| Package | Purpose |
|---|---|
| `seal_ui_tokens` | External token package — single source of truth for all raw values (colors, gradients, typography, spacing, radius) |
| `shadcn_ui` | Component primitives and base theme system |
| `google_fonts` | Inter font family for typography tokens |
| `widgetbook` | Component catalog and visual testing |
| `flutter_lints` | Lint rules |
