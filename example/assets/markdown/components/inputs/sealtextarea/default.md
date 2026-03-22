# SealTextarea — Default

A token-driven multi-line text area built on `ShadTextarea`. Supports
configurable height bounds and optional drag-to-resize.

## Usage

```dart
SealTextarea(
  hint: 'Enter a description…',
  onChanged: (v) => _onChanged(v),
)
```

## Disabled state

```dart
SealTextarea(
  hint: 'Disabled',
  enabled: false,
  onChanged: null,
)
```

## Non-resizable

```dart
SealTextarea(
  hint: 'Fixed size',
  resizable: false,
  onChanged: (v) => _onChanged(v),
)
```
