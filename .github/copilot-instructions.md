# Nebula UI — AI Agent Instructions

## Project Overview

Nebula UI is a **token-driven Flutter Design System package** that extends Material widgets.
It is designed to be reusable across multiple applications — it is **not** a standalone app.

The visual identity is inspired by space aesthetics, purple-based palettes, subtle gradients, and modern developer tools. The feel is **modern, minimal, elegant, slightly futuristic, and professional**.

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
| **foundation** | Breakpoints, responsive utilities | `lib/src/foundation/` |
| **tokens** | Color palettes, typography, gradients, spacing, radius | `lib/src/tokens/` |
| **theme** | Token container, theme factory, InheritedWidget | `lib/src/theme/` |
| **components** | Reusable UI widgets (buttons, inputs, layout, feedback) | `lib/src/components/` |

### Token Architecture

Tokens follow an **abstraction + implementation** pattern:

- Abstract classes define the contract (e.g., `ColorPalette`, `TypographyTokens`, `GradientTokens`)
- Concrete classes provide the values (e.g., `DarkColorPalette`, `LightColorPalette`)
- Spacing and radius are static base-token classes (`NebulaDimension`, `NebulaRadius`)

### Responsive Scaling

Typography and spacing scale proportionally across breakpoints via a **scale factor**:

| Device  | Factor  |
|---------|---------|
| mobile  | `1.0`   |
| tablet  | `1.125` |
| desktop | `1.5`   |
- `DefaultTypography(scaleFactor:)` produces proportionally scaled font sizes.
- `NebulaDimension(factor)` provides pre-scaled spacing values.
- `context.dimension` is the preferred way to access scaled spacing.
- `NebulaThemeFactory.darkTokens(scaleFactor:)` wires everything together.

### Theme System

- `NebulaThemeTokens` is the token container holding colors, typography, and gradients.
- `NebulaThemeFactory` builds dark/light `NebulaThemeTokens` and Material `ThemeData`.
- `NebulaTheme` is the `InheritedWidget` that provides tokens to the widget tree.

---

## Naming Conventions

- All public classes use the `Nebula` prefix: `NebulaTheme`, `NebulaPrimaryButton`, `NebulaTextField`, `NebulaContainer`, `NebulaLoader`, `NebulaDimension`, `NebulaRadius`, `NebulaBreakpoints`, `NebulaResponsive`.
- File names mirror class names in snake_case with the `nebula_` prefix: `nebula_theme.dart`, `nebula_primary_button.dart`, etc.
- Token abstractions keep their descriptive names without prefix: `ColorPalette`, `TypographyTokens`, `GradientTokens`.
- Implementations use descriptive names: `DarkColorPalette`, `LightColorPalette`, `DefaultTypography`, `DefaultGradients`.

---

## Public API

The barrel file `lib/nebula_ui.dart` exports only the **intended public API** — theme, components, and essential tokens.

Internal implementation details (`src/`) must remain private. Never import from `src/` directly in consuming apps.

---

## Coding Standards

### General

- Write **idiomatic Flutter/Dart** code.
- Always respect the configured linter (`package:flutter_lints`). Run `flutter analyze` and resolve all warnings before considering work done.
- Use `const` constructors wherever possible.
- Prefer `final` variables over mutable ones.

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
/// A themed container that wraps its [child] with Nebula surface styling.
///
/// Optionally applies a [gradient] background instead of a solid color.
///
/// ```dart
/// NebulaContainer(
///   showBorder: true,
///   child: Text('Hello'),
/// )
/// ```
class NebulaContainer extends StatelessWidget { ... }
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
// Fall back to dark tokens when no ancestor NebulaTheme is found,
// since dark is the primary experience.
return widget?.tokens ?? NebulaThemeFactory.darkTokens();
```

### Context Extensions

- **Always prefer `BuildContext` extensions** over static `of(context)` calls.
- Use `context.themeTokens` instead of `NebulaTheme.of(context)` to access design tokens.
- Use `context.dimension` instead of `NebulaDimension.of(context)` to access scaled spacing.
- Use the `NebulaDimensionDouble` extension for gaps: `dimension.md.verticalGap`, `dimension.sm.horizontalGap`, `dimension.lg.squareGap`.

```dart
// ✅ Good
final tokens = context.themeTokens;
final colors = tokens.colors;
padding: EdgeInsets.all(context.dimension.lg),

// ✅ Good — gap via extension
context.dimension.md.verticalGap,
context.dimension.sm.horizontalGap,

// ❌ Bad
final tokens = NebulaTheme.of(context);
SizedBox(height: context.dimension.md),
```

### Components

- Components must use **design tokens** — never hardcode colors, spacing, or typography.
- Access tokens via `context.themeTokens`.
- Respect `NebulaDimension` for padding/margins and `NebulaRadius` for border radius.
- Integrate with Material — extend or compose Material widgets, don't fight them.
- Design for future extension: prefer composition, accept optional parameters.

### Testing

- Avoid `pumpAndSettle()` when the widget tree contains indefinite animations (e.g., `NebulaLoader`). Use `pump()` instead.
- Test files live in `test/` mirroring the `lib/src/` structure.

### Widgetbook

- The component catalog lives in `example/widgetbook/widgetbook_app.dart`.
- Components are organized into categories: **Components**, **Tokens**, **Layout**.
- Every new component should include at least one Widgetbook use case.
- Run with: `cd example && flutter run -t widgetbook/widgetbook_app.dart`

---

## New Component Checklist

When adding a new component to Nebula UI, follow these steps in order:

1. **Create the widget file** in the appropriate subfolder under `lib/src/components/` (e.g., `buttons/`, `inputs/`, `feedback/`, `layout/`).
   - File name: `nebula_<component_name>.dart` (snake_case with `nebula_` prefix).
   - Class name: `Nebula<ComponentName>` (PascalCase with `Nebula` prefix).
   - Use design tokens via `context.themeTokens` — never hardcode colors, spacing, or typography.
   - Use `context.dimension` for padding/margins and `NebulaRadius` for border radius.
   - Compose or extend Material widgets.
   - Add `///` doc comments to the class and all public members.

2. **Export in the barrel file** `lib/nebula_ui.dart` under the `Components` section, keeping alphabetical order within each subfolder group.

3. **Write tests** in `test/` mirroring the `lib/src/` path (e.g., `test/components/buttons/nebula_outline_button_test.dart`).
   - Wrap widgets with `NebulaTheme` + `MaterialApp` in test helpers.
   - Test: rendering, interaction (tap/enabled/disabled), loading state, and icon/slot variants.
   - Use `pump()` instead of `pumpAndSettle()` when indefinite animations are present.

4. **Add Widgetbook use cases** in `example/widgetbook/widgetbook_app.dart`.
   - Place the new `WidgetbookComponent` inside the correct `WidgetbookFolder` and category.
   - Include at least one use case with relevant knobs (string, boolean, dropdown).

5. **Update the example app** in `example/lib/main.dart` to showcase the new component.

6. **Run validation**:
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
| `google_fonts` | Inter font family for typography tokens |
| `widgetbook` | Component catalog and visual testing |
| `flutter_lints` | Lint rules |
