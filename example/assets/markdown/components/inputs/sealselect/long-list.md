# SealSelect — Long List

`SealSelect` handles long option lists out of the box — the dropdown scrolls
when the list exceeds the available viewport height. A good use case is a
timezone or country picker.

## Usage

```dart
SealSelect<String>(
  label: 'Timezone',
  placeholder: 'Select timezone',
  value: _timezone,
  onChanged: (v) => setState(() => _timezone = v),
  options: const [
    SealSelectOption(value: 'utc', label: 'UTC — Universal Time'),
    SealSelectOption(value: 'us_et', label: 'America/New_York (ET)'),
    SealSelectOption(value: 'us_ct', label: 'America/Chicago (CT)'),
    SealSelectOption(value: 'us_mt', label: 'America/Denver (MT)'),
    SealSelectOption(value: 'us_pt', label: 'America/Los_Angeles (PT)'),
    SealSelectOption(value: 'eu_london', label: 'Europe/London (GMT)'),
    SealSelectOption(value: 'eu_paris', label: 'Europe/Paris (CET)'),
    SealSelectOption(value: 'eu_moscow', label: 'Europe/Moscow (MSK)'),
    SealSelectOption(value: 'asia_dubai', label: 'Asia/Dubai (GST)'),
    SealSelectOption(value: 'asia_kolkata', label: 'Asia/Kolkata (IST)'),
    SealSelectOption(value: 'asia_singapore', label: 'Asia/Singapore (SGT)'),
    SealSelectOption(value: 'asia_tokyo', label: 'Asia/Tokyo (JST)'),
    SealSelectOption(value: 'aus_sydney', label: 'Australia/Sydney (AEDT)'),
    SealSelectOption(value: 'pac_auckland', label: 'Pacific/Auckland (NZST)'),
  ],
)
```
