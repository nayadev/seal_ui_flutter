# SealRadioGroup — Default

A token-driven group of mutually exclusive radio buttons built on `ShadRadioGroup`.

## Usage

```dart
SealRadioGroup<String>(
  value: _selected,
  onChanged: (v) => setState(() => _selected = v),
  items: const [
    SealRadioItem(value: 'light', label: Text('Light')),
    SealRadioItem(value: 'dark',  label: Text('Dark')),
    SealRadioItem(value: 'system', label: Text('System')),
  ],
)
```

## Disabled state

```dart
SealRadioGroup<String>(
  value: 'dark',
  enabled: false,
  onChanged: null,
  items: const [
    SealRadioItem(value: 'light', label: Text('Light')),
    SealRadioItem(value: 'dark',  label: Text('Dark')),
  ],
)
```
