# SealLoader — Default

An animated loading indicator built from the Seal token system. Supports three sizes and an optional text label.

## Usage

```dart
const SealLoader();
```

## With size

```dart
SealLoader(size: SealLoaderSize.small);
SealLoader(size: SealLoaderSize.medium); // default
SealLoader(size: SealLoaderSize.large);
```

## With label

```dart
const SealLoader(
  size: SealLoaderSize.medium,
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
        child: SealLoader(label: 'Please wait…'),
      ),
    ),
  ],
);
```
