# SealBreadcrumb — With Dropdown

Use `SealBreadcrumbDropdown` with `SealBreadcrumbEllipsis` to collapse hidden
navigation levels into a popover menu.

## Usage

```dart
SealBreadcrumb(
  children: [
    SealBreadcrumbLink(onPressed: () {}, child: const Text('Home')),
    SealBreadcrumbDropdown(
      items: [
        SealBreadcrumbDropMenuItem(
          onPressed: () {},
          child: const Text('Documentation'),
        ),
        SealBreadcrumbDropMenuItem(
          onPressed: () {},
          child: const Text('Themes'),
        ),
      ],
      child: const SealBreadcrumbEllipsis(),
    ),
    const Text('Components'),
  ],
)
```
