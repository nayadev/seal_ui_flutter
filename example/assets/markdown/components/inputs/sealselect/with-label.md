# SealSelect — With Label

Add a descriptive `label` above the trigger by passing the optional `label` parameter.

## Usage

```dart
SealSelect<String>(
  label: 'Theme',
  placeholder: 'Choose a theme',
  options: const [
    SealSelectOption(value: 'nebula', label: 'Nebula'),
    SealSelectOption(value: 'arctic', label: 'Arctic'),
  ],
  value: _theme,
  onChanged: (v) => setState(() => _theme = v),
)
```
