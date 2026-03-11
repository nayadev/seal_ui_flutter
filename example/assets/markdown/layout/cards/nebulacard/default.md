# NebulaCard — Default

A themed surface card with an optional **header**, **body**, **footer**, and configurable **elevation** and border. Composed from Nebula tokens.

## Usage

```dart
NebulaCard(
  header: Text('Card Title', style: typo.title),
  body: Text('Your content goes here.', style: typo.body),
);
```

## With footer actions

```dart
NebulaCard(
  showBorder: true,
  elevation: 2,
  header: Text('Confirm Action'),
  body: Text('Are you sure you want to proceed?'),
  footer: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      NebulaTextButton.primary(label: 'Cancel', onPressed: () {}),
      NebulaFilledButton.primary(label: 'Confirm', onPressed: () {}),
    ],
  ),
);
```

## Minimal card

```dart
NebulaCard(
  body: Text('Simple content inside a card.'),
);
```
