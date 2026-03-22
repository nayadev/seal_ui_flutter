# SealMenubar — Default

A horizontal menu bar with dropdown menus. Compose `SealMenubarItem` triggers with `SealContextMenuItem` items.

## Usage

```dart
SealMenubar(
  items: [
    SealMenubarItem(
      items: [
        SealContextMenuItem(child: const Text('New'), onPressed: () {}),
        SealContextMenuItem(child: const Text('Open'), onPressed: () {}),
        SealContextMenuItem(child: const Text('Save'), onPressed: () {}),
      ],
      child: const Text('File'),
    ),
    SealMenubarItem(
      items: [
        SealContextMenuItem(child: const Text('Undo'), onPressed: () {}),
        SealContextMenuItem(child: const Text('Redo'), onPressed: () {}),
      ],
      child: const Text('Edit'),
    ),
  ],
)
```
