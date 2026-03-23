# SealSelect — Pre-selected

Pass an initial `value` to display a pre-selected option when the widget first
renders. This is useful for edit forms where a current value already exists.

## Usage

```dart
SealSelect<String>(
  label: 'Status',
  value: 'in_progress',
  onChanged: (v) => setState(() => _status = v),
  options: const [
    SealSelectOption(value: 'todo', label: 'To Do'),
    SealSelectOption(value: 'in_progress', label: 'In Progress'),
    SealSelectOption(value: 'in_review', label: 'In Review'),
    SealSelectOption(value: 'done', label: 'Done'),
    SealSelectOption(value: 'cancelled', label: 'Cancelled'),
  ],
)
```
