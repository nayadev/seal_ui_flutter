# SealCheckbox — With Label

Add a primary `label` and an optional `sublabel` to give the checkbox readable context.

## Usage

```dart
SealCheckbox(
  value: _accepted,
  onChanged: (v) => setState(() => _accepted = v),
  label: const Text('Accept terms and conditions'),
  sublabel: const Text('You agree to our Terms of Service.'),
)
```

## Label only

```dart
SealCheckbox(
  value: _newsletter,
  onChanged: (v) => setState(() => _newsletter = v),
  label: const Text('Subscribe to newsletter'),
)
```
