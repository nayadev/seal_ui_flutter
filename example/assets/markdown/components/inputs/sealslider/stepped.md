# SealSlider — Stepped

Set `min`, `max`, and `divisions` to create a discrete snap-to-step slider.

## Usage

```dart
SealSlider(
  value: _level,
  min: 0,
  max: 100,
  divisions: 10,
  onChanged: (v) => setState(() => _level = v),
)
```
