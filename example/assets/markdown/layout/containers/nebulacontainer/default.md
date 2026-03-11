# NebulaContainer — Default

A general-purpose **surface container** that wraps its child with Nebula surface styling, border, and padding. Use it to group related content inside a themed surface.

## Usage

```dart
NebulaContainer(
  child: Text('Content inside the container'),
);
```

## With border

```dart
NebulaContainer(
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
NebulaContainer(
  showBorder: false,
  child: Text('Borderless container'),
);
```
