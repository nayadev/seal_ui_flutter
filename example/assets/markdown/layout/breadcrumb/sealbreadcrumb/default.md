# SealBreadcrumb — Default

A token-styled breadcrumb navigation built on `ShadBreadcrumb`. The last item
is styled as the active page; all preceding items are interactive links.

## Usage

```dart
SealBreadcrumb(
  children: [
    SealBreadcrumbLink(
      onPressed: () => Navigator.pop(context),
      child: const Text('Home'),
    ),
    SealBreadcrumbLink(
      onPressed: () {},
      child: const Text('Settings'),
    ),
    const Text('Profile'),
  ],
)
```
