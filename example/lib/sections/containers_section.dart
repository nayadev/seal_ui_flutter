import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';

/// Showcases container and tabs variants.
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
              Icon(LucideIcons.sparkles, color: colors.primary),
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
        dimension.xl.verticalGap,

        Text('Accordion', style: typo.title.copyWith(color: colors.textPrimary)),
        dimension.sm.verticalGap,
        SealAccordion<String>(
          items: [
            SealAccordionItem(
              value: 'q1',
              title: const Text('What is Seal UI?'),
              child: Text(
                'A token-driven Flutter design system built on shadcn_ui.',
                style: typo.body.copyWith(color: colors.textSecondary),
              ),
            ),
            SealAccordionItem(
              value: 'q2',
              title: const Text('How do I install it?'),
              child: Text(
                'Add seal_ui to your pubspec.yaml dependencies.',
                style: typo.body.copyWith(color: colors.textSecondary),
              ),
            ),
            SealAccordionItem(
              value: 'q3',
              title: const Text('Does it support dark mode?'),
              child: Text(
                'Yes — dark mode is the primary experience.',
                style: typo.body.copyWith(color: colors.textSecondary),
              ),
            ),
          ],
        ),
        dimension.xl.verticalGap,

        Text('Tabs', style: typo.title.copyWith(color: colors.textPrimary)),
        dimension.sm.verticalGap,
        SealTabs<String>(
          value: 'account',
          tabs: [
            SealTab(
              value: 'account',
              label: const Text('Account'),
              content: Padding(
                padding: EdgeInsets.all(dimension.md),
                child: Text(
                  'Manage your account settings.',
                  style: typo.body.copyWith(color: colors.textSecondary),
                ),
              ),
            ),
            SealTab(
              value: 'security',
              label: const Text('Security'),
              content: Padding(
                padding: EdgeInsets.all(dimension.md),
                child: Text(
                  'Update your password and 2FA.',
                  style: typo.body.copyWith(color: colors.textSecondary),
                ),
              ),
            ),
            SealTab(
              value: 'billing',
              label: const Text('Billing'),
              content: Padding(
                padding: EdgeInsets.all(dimension.md),
                child: Text(
                  'View invoices and payment methods.',
                  style: typo.body.copyWith(color: colors.textSecondary),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
