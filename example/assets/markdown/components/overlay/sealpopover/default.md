# SealPopover — Default

A token-styled floating panel built on `ShadPopover`. Use a `SealPopoverController`
to toggle visibility programmatically.

## Usage

```dart
final controller = SealPopoverController();

SealPopover(
  controller: controller,
  popover: (context) => const Text('Popover content'),
  child: SealOutlineButton.primary(
    label: const Text('Open Popover'),
    onPressed: controller.toggle,
  ),
);
```
