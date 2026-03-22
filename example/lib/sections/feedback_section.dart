import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadSheetSide;
import 'package:seal_ui/seal_ui.dart';

/// Showcases [SealToast] (transient notifications) and [SealAlert] (inline
/// banners) for all four semantic variants.
class FeedbackSection extends StatelessWidget {
  const FeedbackSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;
    final typo = context.themeTokens.typography;
    final dimension = context.dimension;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Toasts ──────────────────────────────────────────────────────
        Text('Toast', style: typo.title.copyWith(color: colors.textPrimary)),
        dimension.sm.verticalGap,
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

        // ── Progress ─────────────────────────────────────────────────────
        Text('Progress', style: typo.title.copyWith(color: colors.textPrimary)),
        dimension.sm.verticalGap,
        const SealProgress(value: 0.3),
        dimension.xs.verticalGap,
        const SealProgress(value: 0.65, useAccent: true),
        dimension.xs.verticalGap,
        const SealProgress(value: 1.0),
        dimension.xs.verticalGap,
        const SealProgress(),

        dimension.xl.verticalGap,

        // ── Dialog ───────────────────────────────────────────────────────
        Text('Dialog', style: typo.title.copyWith(color: colors.textPrimary)),
        dimension.sm.verticalGap,
        Builder(
          builder: (context) => Wrap(
            spacing: dimension.sm,
            runSpacing: dimension.sm,
            children: [
              SealFilledButton.primary(
                label: const Text('Open Dialog'),
                onPressed: () => showSealDialog<void>(
                  context: context,
                  builder: (_) => SealDialog(
                    title: const Text('Edit profile'),
                    description:
                        const Text('Make changes to your profile here.'),
                    actions: [
                      SealOutlineButton.primary(
                        label: const Text('Cancel'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      SealFilledButton.primary(
                        label: const Text('Save'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ),
              ),
              SealFilledButton.custom(
                label: const Text('Open Alert'),
                color: ColorX.red,
                onPressed: () => showSealDialog<void>(
                  context: context,
                  builder: (_) => SealDialog.alert(
                    title: const Text('Are you sure?'),
                    description:
                        const Text('This action cannot be undone.'),
                    actions: [
                      SealOutlineButton.primary(
                        label: const Text('Cancel'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      SealFilledButton.custom(
                        label: const Text('Delete'),
                        color: ColorX.red,
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        dimension.xl.verticalGap,

        // ── Sheet ────────────────────────────────────────────────────────
        Text('Sheet', style: typo.title.copyWith(color: colors.textPrimary)),
        dimension.sm.verticalGap,
        Builder(
          builder: (context) => Wrap(
            spacing: dimension.sm,
            runSpacing: dimension.sm,
            children: [
              SealFilledButton.primary(
                label: const Text('Bottom Sheet'),
                onPressed: () => showSealSheet<void>(
                  context: context,
                  builder: (ctx) => SealSheet(
                    title: const Text('Filter'),
                    description: const Text('Narrow down your results.'),
                    actions: [
                      SealOutlineButton.primary(
                        label: const Text('Reset'),
                        onPressed: () => Navigator.of(ctx).pop(),
                      ),
                      SealFilledButton.primary(
                        label: const Text('Apply'),
                        onPressed: () => Navigator.of(ctx).pop(),
                      ),
                    ],
                  ),
                ),
              ),
              SealOutlineButton.primary(
                label: const Text('Right Sheet'),
                onPressed: () => showSealSheet<void>(
                  context: context,
                  side: ShadSheetSide.right,
                  builder: (ctx) => SealSheet(
                    title: const Text('Settings'),
                    description: const Text('Configure your preferences.'),
                    actions: [
                      SealFilledButton.primary(
                        label: const Text('Done'),
                        onPressed: () => Navigator.of(ctx).pop(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        dimension.xl.verticalGap,

        // ── Alerts ──────────────────────────────────────────────────────
        Text('Alert', style: typo.title.copyWith(color: colors.textPrimary)),
        dimension.sm.verticalGap,
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
              description:
                  'The file could not be uploaded. Please try again.',
            ),
          ],
        ),
      ],
    );
  }
}
