import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';

/// Showcases feedback components: [SealAlert], [SealLoader], [SealProgress],
/// [SealSonner], and [SealToast].
class FeedbackSection extends StatelessWidget {
  /// Creates a [FeedbackSection].
  const FeedbackSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;
    final typo = context.themeTokens.typography;
    final dimension = context.dimension;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Feedback', style: typo.title.copyWith(color: colors.textPrimary)),
        dimension.md.verticalGap,

        // ── Alert ────────────────────────────────────────────────────────
        Text('Alert', style: typo.subtitle.copyWith(color: colors.textSecondary)),
        dimension.xs.verticalGap,
        Column(
          children: [
            SealAlert.info(
              title: 'Heads up!',
              description: 'You can add components to your app using the CLI.',
            ),
            dimension.sm.verticalGap,
            SealAlert.success(
              title: 'Profile updated',
              description: 'Your changes have been saved successfully.',
            ),
            dimension.sm.verticalGap,
            SealAlert.warning(
              title: 'Low storage',
              description:
                  'You have less than 1 GB remaining. Consider clearing cache.',
            ),
            dimension.sm.verticalGap,
            SealAlert.error(
              title: 'Upload failed',
              description: 'The file could not be uploaded. Please try again.',
            ),
          ],
        ),

        dimension.xl.verticalGap,

        // ── Loader ───────────────────────────────────────────────────────
        Text('Loader', style: typo.subtitle.copyWith(color: colors.textSecondary)),
        dimension.xs.verticalGap,
        Row(
          spacing: dimension.lg,
          children: [
            SealLoader(size: SealLoaderSize.small),
            SealLoader(size: SealLoaderSize.medium),
            SealLoader(size: SealLoaderSize.large),
            SealLoader(size: SealLoaderSize.medium, label: 'Loading…'),
          ],
        ),

        dimension.xl.verticalGap,

        // ── Progress ─────────────────────────────────────────────────────
        Text(
          'Progress',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.xs.verticalGap,
        const SealProgress(value: 0.3),
        dimension.xs.verticalGap,
        const SealProgress(value: 0.65, useAccent: true),
        dimension.xs.verticalGap,
        const SealProgress(value: 1.0),
        dimension.xs.verticalGap,
        const SealProgress(),

        dimension.xl.verticalGap,

        // ── Toast ────────────────────────────────────────────────────────
        Text('Toast', style: typo.subtitle.copyWith(color: colors.textSecondary)),
        dimension.xs.verticalGap,
        Wrap(
          spacing: dimension.sm,
          runSpacing: dimension.sm,
          children: [
            SealFilledButton.primary(
              label: const Text('Info'),
              onPressed: () => SealToast.info(
                message: const Text('This is an informational message.'),
                title: const Text('Info'),
              ).show(context),
            ),
            SealFilledButton.accent(
              label: const Text('Success'),
              onPressed: () => SealToast.success(
                message: const Text('Your changes have been saved.'),
                title: const Text('Success'),
              ).show(context),
            ),
            SealFilledButton.primary(
              label: const Text('Warning'),
              onPressed: () => SealToast.warning(
                message: const Text('This action might have side effects.'),
                title: const Text('Warning'),
              ).show(context),
            ),
            SealFilledButton.primary(
              label: const Text('Error + action'),
              onPressed: () => SealToast.error(
                message: const Text('Something went wrong. Please try again.'),
                title: const Text('Error'),
                actionLabel: const Text('Retry'),
                onAction: () {},
              ).show(context),
            ),
          ],
        ),

        dimension.xl.verticalGap,

        // ── Sonner ───────────────────────────────────────────────────────
        Text('Sonner', style: typo.subtitle.copyWith(color: colors.textSecondary)),
        dimension.xs.verticalGap,
        SealSonner(
          child: Builder(
            builder: (ctx) => Wrap(
              spacing: dimension.sm,
              runSpacing: dimension.sm,
              children: [
                SealFilledButton.primary(
                  label: const Text('Show Sonner'),
                  onPressed: () => showSealSonner(
                    ctx,
                    title: const Text('File saved'),
                    description: const Text('Your changes have been synced.'),
                  ),
                ),
                SealOutlineButton.primary(
                  label: const Text('With description'),
                  onPressed: () => showSealSonner(
                    ctx,
                    title: const Text('Upload complete'),
                    description: const Text('3 files uploaded successfully.'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
