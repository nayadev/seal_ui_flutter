# SealAvatar — Default

A token-driven circular avatar built on `ShadAvatar`. Loads an image
from any source supported by `UniversalImage` and falls back to
`placeholder` while loading or on error.

## Usage

```dart
SealAvatar(
  src: 'https://example.com/avatar.png',
  placeholder: const Text('JD'),
)
```

## Asset image

```dart
SealAvatar(
  src: 'assets/images/avatar.png',
  placeholder: const Icon(LucideIcons.user),
)
```
