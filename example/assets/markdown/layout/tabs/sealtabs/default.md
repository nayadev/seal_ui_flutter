# SealTabs — Default

A token-driven tabbed container built on `ShadTabs`. Define tabs with
`SealTab` — each holds a `label` shown in the tab bar and `content`
shown in the panel area.

## Usage

```dart
SealTabs<String>(
  value: _selectedTab,
  onChanged: (v) => setState(() => _selectedTab = v),
  tabs: [
    SealTab(
      value: 'account',
      label: const Text('Account'),
      content: const _AccountPanel(),
    ),
    SealTab(
      value: 'security',
      label: const Text('Security'),
      content: const _SecurityPanel(),
    ),
  ],
)
```
