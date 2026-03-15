import 'package:flutter/material.dart';
import 'package:seal_ui/seal_ui.dart';

/// Showcases container variants: default and gradient.
class ContainersSection extends StatelessWidget {
  const ContainersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;
    final dimension = context.dimension;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Container',
          style: typo.title.copyWith(color: colors.textPrimary),
        ),
        dimension.md.verticalGap,
        SealContainer(
          child: Row(
            children: [
              Icon(Icons.auto_awesome, color: colors.primary),
              dimension.sm.horizontalGap,
              Expanded(
                child: Text(
                  'A SealContainer using surface color and border tokens.',
                  style: typo.body.copyWith(color: colors.textPrimary),
                ),
              ),
            ],
          ),
        ),
        dimension.sm.verticalGap,
        SealContainer(
          gradient: tokens.gradients.surfaceGradient,
          child: Text(
            'Gradient surface container.',
            style: typo.body.copyWith(color: colors.textPrimary),
          ),
        ),
      ],
    );
  }
}
