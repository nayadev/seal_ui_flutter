# SealSelect — Default

A token-driven dropdown select built on `ShadSelect`. Shows a placeholder when
no value is selected, and the chosen option label once selected. Toggle `enabled`
to see the disabled appearance.

## Usage

```dart
SealSelect<String>(
  placeholder: 'Choose a theme',
  options: const [
    SealSelectOption(value: 'nebula', label: 'Nebula'),
    SealSelectOption(value: 'arctic', label: 'Arctic'),
    SealSelectOption(value: 'ocean', label: 'Deep Ocean'),
    SealSelectOption(value: 'terminal', label: 'Terminal'),
  ],
  onChanged: (v) => setState(() => _theme = v),
)
```

## Disabled state

Pass `enabled: false` and `onChanged: null` to prevent interaction.

```dart
SealSelect<String>(
  placeholder: 'Choose a theme',
  enabled: false,
  onChanged: null,
  options: const [
    SealSelectOption(value: 'nebula', label: 'Nebula'),
  ],
)
```

)
```
