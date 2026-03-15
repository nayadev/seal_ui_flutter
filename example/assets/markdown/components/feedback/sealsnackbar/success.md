# SealSnackbar — Success

Displays a **success** notification to confirm that an action completed successfully.

## Usage

```dart
SealSnackbar.success(
  message: 'Your changes have been saved.',
).show(context);
```

## With title

```dart
SealSnackbar.success(
  title: 'Done!',
  message: 'Profile updated successfully.',
).show(context);
```

## With alignment

```dart
SealSnackbar.success(
  message: 'Payment confirmed.',
  alignment: SealSnackbarAlignment.bottom,
).show(context);
```
