import 'package:flutter/material.dart';
import 'package:nebula_ui/nebula_ui.dart';

/// Showcases the four [NebulaSnackbar] semantic variants plus custom ones.
class SnackbarSection extends StatelessWidget {
  const SnackbarSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;
    final typo = context.themeTokens.typography;
    final dimension = context.dimension;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Snackbar', style: typo.title.copyWith(color: colors.textPrimary)),
        dimension.md.verticalGap,
        Wrap(
          spacing: dimension.sm,
          runSpacing: dimension.sm,
          children: [
            NebulaFilledButton.gradient(
              label: 'Info',
              onPressed: () => NebulaSnackbar.info(
                message: 'This is an informational message.',
                title: 'Info',
              ).show(context),
            ),
            NebulaFilledButton.accentGradient(
              label: 'Success',
              onPressed: () => NebulaSnackbar.success(
                message: 'Your changes have been saved.',
                title: 'Success',
              ).show(context),
            ),
            NebulaFilledButton.primary(
              label: 'Warning',
              onPressed: () => NebulaSnackbar.warning(
                message: 'This action might have side effects.',
                title: 'Warning',
              ).show(context),
            ),
            NebulaFilledButton.primary(
              label: 'Error',
              onPressed: () => NebulaSnackbar.error(
                message: 'Something went wrong. Please try again.',
                title: 'Error',
                actionLabel: 'Retry',
                onAction: () {},
              ).show(context),
            ),
            NebulaFilledButton.primary(
              label: 'Custom (color)',
              onPressed: () => NebulaSnackbar.custom(
                message: 'You have unlocked a special trophy.',
                title: 'Achievement',
                icon: Icons.emoji_events_rounded,
                color: context.themeTokens.colors.primary,
                actionLabel: 'View',
                onAction: () {},
              ).show(context),
            ),
            NebulaFilledButton.gradient(
              label: 'Custom (gradient)',
              onPressed: () => NebulaSnackbar.custom(
                message: 'You have unlocked a special trophy.',
                title: 'Achievement',
                icon: Icons.emoji_events_rounded,
                gradient: context.themeTokens.gradients.primaryGradient,
                actionLabel: 'View',
                onAction: () {},
              ).show(context),
            ),
          ],
        ),
      ],
    );
  }
}
