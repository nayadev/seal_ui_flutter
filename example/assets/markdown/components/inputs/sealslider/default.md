# SealSlider — Default

A token-driven range slider built on `ShadSlider`. Either `value`
(uncontrolled) or a `ShadSliderController` (controlled) must be provided.

## Usage

```dart
SealSlider(
  value: _volume,
  onChanged: (v) => setState(() => _volume = v),
)
```

## Disabled state

```dart
SealSlider(
  value: 0.5,
  enabled: false,
)
```
