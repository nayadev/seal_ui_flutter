import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';

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
        const SealTextField(
          label: 'Email',
          hint: 'you@example.com',
          prefixIcon: LucideIcons.mail,
        ),
        dimension.sm.verticalGap,
        const SealTextField(
          label: 'Password',
          hint: '••••••••',
          obscureText: true,
          prefixIcon: LucideIcons.lock,
          suffixIcon: LucideIcons.eyeOff,
        ),
        dimension.lg.verticalGap,
        Text(
          'Textarea',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.xs.verticalGap,
        const SealTextarea(
          label: 'Description',
          hint: 'Enter a description…',
        ),
        dimension.xs.verticalGap,
        const SealTextarea(
          hint: 'Disabled',
          enabled: false,
        ),
        dimension.lg.verticalGap,

        Text(
          'Slider',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.xs.verticalGap,
        SealSlider(value: 0.4, onChanged: (_) {}),
        dimension.xs.verticalGap,
        SealSlider(value: 60, min: 0, max: 100, divisions: 10, onChanged: (_) {}),
        dimension.xs.verticalGap,
        const SealSlider(value: 0.5, enabled: false),
      ],
    );
  }
}
