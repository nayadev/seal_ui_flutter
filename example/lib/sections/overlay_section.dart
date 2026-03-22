import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';

/// Showcases overlay components: [SealDialog] and [SealSheet].
class OverlaySection extends StatelessWidget {
  const OverlaySection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;
    final typo = context.themeTokens.typography;
    final dimension = context.dimension;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Overlay', style: typo.title.copyWith(color: colors.textPrimary)),
        dimension.md.verticalGap,

        // ── Dialog ───────────────────────────────────────────────────────
        Text(
          'Dialog',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.xs.verticalGap,
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
                    description: const Text('Make changes to your profile here.'),
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
                    description: const Text('This action cannot be undone.'),
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
        Text(
          'Sheet',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.xs.verticalGap,
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
                  side: SealSheetSide.right,
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
      ],
    );
  }
}
