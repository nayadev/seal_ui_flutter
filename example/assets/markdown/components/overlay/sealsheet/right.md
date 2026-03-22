# SealSheet — Right

Pass `side: ShadSheetSide.right` to slide the sheet in from the right
edge — useful for navigation drawers or settings panels.

## Usage

```dart
showSealSheet<void>(
  context: context,
  side: ShadSheetSide.right,
  builder: (context) => SealSheet(
    title: const Text('Settings'),
    description: const Text('Configure your preferences.'),
    actions: [
      SealFilledButton.primary(
        label: const Text('Done'),
        onPressed: () => Navigator.of(context).pop(),
      ),
    ],
  ),
);
```
