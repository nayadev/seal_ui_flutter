import 'package:flutter/material.dart';
import 'package:nebula_ui/nebula_ui.dart';

/// Showcases all button variants: Filled, Outline, and Text.
class ButtonsSection extends StatelessWidget {
  const ButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;
    final dimension = context.dimension;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Buttons', style: typo.title.copyWith(color: colors.textPrimary)),
        dimension.md.verticalGap,
        Text(
          'Filled',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.sm.verticalGap,
        Wrap(
          spacing: dimension.sm,
          runSpacing: dimension.sm,
          children: [
            NebulaFilledButton.primary(label: 'Primary', onPressed: () {}),
            NebulaFilledButton.accent(label: 'Accent', onPressed: () {}),
            NebulaFilledButton.accentSecondary(
              label: 'Accent Secondary',
              onPressed: () {},
            ),
            NebulaFilledButton.gradient(label: 'Gradient', onPressed: () {}),
            NebulaFilledButton.accentGradient(
              label: 'Accent Gradient',
              onPressed: () {},
            ),
            NebulaFilledButton.gradient(
              label: 'Explore',
              icon: Icons.rocket_launch_rounded,
              onPressed: () {},
            ),
            const NebulaFilledButton.primary(label: 'Disabled'),
            const NebulaFilledButton.primary(
              label: 'Loading',
              isLoading: true,
              onPressed: null,
            ),
          ],
        ),
        dimension.md.verticalGap,
        Text(
          'Outline',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.sm.verticalGap,
        Wrap(
          spacing: dimension.sm,
          runSpacing: dimension.sm,
          children: [
            NebulaOutlineButton.primary(label: 'Primary', onPressed: () {}),
            NebulaOutlineButton.accent(label: 'Accent', onPressed: () {}),
            NebulaOutlineButton.accentSecondary(
              label: 'Accent Secondary',
              onPressed: () {},
            ),
            NebulaOutlineButton.gradient(label: 'Gradient', onPressed: () {}),
            NebulaOutlineButton.accentGradient(
              label: 'Accent Gradient',
              onPressed: () {},
            ),
            NebulaOutlineButton.primary(
              label: 'With Icon',
              icon: Icons.star_outline_rounded,
              onPressed: () {},
            ),
            const NebulaOutlineButton.primary(label: 'Disabled'),
            const NebulaOutlineButton.primary(
              label: 'Loading',
              isLoading: true,
              onPressed: null,
            ),
          ],
        ),
        dimension.md.verticalGap,
        Text(
          'Text',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.sm.verticalGap,
        Wrap(
          spacing: dimension.sm,
          runSpacing: dimension.sm,
          children: [
            NebulaTextButton.primary(label: 'Primary', onPressed: () {}),
            NebulaTextButton.accent(label: 'Accent', onPressed: () {}),
            NebulaTextButton.accentSecondary(
              label: 'Accent Secondary',
              onPressed: () {},
            ),
            NebulaTextButton.gradient(label: 'Gradient', onPressed: () {}),
            NebulaTextButton.accentGradient(
              label: 'Accent Gradient',
              onPressed: () {},
            ),
            NebulaTextButton.primary(
              label: 'With Icon',
              icon: Icons.arrow_forward_rounded,
              onPressed: () {},
            ),
            const NebulaTextButton.primary(label: 'Disabled'),
            const NebulaTextButton.primary(
              label: 'Loading',
              isLoading: true,
              onPressed: null,
            ),
          ],
        ),
      ],
    );
  }
}
