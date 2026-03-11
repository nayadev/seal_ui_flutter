# Spacing Scale — Visual Guide

The Nebula spacing system is based on a **base token scale** that adapts proportionally across breakpoints via a scale factor.

| Token | Base value | Mobile (1.0×) | Tablet (1.125×) | Desktop (1.5×) |
|-------|-----------|--------------|----------------|---------------|
| `xxxs` | 2 dp | 2 | 2 | 3 |
| `xxs` | 4 dp | 4 | 4.5 | 6 |
| `xs` | 8 dp | 8 | 9 | 12 |
| `sm` | 12 dp | 12 | 13.5 | 18 |
| `md` | 16 dp | 16 | 18 | 24 |
| `lg` | 24 dp | 24 | 27 | 36 |
| `xl` | 32 dp | 32 | 36 | 48 |
| `xxl` | 48 dp | 48 | 54 | 72 |
| `xxxl` | 64 dp | 64 | 72 | 96 |

## Usage

Always access spacing via `context.dimension` to benefit from responsive scaling:

```dart
Padding(
  padding: EdgeInsets.all(context.dimension.md),
  child: child,
);
```

## Gap extensions

```dart
Column(
  children: [
    Text('First item'),
    context.dimension.md.verticalGap,
    Text('Second item'),
    context.dimension.sm.verticalGap,
    Text('Third item'),
  ],
);
```

## Scaled custom sizes

For non-standard sizes, use `scaled()` to participate in responsive scaling:

```dart
Icon(Icons.star, size: context.dimension.scaled(20));
```
