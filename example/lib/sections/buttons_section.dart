import 'package:flutter/widgets.dart';
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
              icon: LucideIcons.rocket,
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
              icon: LucideIcons.star,
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
              icon: LucideIcons.arrowRight,
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
              icon: LucideIcons.x,
              onPressed: () {},
              tooltip: 'Close',
            ),
            SealIconButton.accent(
              icon: LucideIcons.ellipsisVertical,
              onPressed: () {},
              tooltip: 'More',
            ),
            SealIconButton.accentSecondary(
              icon: LucideIcons.info,
              onPressed: () {},
              tooltip: 'Info',
            ),
            SealIconButton.gradient(
              icon: LucideIcons.slidersHorizontal,
              onPressed: () {},
              tooltip: 'Filter',
            ),
            SealIconButton.accentGradient(
              icon: LucideIcons.search,
              onPressed: () {},
              tooltip: 'Search',
            ),
            const SealIconButton.primary(
              icon: LucideIcons.ban,
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
              icon: LucideIcons.plus,
              onPressed: () {},
              tooltip: 'Add',
            ),
            SealFilledIconButton.accent(
              icon: LucideIcons.star,
              onPressed: () {},
              tooltip: 'Favorite',
            ),
            SealFilledIconButton.accentSecondary(
              icon: LucideIcons.pencil,
              onPressed: () {},
              tooltip: 'Edit',
            ),
            SealFilledIconButton.gradient(
              icon: LucideIcons.rocket,
              onPressed: () {},
              tooltip: 'Launch',
            ),
            SealFilledIconButton.accentGradient(
              icon: LucideIcons.zap,
              onPressed: () {},
              tooltip: 'Boost',
            ),
            const SealFilledIconButton.primary(
              icon: LucideIcons.ban,
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
              icon: LucideIcons.share,
              onPressed: () {},
              tooltip: 'Share',
            ),
            SealOutlineIconButton.accent(
              icon: LucideIcons.bookmark,
              onPressed: () {},
              tooltip: 'Save',
            ),
            SealOutlineIconButton.accentSecondary(
              icon: LucideIcons.slidersHorizontal,
              onPressed: () {},
              tooltip: 'Filter',
            ),
            SealOutlineIconButton.gradient(
              icon: LucideIcons.sparkles,
              onPressed: () {},
              tooltip: 'Magic',
            ),
            SealOutlineIconButton.accentGradient(
              icon: LucideIcons.zap,
              onPressed: () {},
              tooltip: 'Boost',
            ),
            const SealOutlineIconButton.primary(
              icon: LucideIcons.ban,
              onPressed: null,
              tooltip: 'Disabled',
            ),
          ],
        ),
      ],
    );
  }
}
