# SealAlert — Error

An inline **error** alert with a colored border and icon. Use to communicate that an action failed or that invalid input was provided.

## Without title

```dart
SealAlert.error(
  description: 'Something went wrong. Please try again.',
);
```

## With title

```dart
SealAlert.error(
  title: 'Request failed',
  description: 'Something went wrong. Please try again.',
);
```
