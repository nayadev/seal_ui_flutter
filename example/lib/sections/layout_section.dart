import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';

/// Showcases layout and display components: [SealAccordion], [SealAvatar],
/// [SealBadge], [SealBreadcrumb], [SealCard], [SealContainer], and [SealTabs].
class LayoutSection extends StatelessWidget {
  const LayoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = context.themeTokens;
    final colors = tokens.colors;
    final typo = tokens.typography;
    final dimension = context.dimension;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Layout', style: typo.title.copyWith(color: colors.textPrimary)),
        dimension.md.verticalGap,

        // ── Accordion ────────────────────────────────────────────────────
        Text(
          'Accordion',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.xs.verticalGap,
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

        // ── Avatar ───────────────────────────────────────────────────────
        Text(
          'Avatar',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.xs.verticalGap,
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

        // ── Badge ────────────────────────────────────────────────────────
        Text(
          'Badge',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.xs.verticalGap,
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

        dimension.xl.verticalGap,

        // ── Card ─────────────────────────────────────────────────────────
        Text(
          'Card',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.xs.verticalGap,
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
        const _TappableCardExample(),

        dimension.xl.verticalGap,

        // ── Breadcrumb ───────────────────────────────────────────────────
        Text(
          'Breadcrumb',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.xs.verticalGap,
        SealBreadcrumb(
          children: [
            SealBreadcrumbLink(onPressed: () {}, child: const Text('Home')),
            SealBreadcrumbLink(
              onPressed: () {},
              child: const Text('Settings'),
            ),
            const Text('Profile'),
          ],
        ),
        dimension.sm.verticalGap,
        SealBreadcrumb(
          children: [
            SealBreadcrumbLink(onPressed: () {}, child: const Text('Home')),
            SealBreadcrumbDropdown(
              items: [
                SealBreadcrumbDropMenuItem(
                  onPressed: () {},
                  child: const Text('Documentation'),
                ),
                SealBreadcrumbDropMenuItem(
                  onPressed: () {},
                  child: const Text('Themes'),
                ),
              ],
              child: const SealBreadcrumbEllipsis(),
            ),
            const Text('Components'),
          ],
        ),

        dimension.xl.verticalGap,

        // ── Container ────────────────────────────────────────────────────
        Text(
          'Container',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.xs.verticalGap,
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

        // ── Tabs ─────────────────────────────────────────────────────────
        Text(
          'Tabs',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.xs.verticalGap,
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

class _TappableCardExample extends StatefulWidget {
  const _TappableCardExample();

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
