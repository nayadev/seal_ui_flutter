# NebulaContainer — With Gradient

A `NebulaContainer` with a **gradient background** sourced from `NebulaThemeTokens.gradients`.

## Usage

```dart
NebulaContainer(
  gradient: context.themeTokens.gradients.surfaceGradient,
  showBorder: true,
  child: Text('Gradient container'),
);
```

## With primary gradient

```dart
NebulaContainer(
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
