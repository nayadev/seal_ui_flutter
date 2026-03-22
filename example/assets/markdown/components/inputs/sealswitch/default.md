# SealSwitch — Default

A token-driven toggle switch built on `ShadSwitch`. Uses the primary brand color for the active track.

## Usage

```dart
SealSwitch(
  value: _enabled,
  onChanged: (v) => setState(() => _enabled = v),
)
```

## Disabled state

```dart
SealSwitch(
  value: true,
  enabled: false,
  onChanged: null,
)
```
