# SealSnackbar — Warning

Displays a **warning** notification to alert the user about potential issues or irreversible actions.

## Usage

```dart
SealSnackbar.warning(
  message: 'This action might have side effects.',
).show(context);
```

## With title

```dart
SealSnackbar.warning(
  title: 'Warning',
  message: 'You are about to delete all data.',
).show(context);
```

## With alignment

```dart
SealSnackbar.warning(
  message: 'Low storage detected.',
  alignment: SealSnackbarAlignment.bottom,
).show(context);
```
