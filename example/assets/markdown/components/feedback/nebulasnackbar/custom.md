# NebulaSnackbar — Custom

A fully **customizable** notification with a custom icon, color or gradient, optional title, message, and action.

## Usage

```dart
NebulaSnackbar.custom(
  message: 'Achievement unlocked!',
  icon: Icons.emoji_events_rounded,
  gradient: context.themeTokens.gradients.primaryGradient,
).show(context);
```

## With solid color

```dart
NebulaSnackbar.custom(
  title: 'New Badge',
  message: 'You earned the Explorer badge.',
  icon: Icons.workspace_premium_rounded,
  color: context.themeTokens.colors.primary,
).show(context);
```

## With action button

```dart
NebulaSnackbar.custom(
  title: 'Invite Sent',
  message: 'Your team member was invited.',
  icon: Icons.person_add_rounded,
  gradient: context.themeTokens.gradients.accentGradient,
  actionLabel: 'View',
  onAction: () {
    // navigate to team screen
  },
).show(context);
```
