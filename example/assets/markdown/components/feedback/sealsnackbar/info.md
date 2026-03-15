# SealSnackbar — Info

Displays a non-intrusive **informational** notification. Shown at the top of the screen by default.

## Usage

```dart
SealSnackbar.info(
  message: 'Something you should know.',
).show(context);
```

## With title

```dart
SealSnackbar.info(
  message: 'Your session expires in 5 minutes.',
  title: 'Heads up',
).show(context);
```

## With alignment

```dart
SealSnackbar.info(
  message: 'Item added to your list.',
  alignment: SealSnackbarAlignment.bottom,
).show(context);
```
