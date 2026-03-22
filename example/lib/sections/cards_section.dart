import 'package:flutter/material.dart';
import 'package:seal_ui/seal_ui.dart';

/// Showcases card variants: default with footer, gradient, and tappable.
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
              SealOutlineButton.gradient(label: 'Cancel', onPressed: () {}),
              dimension.sm.horizontalGap,
              SealFilledButton.gradient(label: 'Confirm', onPressed: () {}),
            ],
          ),
        ),
        dimension.sm.verticalGap,
        SealCard(
          gradient: tokens.gradients.surfaceGradient,
          showBorder: false,
          header: Row(
            children: [
              Icon(Icons.auto_awesome, color: colors.textPrimary),
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
          Icon(Icons.touch_app_rounded, color: colors.accent),
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
