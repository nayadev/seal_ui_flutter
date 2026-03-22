# SealResizablePanelGroup — Vertical

A drag-to-resize vertical layout using `axis: Axis.vertical`.

## Usage

```dart
SizedBox(
  height: 240,
  child: SealResizablePanelGroup(
    axis: Axis.vertical,
    children: [
      SealResizablePanel(
        id: 'top',
        defaultSize: 0.5,
        minSize: 0.2,
        child: const Text('Top'),
      ),
      SealResizablePanel(
        id: 'bottom',
        defaultSize: 0.5,
        minSize: 0.2,
        child: const Text('Bottom'),
      ),
    ],
  ),
)
```
