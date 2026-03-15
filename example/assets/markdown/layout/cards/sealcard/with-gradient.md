# SealCard — With Gradient

A `SealCard` with a **gradient** background instead of a solid surface color. Pass any `Gradient` from `SealThemeTokens.gradients`.

## Usage

```dart
SealCard(
  gradient: context.themeTokens.gradients.surfaceGradient,
  showBorder: false,
  header: Text('Gradient Card'),
  body: Text('Content on a gradient background.'),
);
```

## With primary gradient

```dart
SealCard(
  gradient: context.themeTokens.gradients.primaryGradient,
  header: Text('Featured'),
  body: Text('This card stands out with the primary gradient.'),
);
```
