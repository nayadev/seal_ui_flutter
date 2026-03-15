# SealContainer — With Gradient

A `SealContainer` with a **gradient background** sourced from `SealThemeTokens.gradients`.

## Usage

```dart
SealContainer(
  gradient: context.themeTokens.gradients.surfaceGradient,
  showBorder: true,
  child: Text('Gradient container'),
);
```

## With primary gradient

```dart
SealContainer(
  gradient: context.themeTokens.gradients.primaryGradient,
  showBorder: false,
  child: Column(
    children: [
      Icon(Icons.auto_awesome_rounded),
      Text('Featured content'),
    ],
  ),
);
```
