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
  group('SealIconButton.primary', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(SealIconButton.primary(icon: LucideIcons.x, onPressed: () {})),
      );
      await tester.pump();

      expect(find.byIcon(LucideIcons.x), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealIconButton.primary(
            icon: LucideIcons.x,
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
          const SealIconButton.primary(icon: LucideIcons.x, onPressed: null),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(ShadIconButton));
      expect(tapped, isFalse);
    });

    testWidgets('renders icon correctly', (tester) async {
      await tester.pumpWidget(
        _wrap(SealIconButton.primary(icon: LucideIcons.x, onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(ShadIconButton), findsOneWidget);
    });

    testWidgets('shows tooltip when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealIconButton.primary(
            icon: LucideIcons.x,
            onPressed: () {},
            tooltip: 'Close',
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ShadTooltip), findsOneWidget);
    });
  });

  group('SealIconButton.accent', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(SealIconButton.accent(icon: LucideIcons.ellipsisVertical, onPressed: () {})),
      );
      await tester.pump();

      expect(find.byIcon(LucideIcons.ellipsisVertical), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealIconButton.accent(
            icon: LucideIcons.ellipsisVertical,
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(ShadIconButton));
      expect(tapped, isTrue);
    });

    testWidgets('renders icon correctly', (tester) async {
      await tester.pumpWidget(
        _wrap(SealIconButton.accent(icon: LucideIcons.ellipsisVertical, onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(ShadIconButton), findsOneWidget);
    });
  });

  group('SealIconButton.accentSecondary', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealIconButton.accentSecondary(
            icon: LucideIcons.info,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(LucideIcons.info), findsOneWidget);
    });

    testWidgets('renders icon correctly', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealIconButton.accentSecondary(
            icon: LucideIcons.info,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ShadIconButton), findsOneWidget);
    });
  });

  group('SealIconButton.gradient', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealIconButton.gradient(icon: LucideIcons.slidersHorizontal, onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.byIcon(LucideIcons.slidersHorizontal), findsOneWidget);
    });

    testWidgets('uses ShaderMask for gradient effect', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealIconButton.gradient(icon: LucideIcons.slidersHorizontal, onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.byType(ShaderMask), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealIconButton.gradient(
            icon: LucideIcons.slidersHorizontal,
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
          const SealIconButton.gradient(
            icon: LucideIcons.slidersHorizontal,
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
          SealIconButton.gradient(
            icon: LucideIcons.slidersHorizontal,
            onPressed: () {},
            tooltip: 'Filter',
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ShadTooltip), findsOneWidget);
    });
  });

  group('SealIconButton.accentGradient', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealIconButton.accentGradient(
            icon: LucideIcons.search,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(LucideIcons.search), findsOneWidget);
    });

    testWidgets('uses ShaderMask for gradient effect', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealIconButton.accentGradient(
            icon: LucideIcons.search,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ShaderMask), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealIconButton.accentGradient(
            icon: LucideIcons.search,
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
