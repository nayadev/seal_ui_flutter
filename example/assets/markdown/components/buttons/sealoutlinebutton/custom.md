# SealOutlineButton — Custom

An outlined button where `color` or `gradient` sets the **foreground and border** color. Use when none of the token-based variants matches the required color context.

Exactly one of `color` or `gradient` must be provided.

## With solid color

```dart
SealOutlineButton.custom(
  label: 'Delete',
  color: Colors.red,
  onPressed: () {},
);
```

## With gradient

```dart
SealOutlineButton.custom(
  label: 'Launch',
  gradient: LinearGradient(colors: [Colors.cyan, Colors.indigo]),
  onPressed: () {},
);
```

## Disabled state

```dart
SealOutlineButton.custom(
  label: 'Unavailable',
  color: Colors.red,
  onPressed: null,
);
```
