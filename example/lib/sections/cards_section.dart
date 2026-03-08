import 'package:flutter/material.dart';
import 'package:nebula_ui/nebula_ui.dart';

/// Showcases card variants: default with footer and gradient.
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
        NebulaCard(
          header: Text(
            'Nebula Card',
            style: typo.title.copyWith(color: colors.textPrimary),
          ),
          body: Text(
            'A themed card with header, body, and footer sections using design tokens.',
            style: typo.body.copyWith(color: colors.textSecondary),
          ),
          footer: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              NebulaOutlineButton.gradient(label: 'Cancel', onPressed: () {}),
              dimension.sm.horizontalGap,
              NebulaFilledButton.gradient(label: 'Confirm', onPressed: () {}),
            ],
          ),
        ),
        dimension.sm.verticalGap,
        NebulaCard(
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
      ],
    );
  }
}
