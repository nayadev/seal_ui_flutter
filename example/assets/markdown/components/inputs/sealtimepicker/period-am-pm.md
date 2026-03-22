# SealTimePicker — Period (AM/PM)

12-hour time input with AM/PM selector using `SealTimePicker.period`.

## Usage

```dart
SealTimePicker.period(
  initialDayPeriod: SealDayPeriod.am,
  showSeconds: false,
  onChanged: (time) => print('${time.hour}:${time.minute} ${time.period.name.toUpperCase()}'),
)
```
