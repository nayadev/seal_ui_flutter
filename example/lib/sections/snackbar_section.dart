import 'package:flutter/material.dart';
import 'package:seal_ui/seal_ui.dart';

/// Showcases the four [SealSnackbar] semantic variants plus custom ones.
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
            SealFilledButton.gradient(
              label: 'Info',
              onPressed: () => SealSnackbar.info(
                message: 'This is an informational message.',
                title: 'Info',
              ).show(context),
            ),
            SealFilledButton.accentGradient(
              label: 'Success',
              onPressed: () => SealSnackbar.success(
                message: 'Your changes have been saved.',
                title: 'Success',
              ).show(context),
            ),
            SealFilledButton.primary(
              label: 'Warning',
              onPressed: () => SealSnackbar.warning(
                message: 'This action might have side effects.',
                title: 'Warning',
              ).show(context),
            ),
            SealFilledButton.primary(
              label: 'Error',
              onPressed: () => SealSnackbar.error(
                message: 'Something went wrong. Please try again.',
                title: 'Error',
                actionLabel: 'Retry',
                onAction: () {},
              ).show(context),
            ),
            SealFilledButton.primary(
              label: 'Custom (color)',
              onPressed: () => SealSnackbar.custom(
                message: 'You have unlocked a special trophy.',
                title: 'Achievement',
                icon: Icons.emoji_events_rounded,
                color: context.themeTokens.colors.primary,
                actionLabel: 'View',
                onAction: () {},
              ).show(context),
            ),
            SealFilledButton.gradient(
              label: 'Custom (gradient)',
              onPressed: () => SealSnackbar.custom(
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
