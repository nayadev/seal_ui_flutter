# SealTextButton — Custom

A text button where `color` or `gradient` sets the **text** color. Use when none of the token-based variants matches the required color context.

Exactly one of `color` or `gradient` must be provided.

## With solid color

```dart
SealTextButton.custom(
  label: 'Delete',
  color: Colors.red,
  onPressed: () {},
);
```

## With gradient

```dart
SealTextButton.custom(
  label: 'Launch',
  gradient: LinearGradient(colors: [Colors.cyan, Colors.indigo]),
  onPressed: () {},
);
```

## Disabled state

```dart
SealTextButton.custom(
  label: 'Unavailable',
  color: Colors.red,
  onPressed: null,
);
```
