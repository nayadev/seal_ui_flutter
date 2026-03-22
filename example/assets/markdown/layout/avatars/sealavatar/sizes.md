# SealAvatar — Sizes

Three convenience constructors cover the most common sizes. All sizes
scale proportionally with the current breakpoint factor.

| Constructor | Base size |
|---|---|
| `SealAvatar.small` | 28 dp |
| `SealAvatar` | 40 dp |
| `SealAvatar.large` | 56 dp |

## Usage

```dart
SealAvatar.small(src: _url, placeholder: const Text('S'))
SealAvatar(src: _url, placeholder: const Text('M'))
SealAvatar.large(src: _url, placeholder: const Text('L'))
```

## Custom size

```dart
SealAvatar(src: _url, size: 80)
```
