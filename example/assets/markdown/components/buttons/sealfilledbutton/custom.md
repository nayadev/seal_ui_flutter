# SealFilledButton — Custom

A filled button with an **arbitrary background color or gradient**. Use when none of the token-based variants matches the required color context.

Exactly one of `color` or `gradient` must be provided. The foreground (label and icon) defaults to white.

## With solid color

```dart
SealFilledButton.custom(
  label: 'Delete',
  color: Colors.red,
  onPressed: () {},
);
```

## With gradient

```dart
SealFilledButton.custom(
  label: 'Launch',
  gradient: LinearGradient(colors: [Colors.cyan, Colors.indigo]),
  onPressed: () {},
);
```

## Disabled state

```dart
SealFilledButton.custom(
  label: 'Unavailable',
  color: Colors.red,
  onPressed: null,
);
```
