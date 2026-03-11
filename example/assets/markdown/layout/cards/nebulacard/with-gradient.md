# NebulaCard — With Gradient

A `NebulaCard` with a **gradient** background instead of a solid surface color. Pass any `Gradient` from `NebulaThemeTokens.gradients`.

## Usage

```dart
NebulaCard(
  gradient: context.themeTokens.gradients.surfaceGradient,
  showBorder: false,
  header: Text('Gradient Card'),
  body: Text('Content on a gradient background.'),
);
```

## With primary gradient

```dart
NebulaCard(
  gradient: context.themeTokens.gradients.primaryGradient,
  header: Text('Featured'),
  body: Text('This card stands out with the primary gradient.'),
);
```
