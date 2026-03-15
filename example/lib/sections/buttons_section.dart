import 'package:flutter/material.dart';
import 'package:seal_ui/seal_ui.dart';

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
            SealFilledButton.primary(label: 'Primary', onPressed: () {}),
            SealFilledButton.accent(label: 'Accent', onPressed: () {}),
            SealFilledButton.accentSecondary(
              label: 'Accent Secondary',
              onPressed: () {},
            ),
            SealFilledButton.gradient(label: 'Gradient', onPressed: () {}),
            SealFilledButton.accentGradient(
              label: 'Accent Gradient',
              onPressed: () {},
            ),
            SealFilledButton.gradient(
              label: 'Explore',
              icon: Icons.rocket_launch_rounded,
              onPressed: () {},
            ),
            const SealFilledButton.primary(label: 'Disabled'),
            const SealFilledButton.primary(
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
            SealOutlineButton.primary(label: 'Primary', onPressed: () {}),
            SealOutlineButton.accent(label: 'Accent', onPressed: () {}),
            SealOutlineButton.accentSecondary(
              label: 'Accent Secondary',
              onPressed: () {},
            ),
            SealOutlineButton.gradient(label: 'Gradient', onPressed: () {}),
            SealOutlineButton.accentGradient(
              label: 'Accent Gradient',
              onPressed: () {},
            ),
            SealOutlineButton.primary(
              label: 'With Icon',
              icon: Icons.star_outline_rounded,
              onPressed: () {},
            ),
            const SealOutlineButton.primary(label: 'Disabled'),
            const SealOutlineButton.primary(
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
            SealTextButton.primary(label: 'Primary', onPressed: () {}),
            SealTextButton.accent(label: 'Accent', onPressed: () {}),
            SealTextButton.accentSecondary(
              label: 'Accent Secondary',
              onPressed: () {},
            ),
            SealTextButton.gradient(label: 'Gradient', onPressed: () {}),
            SealTextButton.accentGradient(
              label: 'Accent Gradient',
              onPressed: () {},
            ),
            SealTextButton.primary(
              label: 'With Icon',
              icon: Icons.arrow_forward_rounded,
              onPressed: () {},
            ),
            const SealTextButton.primary(label: 'Disabled'),
            const SealTextButton.primary(
              label: 'Loading',
              isLoading: true,
              onPressed: null,
            ),
          ],
        ),
        dimension.md.verticalGap,
        Text(
          'Icon Button',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.sm.verticalGap,
        Wrap(
          spacing: dimension.sm,
          runSpacing: dimension.sm,
          children: [
            SealIconButton.primary(
              icon: Icons.close_rounded,
              onPressed: () {},
              tooltip: 'Close',
            ),
            SealIconButton.accent(
              icon: Icons.more_vert_rounded,
              onPressed: () {},
              tooltip: 'More',
            ),
            SealIconButton.accentSecondary(
              icon: Icons.info_outline_rounded,
              onPressed: () {},
              tooltip: 'Info',
            ),
            SealIconButton.gradient(
              icon: Icons.tune_rounded,
              onPressed: () {},
              tooltip: 'Filter',
            ),
            SealIconButton.accentGradient(
              icon: Icons.search_rounded,
              onPressed: () {},
              tooltip: 'Search',
            ),
            const SealIconButton.primary(
              icon: Icons.block_rounded,
              onPressed: null,
              tooltip: 'Disabled',
            ),
          ],
        ),
        dimension.md.verticalGap,
        Text(
          'Icon Button — Filled',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.sm.verticalGap,
        Wrap(
          spacing: dimension.sm,
          runSpacing: dimension.sm,
          children: [
            SealFilledIconButton.primary(
              icon: Icons.add_rounded,
              onPressed: () {},
              tooltip: 'Add',
            ),
            SealFilledIconButton.accent(
              icon: Icons.star_rounded,
              onPressed: () {},
              tooltip: 'Favorite',
            ),
            SealFilledIconButton.accentSecondary(
              icon: Icons.edit_rounded,
              onPressed: () {},
              tooltip: 'Edit',
            ),
            SealFilledIconButton.gradient(
              icon: Icons.rocket_launch_rounded,
              onPressed: () {},
              tooltip: 'Launch',
            ),
            SealFilledIconButton.accentGradient(
              icon: Icons.bolt_rounded,
              onPressed: () {},
              tooltip: 'Boost',
            ),
            const SealFilledIconButton.primary(
              icon: Icons.block_rounded,
              onPressed: null,
              tooltip: 'Disabled',
            ),
          ],
        ),
        dimension.md.verticalGap,
        Text(
          'Icon Button — Outline',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.sm.verticalGap,
        Wrap(
          spacing: dimension.sm,
          runSpacing: dimension.sm,
          children: [
            SealOutlineIconButton.primary(
              icon: Icons.share_rounded,
              onPressed: () {},
              tooltip: 'Share',
            ),
            SealOutlineIconButton.accent(
              icon: Icons.bookmark_outline_rounded,
              onPressed: () {},
              tooltip: 'Save',
            ),
            SealOutlineIconButton.accentSecondary(
              icon: Icons.tune_rounded,
              onPressed: () {},
              tooltip: 'Filter',
            ),
            SealOutlineIconButton.gradient(
              icon: Icons.auto_awesome_rounded,
              onPressed: () {},
              tooltip: 'Magic',
            ),
            SealOutlineIconButton.accentGradient(
              icon: Icons.flash_on_rounded,
              onPressed: () {},
              tooltip: 'Boost',
            ),
            const SealOutlineIconButton.primary(
              icon: Icons.block_rounded,
              onPressed: null,
              tooltip: 'Disabled',
            ),
          ],
        ),
      ],
    );
  }
}
