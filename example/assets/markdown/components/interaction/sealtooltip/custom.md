# SealTooltip — Custom

Use `SealTooltip.custom` when the tooltip content requires richer
widgets beyond a plain string.

## Usage

```dart
SealTooltip.custom(
  builder: (context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Icon(LucideIcons.info, size: 12),
      const SizedBox(width: 4),
      const Text('More information'),
    ],
  ),
  child: const Text('Hover me'),
)
```
