# SealUI Flutter

> Flutter implementation of the SealUI design system — token-driven components built on shadcn_ui primitives.

[![Release](https://img.shields.io/github/v/release/nayadev/seal_ui_flutter)](https://github.com/nayadev/seal_ui_flutter/releases)
[![License](https://img.shields.io/badge/license-MIT-32b88c)](./LICENSE)
[![Flutter](https://img.shields.io/badge/Flutter-%E2%89%A53.29-54c5f8)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-%5E3.11-0175c2)](https://dart.dev)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=nayadev_seal_ui_flutter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=nayadev_seal_ui_flutter)
[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=nayadev_seal_ui_flutter&metric=coverage)](https://sonarcloud.io/summary/new_code?id=nayadev_seal_ui_flutter)

---

## Overview

SealUI Flutter is the Flutter implementation of the SealUI design system. It consumes design tokens from [`seal_ui_tokens`](https://github.com/nayadev/seal_ui_tokens) and provides a library of Flutter widgets built on [shadcn_ui](https://pub.dev/packages/shadcn_ui) primitives.

**Dark mode is the primary experience.** Light mode is fully supported across all themes.

### Architecture

```
seal_ui_tokens  ──►  seal_ui_react
                ──►  seal_ui_flutter  (this repo)
```

Tokens are the single source of truth. Both the Flutter and React implementations consume them independently, ensuring visual consistency across platforms.

---

## Getting Started

### Installation

Add to `pubspec.yaml`:

```yaml
dependencies:
  seal_ui:
    git:
      url: https://github.com/nayadev/seal_ui_flutter.git
      ref: main
```

### Setup

Wrap your application with `ShadApp` and `SealThemeScope`:

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

---

## Theming

SealUI ships **4 themes × 2 modes**. Each theme has its own distinct visual identity:

| Theme | Personality |
| ----- | ----------- |
| `NebulaThemeFactory` | Cosmic purple — the default; deep space with violet brand |
| `ArcticThemeFactory` | Icy blue — clean and crisp, inspired by frozen tundra |
| `DeepOceanThemeFactory` | Abyssal blue — darker and more dramatic than arctic |
| `TerminalThemeFactory` | Hacker green — vintage terminal aesthetic |

### Switching at Runtime

```dart
NebulaThemeFactory.tokens(brightness: Brightness.light)
```

---

## Components

> Component library is being built progressively across sessions. ✅ = shipped · 🔜 = coming soon

| Component | Category | Status |
| --------- | -------- | ------ |
| `SealFilledButton` | Buttons | ✅ |
| `SealFilledIconButton` | Buttons | ✅ |
| `SealIconButton` | Buttons | ✅ |
| `SealOutlineButton` | Buttons | ✅ |
| `SealOutlineIconButton` | Buttons | ✅ |
| `SealTextButton` | Buttons | ✅ |
| `SealAlert` | Feedback | ✅ |
| `SealBouncingDots` | Feedback | ✅ |
| `SealLoader` | Feedback | ✅ |
| `SealProgress` | Feedback | ✅ |
| `SealSonner` | Feedback | ✅ |
| `SealToast` | Feedback | ✅ |
| `SealCalendar` | Inputs | ✅ |
| `SealCheckbox` | Inputs | ✅ |
| `SealDatePicker` | Inputs | ✅ |
| `SealForm` | Inputs | ✅ |
| `SealInputOTP` | Inputs | ✅ |
| `SealRadioGroup` | Inputs | ✅ |
| `SealSelect` | Inputs | ✅ |
| `SealSlider` | Inputs | ✅ |
| `SealSwitch` | Inputs | ✅ |
| `SealTextarea` | Inputs | ✅ |
| `SealTextField` | Inputs | ✅ |
| `SealTimePicker` | Inputs | ✅ |
| `SealAccordion` | Layout | ✅ |
| `SealAvatar` | Layout | ✅ |
| `SealBadge` | Layout | ✅ |
| `SealBreadcrumb` | Layout | ✅ |
| `SealCard` | Layout | ✅ |
| `SealContainer` | Layout | ✅ |
| `SealMenubar` | Layout | ✅ |
| `SealResizable` | Layout | ✅ |
| `SealSeparator` | Layout | ✅ |
| `SealTable` | Layout | ✅ |
| `SealTabs` | Layout | ✅ |
| `SealContextMenu` | Overlay | ✅ |
| `SealDialog` | Overlay | ✅ |
| `SealPopover` | Overlay | ✅ |
| `SealSheet` | Overlay | ✅ |
| `SealPressable` | Interaction | ✅ |
| `SealTooltip` | Interaction | ✅ |

All six button types share the same variant factories: `.primary`, `.accent`, `.accentSecondary`, `.gradient`, `.accentGradient`, `.custom(color:)`, `.custom(gradient:)`.

---

## Token Integration

Tokens flow from `seal_ui_tokens` via the `SealThemeScope` inherited widget. Access them through context extensions:

```dart
// Color tokens
final primary = context.themeTokens.colors.brand.primary;
final surface = context.themeTokens.colors.surface.background;

// Typography tokens
final bodyStyle = context.themeTokens.typography.body;

// Dimension tokens (responsive — auto-scaled per breakpoint)
final spacing = context.dimension.md;  // 16px on mobile, 18px on tablet, 21px on desktop
```

Never hardcode color, typography, or spacing values — always reference a token via context extensions.

---

## Development

| Command | Purpose |
| ------- | ------- |
| `flutter analyze` | Static analysis — zero warnings |
| `flutter test` | Run package tests |
| `cd example && flutter run` | Run the example app |
| `cd example && flutter run -t widgetbook/widgetbook_app.dart` | Open Widgetbook component catalog |

---

## Quality & Tooling

### Static Analysis

`analysis_options.yaml` extends `flutter_lints` with strict additional rules. `flutter analyze` must pass with zero warnings — enforced before every commit.

### Widgetbook

Every component has at least one [Widgetbook](https://www.widgetbook.io/) use case with interactive knobs (string, boolean, dropdown) for exploring variants. The catalog uses the `@UseCase` annotation approach — `widgetbook_generator` + `build_runner` generate the component directory at build time.

Run it with:

```sh
cd example && flutter pub run build_runner build --delete-conflicting-outputs
cd example && flutter run -t widgetbook/widgetbook_app.dart
```

The catalog is also deployed to [Widgetbook Cloud](https://app.widgetbook.io/) on every push to `main` and on pull requests via the CI workflow.

### Responsive Scaling

Typography and spacing scale proportionally across breakpoints via `SealResponsive` and `SealDimension`. Pass the current scale factor when constructing the token set:

```dart
final scaleFactor = SealResponsive.scaleOf(context); // 1.0 mobile · 1.125 tablet · 1.333 desktop
SealThemeScope(tokens: NebulaThemeFactory.tokens(scaleFactor: scaleFactor), ...)
```

### Pre-commit Hooks

[`husky`](https://pub.dev/packages/husky) (Dart-native, no Node.js required) runs two hooks on every commit:

- **pre-commit** — [`lint_staged`](https://pub.dev/packages/lint_staged) runs `dart format --fix` on staged `.dart` files.
- **commit-msg** — [`commitlint_cli`](https://pub.dev/packages/commitlint_cli) enforces [Conventional Commits](https://www.conventionalcommits.org/).

Valid commit types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`, `perf`, `ci`, `revert`.

### Test Coverage

`flutter test --coverage` generates an LCOV report consumed by SonarCloud. Coverage is tracked per push to `main` and on pull requests.

### Versioning

[release-please](https://github.com/googleapis/release-please) automates versioning and changelog generation based on [Conventional Commits](https://www.conventionalcommits.org/).

On every push to `main`, the workflow inspects commits since the last release and opens (or updates) a release PR with the proposed version bump and CHANGELOG entry. The release PR stays open until the maintainer merges it — no release happens automatically.

On merge of the release PR, the git tag and GitHub Release are created automatically.

| Commit type | Version bump (pre-1.0) |
| --- | --- |
| `fix` | patch |
| `feat` | patch |
| `feat!` / `BREAKING CHANGE` | minor |

Workflow: `.github/workflows/release-please.yml` — config in `release-please-config.json`.

---

## CI/CD

### SonarCloud

Every push to `main` and every pull request triggers a SonarCloud analysis that checks:

- Code quality (cognitive complexity, duplication, code smells)
- Test coverage (linked to LCOV report from `flutter test --coverage`)
- Security hotspots

Workflow: `.github/workflows/sonar.yml` — uses `SONAR_TOKEN` repository secret.

**Dashboard:** https://sonarcloud.io/project/overview?id=nayadev_seal_ui_flutter

### Release Please

Automated release PR and GitHub Release creation on every push to `main`.

Workflow: `.github/workflows/release-please.yml` — uses `GITHUB_TOKEN` (no additional secret required).

---

## Project Structure

```
seal_ui_flutter/
├── lib/
│   ├── src/
│   │   ├── foundation/       # Breakpoints, responsive utilities
│   │   ├── tokens/           # Color, typography, gradient, spacing, radius tokens
│   │   ├── theme/            # SealThemeTokens, SealThemeFactory, SealThemeProvider
│   │   └── components/       # Seal* widget wrappers
│   └── seal_ui.dart          # Public barrel exports
├── test/                     # Widget tests mirroring lib/src/ structure
├── example/
│   ├── lib/main.dart         # Example app
│   └── widgetbook/           # Widgetbook component catalog
├── docs/adr/                 # Architecture Decision Records
├── .github/workflows/        # sonar.yml, release-please.yml
├── .husky/                   # pre-commit, commit-msg hooks
├── commitlint.yaml
├── release-please-config.json
├── pubspec.yaml
└── AGENTS.md                 # Instructions for AI agents working on this repo
```

**Dependency direction:** `seal_ui_tokens → tokens/ → theme/ → components/` — no layer may depend on a higher layer.

---

## Architecture Decisions

Architectural decisions are documented as ADRs in [`docs/adr/`](./docs/adr/).

---

## Related Packages

| Package | Description |
| ------- | ----------- |
| [`seal_ui_tokens`](https://github.com/nayadev/seal_ui_tokens) | Token source of truth — CSS variables, JS constants, Tailwind config, Flutter tokens |
| [`seal_ui_react`](https://github.com/nayadev/seal_ui_react) | React implementation of SealUI — token-driven components built on shadcn/ui |

---

## License

MIT
