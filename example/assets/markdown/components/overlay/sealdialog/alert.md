# SealDialog — Alert

Use `SealDialog.alert` for confirmation dialogs and destructive actions.
The content is centered to draw attention.

## Usage

```dart
showSealDialog<void>(
  context: context,
  builder: (context) => SealDialog.alert(
    title: const Text('Are you sure?'),
    description: const Text('This action cannot be undone.'),
    actions: [
      SealOutlineButton.primary(
        label: const Text('Cancel'),
        onPressed: () => Navigator.of(context).pop(),
      ),
      SealFilledButton.custom(
        label: const Text('Delete'),
        color: ColorX.red,
        onPressed: _delete,
      ),
    ],
  ),
);
```
