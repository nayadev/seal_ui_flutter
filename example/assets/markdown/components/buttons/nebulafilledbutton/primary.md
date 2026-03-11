# NebulaFilledButton — Primary

A filled button using the brand **primary** color. Use this as the main call-to-action in most screens.

## Usage

```dart
NebulaFilledButton.primary(
  label: 'Get Started',
  onPressed: () {
    // handle tap
  },
);
```

## Loading state

```dart
NebulaFilledButton.primary(
  label: 'Saving…',
  isLoading: true,
  onPressed: null,
);
```

## Disabled state

Pass `null` to `onPressed` to disable the button.

```dart
NebulaFilledButton.primary(
  label: 'Unavailable',
  onPressed: null,
);
```
