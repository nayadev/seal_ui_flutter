# SealAccordion — Default

A token-driven collapsible sections widget built on `ShadAccordion`.
Only one item can be open at a time in the default mode.

## Usage

```dart
SealAccordion<String>(
  items: [
    SealAccordionItem(
      value: 'q1',
      title: const Text('What is Seal UI?'),
      child: const Text('A token-driven Flutter design system.'),
    ),
    SealAccordionItem(
      value: 'q2',
      title: const Text('How do I install it?'),
      child: const Text('Add seal_ui to your pubspec.yaml.'),
    ),
  ],
)
```

## With initial value

```dart
SealAccordion<String>(
  initialValue: 'q1',
  items: [...],
)
```
