# SealContextMenu — With Submenu

Nested submenus are created by passing `items` to a `SealContextMenuItem`.

## Usage

```dart
SealContextMenuRegion(
  items: [
    SealContextMenuItem(
      items: [
        SealContextMenuItem(child: const Text('Cut'), onPressed: () {}),
        SealContextMenuItem(child: const Text('Copy'), onPressed: () {}),
        SealContextMenuItem(child: const Text('Paste'), onPressed: () {}),
      ],
      child: const Text('Edit'),
    ),
    SealContextMenuItem(
      child: const Text('Delete'),
      onPressed: () {},
    ),
  ],
  child: const Text('Right-click for submenu'),
)
```
