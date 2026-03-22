# SealDialog — Default

A token-styled modal dialog built on `ShadDialog`. Use `showSealDialog`
to display it as an overlay.

## Usage

```dart
showSealDialog<void>(
  context: context,
  builder: (context) => SealDialog(
    title: const Text('Edit profile'),
    description: const Text('Make changes to your profile here.'),
    actions: [
      SealOutlineButton.primary(
        label: const Text('Cancel'),
        onPressed: () => Navigator.of(context).pop(),
      ),
      SealFilledButton.primary(
        label: const Text('Save'),
        onPressed: _save,
      ),
    ],
  ),
);
```
