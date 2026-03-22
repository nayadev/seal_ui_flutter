# SealToast — Success

A transient **success** notification. Requires a `SealThemeScope` ancestor (provided automatically).

## Usage

```dart
SealToast.success(
  message: 'Your changes have been saved.',
).show(context);
```

## With title

```dart
SealToast.success(
  title: 'Profile updated',
  message: 'Your changes have been saved.',
).show(context);
```

## With action

```dart
SealToast.success(
  message: 'File uploaded successfully.',
  actionLabel: 'View',
  onAction: () => _openFile(),
).show(context);
```
