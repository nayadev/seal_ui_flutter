# NebulaSnackbar — Warning

Displays a **warning** notification to alert the user about potential issues or irreversible actions.

## Usage

```dart
NebulaSnackbar.warning(
  message: 'This action might have side effects.',
).show(context);
```

## With title

```dart
NebulaSnackbar.warning(
  title: 'Warning',
  message: 'You are about to delete all data.',
).show(context);
```

## With alignment

```dart
NebulaSnackbar.warning(
  message: 'Low storage detected.',
  alignment: NebulaSnackbarAlignment.bottom,
).show(context);
```
