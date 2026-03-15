# SealCard — Default

A themed surface card with an optional **header**, **body**, **footer**, and configurable **elevation** and border. Composed from Seal tokens.

## Usage

```dart
SealCard(
  header: Text('Card Title', style: typo.title),
  body: Text('Your content goes here.', style: typo.body),
);
```

## With footer actions

```dart
SealCard(
  showBorder: true,
  elevation: 2,
  header: Text('Confirm Action'),
  body: Text('Are you sure you want to proceed?'),
  footer: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      SealTextButton.primary(label: 'Cancel', onPressed: () {}),
      SealFilledButton.primary(label: 'Confirm', onPressed: () {}),
    ],
  ),
);
```

## Minimal card

```dart
SealCard(
  body: Text('Simple content inside a card.'),
);
```
