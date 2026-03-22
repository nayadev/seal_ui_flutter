import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';

/// Showcases card variants and badge components.
class CardsSection extends StatelessWidget {
  const CardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;
    final dimension = context.dimension;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Card', style: typo.title.copyWith(color: colors.textPrimary)),
        dimension.md.verticalGap,
        SealCard(
          header: Text(
            'Seal Card',
            style: typo.title.copyWith(color: colors.textPrimary),
          ),
          body: Text(
            'A themed card with header, body, and footer sections using design tokens.',
            style: typo.body.copyWith(color: colors.textSecondary),
          ),
          footer: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SealOutlineButton.gradient(
                label: const Text('Cancel'),
                onPressed: () {},
              ),
              dimension.sm.horizontalGap,
              SealFilledButton.gradient(
                label: const Text('Confirm'),
                onPressed: () {},
              ),
            ],
          ),
        ),
        dimension.sm.verticalGap,
        SealCard(
          gradient: tokens.gradients.surfaceGradient,
          showBorder: false,
          header: Row(
            children: [
              Icon(LucideIcons.sparkles, color: colors.textPrimary),
              dimension.xs.horizontalGap,
              Text(
                'Gradient Card',
                style: typo.title.copyWith(color: colors.textPrimary),
              ),
            ],
          ),
          body: Text(
            'A card with gradient background and no footer.',
            style: typo.body.copyWith(color: colors.textPrimary),
          ),
        ),
        dimension.sm.verticalGap,
        _TappableCardExample(),
        dimension.xl.verticalGap,
        Text('Avatar', style: typo.title.copyWith(color: colors.textPrimary)),
        dimension.sm.verticalGap,
        Wrap(
          spacing: dimension.md,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: const [
            SealAvatar.small(src: '', placeholder: Text('S')),
            SealAvatar(src: '', placeholder: Text('M')),
            SealAvatar.large(src: '', placeholder: Text('L')),
          ],
        ),
        dimension.xl.verticalGap,

        Text('Badge', style: typo.title.copyWith(color: colors.textPrimary)),
        dimension.sm.verticalGap,
        Wrap(
          spacing: dimension.sm,
          runSpacing: dimension.sm,
          children: const [
            SealBadge.primary(child: Text('Primary')),
            SealBadge.accent(child: Text('Accent')),
            SealBadge.secondary(child: Text('Secondary')),
            SealBadge.outline(child: Text('Outline')),
            SealBadge.success(child: Text('Active')),
            SealBadge.warning(child: Text('Pending')),
            SealBadge.error(child: Text('Expired')),
          ],
        ),
      ],
    );
  }
}

class _TappableCardExample extends StatefulWidget {
  @override
  State<_TappableCardExample> createState() => _TappableCardExampleState();
}

class _TappableCardExampleState extends State<_TappableCardExample> {
  int _tapCount = 0;

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;
    final dimension = context.dimension;

    return SealCard(
      onTap: () => setState(() => _tapCount++),
      header: Row(
        children: [
          Icon(LucideIcons.pointer, color: colors.accent),
          dimension.xs.horizontalGap,
          Text(
            'Tappable Card',
            style: typo.title.copyWith(color: colors.textPrimary),
          ),
        ],
      ),
      body: Text(
        _tapCount == 0
            ? 'Tap this card to see the press feedback.'
            : 'Tapped $_tapCount time${_tapCount == 1 ? '' : 's'}.',
        style: typo.body.copyWith(color: colors.textSecondary),
      ),
    );
  }
}
