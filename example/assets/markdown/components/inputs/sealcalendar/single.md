# SealCalendar — Single

A token-styled calendar for picking a single date, built on `ShadCalendar`.

## Usage

```dart
SealCalendar(
  selected: _date,
  allowDeselection: true,
  onChanged: (date) => setState(() => _date = date),
)
```
