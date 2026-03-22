# SealSelect — Default

A token-driven dropdown select built on `ShadSelect`. Shows a placeholder when
no value is selected, and the chosen option label once selected.

## Usage

```dart
SealSelect<String>(
  placeholder: 'Choose a theme',
  options: const [
    SealSelectOption(value: 'nebula', label: 'Nebula'),
    SealSelectOption(value: 'arctic', label: 'Arctic'),
  ],
  value: _theme,
  onChanged: (v) => setState(() => _theme = v),
)
```

## Disabled state

```dart
SealSelect<String>(
  placeholder: 'Choose a theme',
  enabled: false,
  options: const [
    SealSelectOption(value: 'nebula', label: 'Nebula'),
  ],
  onChanged: null,
)
```
