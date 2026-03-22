# SealTooltip — Default

A token-driven tooltip built on `ShadTooltip`. Shows a floating label
when the user hovers over or focuses the child widget.

## Usage

```dart
SealTooltip(
  message: 'Delete item',
  child: SealIconButton.primary(
    icon: LucideIcons.trash2,
    onPressed: _onDelete,
  ),
)
```
