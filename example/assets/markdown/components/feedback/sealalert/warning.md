# SealAlert — Warning

An inline **warning** alert with a colored border and icon. Use to surface non-critical issues that the user should be aware of.

## Without title

```dart
SealAlert.warning(
  description: 'Your free trial expires in 3 days.',
);
```

## With title

```dart
SealAlert.warning(
  title: 'Attention needed',
  description: 'Your free trial expires in 3 days.',
);
```
