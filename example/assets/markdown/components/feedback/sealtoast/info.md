# SealToast — Info

A transient **informational** notification. Requires a `SealThemeScope` ancestor (provided automatically).

## Usage

```dart
SealToast.info(
  message: 'A new software update is available.',
).show(context);
```

## With title

```dart
SealToast.info(
  title: 'Update available',
  message: 'A new software update is available.',
).show(context);
```

## With action

```dart
SealToast.info(
  message: 'A new software update is available.',
  actionLabel: 'Details',
  onAction: () => _openReleaseNotes(),
).show(context);
```
