# SealSelect — Disabled

Pass `enabled: false` and `onChanged: null` to render the select in a
non-interactive disabled state. Useful for gating options behind a permission
or subscription plan.

## Usage

```dart
SealSelect<String>(
  label: 'Plan',
  placeholder: 'Upgrade to access',
  enabled: false,
  onChanged: null,
  options: const [
    SealSelectOption(value: 'starter', label: 'Starter'),
    SealSelectOption(value: 'pro', label: 'Pro'),
    SealSelectOption(value: 'enterprise', label: 'Enterprise'),
  ],
)
```
