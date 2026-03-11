# NebulaSnackbar — Error

Displays an **error** notification to communicate that something went wrong. Supports an optional action button for recovery flows.

## Usage

```dart
NebulaSnackbar.error(
  message: 'Something went wrong. Please try again.',
).show(context);
```

## With title

```dart
NebulaSnackbar.error(
  title: 'Error',
  message: 'Failed to load data.',
).show(context);
```

## With retry action

```dart
NebulaSnackbar.error(
  title: 'Upload Failed',
  message: 'Your file could not be uploaded.',
  actionLabel: 'Retry',
  onAction: () {
    // retry logic
  },
).show(context);
```
