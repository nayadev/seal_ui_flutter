# NebulaTextField — Default

A themed text field with an optional **label**, **hint**, **prefix icon**, and **suffix icon**. Integrates with the Nebula token system for consistent styling.

## Usage

```dart
NebulaTextField(
  label: 'Email',
  hint: 'you@example.com',
  onChanged: (value) {
    // handle input
  },
);
```

## With prefix icon

```dart
NebulaTextField(
  label: 'Email',
  hint: 'you@example.com',
  prefixIcon: Icons.email_outlined,
  onChanged: (value) {},
);
```

## Disabled state

```dart
NebulaTextField(
  label: 'Email',
  hint: 'you@example.com',
  enabled: false,
);
```

## With controller

```dart
final controller = TextEditingController();

NebulaTextField(
  label: 'Username',
  controller: controller,
  onChanged: (value) {},
);
```
