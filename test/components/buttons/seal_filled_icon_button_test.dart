import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Widget _wrap(Widget child) {
  return ShadApp(
    home: SealThemeScope(
      tokens: SealThemeFactory.darkTokens(),
      child: Center(child: child),
    ),
  );
}

void main() {
  group('SealFilledIconButton.primary', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledIconButton.primary(icon: LucideIcons.plus, onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.byIcon(LucideIcons.plus), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealFilledIconButton.primary(
            icon: LucideIcons.plus,
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(ShadIconButton));
      expect(tapped, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          const SealFilledIconButton.primary(
            icon: LucideIcons.plus,
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(ShadIconButton));
      expect(tapped, isFalse);
    });

    testWidgets('renders ShadIconButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledIconButton.primary(icon: LucideIcons.plus, onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.byType(ShadIconButton), findsOneWidget);
    });

    testWidgets('shows tooltip when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledIconButton.primary(
            icon: LucideIcons.plus,
            onPressed: () {},
            tooltip: 'Add item',
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ShadTooltip), findsOneWidget);
    });
  });

  group('SealFilledIconButton.accent', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledIconButton.accent(icon: LucideIcons.star, onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.byIcon(LucideIcons.star), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealFilledIconButton.accent(
            icon: LucideIcons.star,
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(ShadIconButton));
      expect(tapped, isTrue);
    });

    testWidgets('renders ShadIconButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledIconButton.accent(icon: LucideIcons.star, onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.byType(ShadIconButton), findsOneWidget);
    });
  });

  group('SealFilledIconButton.accentSecondary', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledIconButton.accentSecondary(
            icon: LucideIcons.pencil,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(LucideIcons.pencil), findsOneWidget);
    });

    testWidgets('renders ShadIconButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledIconButton.accentSecondary(
            icon: LucideIcons.pencil,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ShadIconButton), findsOneWidget);
    });
  });

  group('SealFilledIconButton.gradient', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledIconButton.gradient(
            icon: LucideIcons.rocket,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(LucideIcons.rocket), findsOneWidget);
    });

    testWidgets('renders ShadIconButton', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledIconButton.gradient(
            icon: LucideIcons.rocket,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ShadIconButton), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealFilledIconButton.gradient(
            icon: LucideIcons.rocket,
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(ShadIconButton));
      expect(tapped, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          const SealFilledIconButton.gradient(
            icon: LucideIcons.rocket,
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(ShadIconButton));
      expect(tapped, isFalse);
    });

    testWidgets('shows tooltip when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledIconButton.gradient(
            icon: LucideIcons.rocket,
            onPressed: () {},
            tooltip: 'Launch',
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ShadTooltip), findsOneWidget);
    });
  });

  group('SealFilledIconButton.accentGradient', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledIconButton.accentGradient(
            icon: LucideIcons.zap,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(LucideIcons.zap), findsOneWidget);
    });

    testWidgets('renders ShadIconButton', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledIconButton.accentGradient(
            icon: LucideIcons.zap,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ShadIconButton), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealFilledIconButton.accentGradient(
            icon: LucideIcons.zap,
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(ShadIconButton));
      expect(tapped, isTrue);
    });
  });
}
