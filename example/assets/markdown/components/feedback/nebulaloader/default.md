# NebulaLoader — Default

An animated loading indicator built from the Nebula token system. Supports three sizes and an optional text label.

## Usage

```dart
const NebulaLoader();
```

## With size

```dart
NebulaLoader(size: NebulaLoaderSize.small);
NebulaLoader(size: NebulaLoaderSize.medium); // default
NebulaLoader(size: NebulaLoaderSize.large);
```

## With label

```dart
const NebulaLoader(
  size: NebulaLoaderSize.medium,
  label: 'Loading…',
);
```

## Inside a full-screen overlay

```dart
Stack(
  children: [
    // page content
    const ColoredBox(
      color: Colors.black54,
      child: Center(
        child: NebulaLoader(label: 'Please wait…'),
      ),
    ),
  ],
);
```
