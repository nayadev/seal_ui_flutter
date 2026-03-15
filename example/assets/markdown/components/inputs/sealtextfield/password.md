# SealTextField — Password

A text field configured for **secure password entry** with `obscureText: true`, lock prefix icon, and a visibility toggle suffix icon.

## Usage

```dart
SealTextField(
  label: 'Password',
  hint: '••••••••',
  obscureText: true,
  prefixIcon: Icons.lock_outline,
  suffixIcon: Icons.visibility_off_outlined,
  onChanged: (value) {},
);
```

## With visibility toggle (stateful)

```dart
class _PasswordField extends StatefulWidget {
  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return SealTextField(
      label: 'Password',
      hint: '••••••••',
      obscureText: _obscure,
      prefixIcon: Icons.lock_outline,
      suffixIcon: _obscure
          ? Icons.visibility_off_outlined
          : Icons.visibility_outlined,
      onSuffixTap: () => setState(() => _obscure = !_obscure),
      onChanged: (value) {},
    );
  }
}
```
