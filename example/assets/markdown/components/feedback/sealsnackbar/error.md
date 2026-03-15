# SealSnackbar — Error

Displays an **error** notification to communicate that something went wrong. Supports an optional action button for recovery flows.

## Usage

```dart
SealSnackbar.error(
  message: 'Something went wrong. Please try again.',
).show(context);
```

## With title

```dart
SealSnackbar.error(
  title: 'Error',
  message: 'Failed to load data.',
).show(context);
```

## With retry action

```dart
SealSnackbar.error(
  title: 'Upload Failed',
  message: 'Your file could not be uploaded.',
  actionLabel: 'Retry',
  onAction: () {
    // retry logic
  },
).show(context);
```
