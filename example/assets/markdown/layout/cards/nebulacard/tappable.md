# NebulaCard — Tappable

A `NebulaCard` with an `onTap` callback. The entire card surface becomes interactive with the appropriate touch feedback.

## Usage

```dart
NebulaCard(
  onTap: () {
    // handle tap
  },
  header: Text('Tappable Card'),
  body: Text('Tap this card to trigger an action.'),
);
```

## Navigation example

```dart
NebulaCard(
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
