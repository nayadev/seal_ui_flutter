# NebulaSnackbar — Info

Displays a non-intrusive **informational** notification. Shown at the top of the screen by default.

## Usage

```dart
NebulaSnackbar.info(
  message: 'Something you should know.',
).show(context);
```

## With title

```dart
NebulaSnackbar.info(
  message: 'Your session expires in 5 minutes.',
  title: 'Heads up',
).show(context);
```

## With alignment

```dart
NebulaSnackbar.info(
  message: 'Item added to your list.',
  alignment: NebulaSnackbarAlignment.bottom,
).show(context);
```
