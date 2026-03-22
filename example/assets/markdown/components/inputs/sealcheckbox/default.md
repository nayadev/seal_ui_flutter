# SealCheckbox — Default

A token-driven checkbox built on `ShadCheckbox`. Uses the primary brand color for the checked state.

## Usage

```dart
SealCheckbox(
  value: _checked,
  onChanged: (v) => setState(() => _checked = v),
)
```

## Disabled state

Pass `null` to `onChanged` **or** set `enabled: false` to prevent interaction.

```dart
SealCheckbox(
  value: true,
  enabled: false,
  onChanged: null,
)
```
