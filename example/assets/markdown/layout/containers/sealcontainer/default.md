# SealContainer — Default

A general-purpose **surface container** that wraps its child with Seal surface styling, border, and padding. Use it to group related content inside a themed surface.

## Usage

```dart
SealContainer(
  child: Text('Content inside the container'),
);
```

## With border

```dart
SealContainer(
  showBorder: true,
  child: Column(
    children: [
      Text('Title'),
      Text('Description text goes here.'),
    ],
  ),
);
```

## Without border

```dart
SealContainer(
  showBorder: false,
  child: Text('Borderless container'),
);
```
