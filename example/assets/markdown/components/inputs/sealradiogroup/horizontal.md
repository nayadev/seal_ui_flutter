# SealRadioGroup — Horizontal

Lay out radio items in a row by setting `axis: Axis.horizontal`.

## Usage

```dart
SealRadioGroup<String>(
  value: _answer,
  axis: Axis.horizontal,
  onChanged: (v) => setState(() => _answer = v),
  items: const [
    SealRadioItem(value: 'yes', label: Text('Yes')),
    SealRadioItem(value: 'no',  label: Text('No')),
  ],
)
```
