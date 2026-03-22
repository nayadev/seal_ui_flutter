# SealSonner — Default

Stacked Sonner-style toasts. Wrap any subtree with `SealSonner` and call `showSealSonner` on a descendant context.

## Usage

```dart
SealSonner(
  child: Builder(
    builder: (context) => SealFilledButton.primary(
      label: const Text('Show toast'),
      onPressed: () => showSealSonner(
        context,
        title: const Text('File saved'),
        description: const Text('Your changes have been synced.'),
      ),
    ),
  ),
)
```
