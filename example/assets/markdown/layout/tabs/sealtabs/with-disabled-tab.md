# SealTabs — With Disabled Tab

Set `enabled: false` on individual `SealTab` entries to prevent
selection of specific tabs.

## Usage

```dart
SealTabs<String>(
  value: 'active',
  tabs: [
    SealTab(
      value: 'active',
      label: const Text('Active'),
      content: const _ActivePanel(),
    ),
    const SealTab(
      value: 'locked',
      label: Text('Locked'),
      content: SizedBox.shrink(),
      enabled: false,
    ),
  ],
)
```
