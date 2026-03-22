# SealResizablePanelGroup — Horizontal

A drag-to-resize horizontal layout. Each panel takes a `defaultSize` proportion (0–1) of available space.

## Usage

```dart
SizedBox(
  height: 160,
  child: SealResizablePanelGroup(
    children: [
      SealResizablePanel(
        id: 'left',
        defaultSize: 0.5,
        minSize: 0.2,
        child: const Text('Left'),
      ),
      SealResizablePanel(
        id: 'right',
        defaultSize: 0.5,
        minSize: 0.2,
        child: const Text('Right'),
      ),
    ],
  ),
)
```
