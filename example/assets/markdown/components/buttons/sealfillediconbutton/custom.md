# SealFilledIconButton — Custom

A filled icon button where `color` or `gradient` sets the **background** color. The foreground (icon) defaults to white. Use when none of the token-based variants matches the required color context.

Exactly one of `color` or `gradient` must be provided.

## With solid color

```dart
SealFilledIconButton.custom(
  icon: Icons.delete_outline_rounded,
  tooltip: 'Delete',
  color: Colors.red,
  onPressed: () {},
);
```

## With gradient

```dart
SealFilledIconButton.custom(
  icon: Icons.rocket_launch_rounded,
  tooltip: 'Launch',
  gradient: LinearGradient(colors: [Colors.cyan, Colors.indigo]),
  onPressed: () {},
);
```

## Disabled state

```dart
SealFilledIconButton.custom(
  icon: Icons.delete_outline_rounded,
  tooltip: 'Delete',
  color: Colors.red,
  onPressed: null,
);
```
