# SealToast — Warning

A transient **warning** notification. Requires a `SealThemeScope` ancestor (provided automatically).

## Usage

```dart
SealToast.warning(
  message: 'Your session will expire in 5 minutes.',
).show(context);
```

## With title

```dart
SealToast.warning(
  title: 'Session expiring',
  message: 'Your session will expire in 5 minutes.',
).show(context);
```

## With action

```dart
SealToast.warning(
  message: 'Your session will expire in 5 minutes.',
  actionLabel: 'Renew',
  onAction: () => _renewSession(),
).show(context);
```
