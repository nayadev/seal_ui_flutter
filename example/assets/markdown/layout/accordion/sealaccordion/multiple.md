# SealAccordion — Multiple

Use `SealAccordion.multiple` to allow any number of items to be
expanded simultaneously.

## Usage

```dart
SealAccordion<String>.multiple(
  initialValues: const ['q1'],
  items: [
    SealAccordionItem(
      value: 'q1',
      title: const Text('Typography'),
      child: const Text('Uses Inter via Google Fonts.'),
    ),
    SealAccordionItem(
      value: 'q2',
      title: const Text('Colors'),
      child: const Text('Each theme defines its own ColorPalette.'),
    ),
  ],
)
```
