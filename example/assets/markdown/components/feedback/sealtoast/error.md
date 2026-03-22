# SealToast — Error

A transient **error** notification. Requires a `SealThemeScope` ancestor (provided automatically).

## Usage

```dart
SealToast.error(
  message: 'Could not connect to the server.',
).show(context);
```

## With title

```dart
SealToast.error(
  title: 'Connection failed',
  message: 'Could not connect to the server.',
).show(context);
```

## With action

```dart
SealToast.error(
  message: 'Could not connect to the server.',
  actionLabel: 'Retry',
  onAction: () => _retry(),
).show(context);
```
