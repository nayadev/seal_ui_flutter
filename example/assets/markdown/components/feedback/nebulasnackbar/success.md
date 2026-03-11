# NebulaSnackbar — Success

Displays a **success** notification to confirm that an action completed successfully.

## Usage

```dart
NebulaSnackbar.success(
  message: 'Your changes have been saved.',
).show(context);
```

## With title

```dart
NebulaSnackbar.success(
  title: 'Done!',
  message: 'Profile updated successfully.',
).show(context);
```

## With alignment

```dart
NebulaSnackbar.success(
  message: 'Payment confirmed.',
  alignment: NebulaSnackbarAlignment.bottom,
).show(context);
```
