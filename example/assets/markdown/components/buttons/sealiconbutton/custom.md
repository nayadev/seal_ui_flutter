# SealIconButton — Custom

A ghost icon button where `color` or `gradient` sets the **foreground** (icon) color. Use when none of the token-based variants matches the required color context.

Exactly one of `color` or `gradient` must be provided.

## With solid color

```dart
SealIconButton.custom(
  icon: Icons.delete_outline_rounded,
  tooltip: 'Delete',
  color: Colors.red,
  onPressed: () {},
);
```

## With gradient

```dart
SealIconButton.custom(
  icon: Icons.rocket_launch_rounded,
  tooltip: 'Launch',
  gradient: LinearGradient(colors: [Colors.cyan, Colors.indigo]),
  onPressed: () {},
);
```

## Disabled state

```dart
SealIconButton.custom(
  icon: Icons.delete_outline_rounded,
  tooltip: 'Delete',
  color: Colors.red,
  onPressed: null,
);
```
