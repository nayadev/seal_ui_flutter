# SealContextMenu — Default

Shows a floating menu on right-click (desktop) or long-press (mobile) using `SealContextMenuRegion`.

## Usage

```dart
SealContextMenuRegion(
  items: [
    SealContextMenuItem(
      leading: const Icon(LucideIcons.copy, size: 14),
      child: const Text('Copy'),
      onPressed: () {},
    ),
    SealContextMenuItem(
      leading: const Icon(LucideIcons.trash2, size: 14),
      child: const Text('Delete'),
      onPressed: () {},
    ),
  ],
  child: const Text('Right-click me'),
)
```
