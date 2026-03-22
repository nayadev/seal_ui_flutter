# SealSwitch — With Label

Add a primary `label` and an optional `sublabel` beside the toggle.

## Usage

```dart
SealSwitch(
  value: _darkMode,
  onChanged: (v) => setState(() => _darkMode = v),
  label: const Text('Dark mode'),
  sublabel: const Text('Switch between dark and light themes.'),
)
```

## Label only

```dart
SealSwitch(
  value: _notifications,
  onChanged: (v) => setState(() => _notifications = v),
  label: const Text('Enable notifications'),
)
```
