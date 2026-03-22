# SealDatePicker — Range

Picks a date range via a button-triggered popover calendar using `SealDatePicker.range`.

## Usage

```dart
SealDatePicker.range(
  selected: _range,
  placeholder: const Text('Pick a date range'),
  onChanged: (range) => setState(() => _range = range),
)
```
