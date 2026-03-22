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
  group('SealOutlineIconButton.primary', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.primary(icon: LucideIcons.share, onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.byIcon(LucideIcons.share), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.primary(
            icon: LucideIcons.share,
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
          const SealOutlineIconButton.primary(
            icon: LucideIcons.share,
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(ShadIconButton));
      expect(tapped, isFalse);
    });

    testWidgets('renders icon correctly', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.primary(icon: LucideIcons.share, onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.byType(ShadIconButton), findsOneWidget);
    });

    testWidgets('shows tooltip when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.primary(
            icon: LucideIcons.share,
            onPressed: () {},
            tooltip: 'Share',
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ShadTooltip), findsOneWidget);
    });
  });

  group('SealOutlineIconButton.accent', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.accent(
            icon: LucideIcons.bookmark,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(LucideIcons.bookmark), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.accent(
            icon: LucideIcons.bookmark,
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
        _wrap(
          SealOutlineIconButton.accent(
            icon: LucideIcons.bookmark,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ShadIconButton), findsOneWidget);
    });
  });

  group('SealOutlineIconButton.accentSecondary', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.accentSecondary(
            icon: LucideIcons.slidersHorizontal,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(LucideIcons.slidersHorizontal), findsOneWidget);
    });

    testWidgets('renders icon correctly', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.accentSecondary(
            icon: LucideIcons.slidersHorizontal,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ShadIconButton), findsOneWidget);
    });
  });

  group('SealOutlineIconButton.gradient', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.gradient(
            icon: LucideIcons.sparkles,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(LucideIcons.sparkles), findsOneWidget);
    });

    testWidgets('uses ShaderMask for gradient effect', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.gradient(
            icon: LucideIcons.sparkles,
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
          SealOutlineIconButton.gradient(
            icon: LucideIcons.sparkles,
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
          const SealOutlineIconButton.gradient(
            icon: LucideIcons.sparkles,
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(ShadIconButton));
      expect(tapped, isFalse);
    });
  });

  group('SealOutlineIconButton.accentGradient', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.accentGradient(
            icon: LucideIcons.zap,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(LucideIcons.zap), findsOneWidget);
    });

    testWidgets('uses ShaderMask for gradient effect', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.accentGradient(
            icon: LucideIcons.zap,
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
          SealOutlineIconButton.accentGradient(
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
