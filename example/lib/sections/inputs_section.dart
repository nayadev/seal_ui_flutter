import 'package:flutter/material.dart';
import 'package:nebula_ui/nebula_ui.dart';

/// Showcases text field variants.
class InputsSection extends StatelessWidget {
  const InputsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;
    final typo = context.themeTokens.typography;
    final dimension = context.dimension;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Inputs', style: typo.title.copyWith(color: colors.textPrimary)),
        dimension.md.verticalGap,
        const NebulaTextField(
          label: 'Email',
          hint: 'you@example.com',
          prefixIcon: Icons.email_outlined,
        ),
        dimension.sm.verticalGap,
        const NebulaTextField(
          label: 'Password',
          hint: '••••••••',
          obscureText: true,
          prefixIcon: Icons.lock_outline,
          suffixIcon: Icons.visibility_off_outlined,
        ),
      ],
    );
  }
}
