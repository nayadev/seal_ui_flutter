# SealSheet — Bottom

A token-styled slide-in panel built on `ShadSheet`. Slides from the
bottom by default. Use `showSealSheet` to display it as an overlay.

## Usage

```dart
showSealSheet<void>(
  context: context,
  builder: (context) => SealSheet(
    title: const Text('Filter'),
    description: const Text('Narrow down your results.'),
    actions: [
      SealOutlineButton.primary(
        label: const Text('Reset'),
        onPressed: () => Navigator.of(context).pop(),
      ),
      SealFilledButton.primary(
        label: const Text('Apply'),
        onPressed: () => Navigator.of(context).pop(),
      ),
    ],
  ),
);
```
