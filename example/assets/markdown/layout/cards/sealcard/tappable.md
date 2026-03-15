# SealCard — Tappable

A `SealCard` with an `onTap` callback. The entire card surface becomes interactive with the appropriate touch feedback.

## Usage

```dart
SealCard(
  onTap: () {
    // handle tap
  },
  header: Text('Tappable Card'),
  body: Text('Tap this card to trigger an action.'),
);
```

## Navigation example

```dart
SealCard(
  onTap: () => Navigator.pushNamed(context, '/details'),
  header: Row(
    children: [
      Icon(Icons.article_rounded),
      SizedBox(width: 8),
      Text('Read Article'),
    ],
  ),
  body: Text('Tap to open the full article.'),
);
```
