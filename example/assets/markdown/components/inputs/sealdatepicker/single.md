# SealDatePicker — Single

Picks a single date via a button-triggered popover calendar.

## Usage

```dart
SealDatePicker(
  selected: _date,
  placeholder: const Text('Pick a date'),
  allowDeselection: true,
  onChanged: (date) => setState(() => _date = date),
)
```
