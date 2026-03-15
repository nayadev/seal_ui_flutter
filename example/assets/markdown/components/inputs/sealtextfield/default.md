# SealTextField — Default

A themed text field with an optional **label**, **hint**, **prefix icon**, and **suffix icon**. Integrates with the Seal token system for consistent styling.

## Usage

```dart
SealTextField(
  label: 'Email',
  hint: 'you@example.com',
  onChanged: (value) {
    // handle input
  },
);
```

## With prefix icon

```dart
SealTextField(
  label: 'Email',
  hint: 'you@example.com',
  prefixIcon: Icons.email_outlined,
  onChanged: (value) {},
);
```

## Disabled state

```dart
SealTextField(
  label: 'Email',
  hint: 'you@example.com',
  enabled: false,
);
```

## With controller

```dart
final controller = TextEditingController();

SealTextField(
  label: 'Username',
  controller: controller,
  onChanged: (value) {},
);
```
