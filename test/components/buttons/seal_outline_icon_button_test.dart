import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seal_ui/seal_ui.dart';

Widget _wrap(Widget child) {
  return SealTheme(
    tokens: SealThemeFactory.darkTokens(),
    child: MaterialApp(
      theme: SealThemeFactory.dark(),
      home: Scaffold(body: Center(child: child)),
    ),
  );
}

void main() {
  group('SealOutlineIconButton.primary', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.primary(icon: Icons.share, onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.share), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.primary(
            icon: Icons.share,
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(IconButton));
      expect(tapped, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          const SealOutlineIconButton.primary(
            icon: Icons.share,
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(IconButton));
      expect(tapped, isFalse);
    });

    testWidgets('uses IconButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.primary(icon: Icons.share, onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('shows tooltip when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.primary(
            icon: Icons.share,
            onPressed: () {},
            tooltip: 'Share',
          ),
        ),
      );
      await tester.pump();

      expect(find.byTooltip('Share'), findsOneWidget);
    });
  });

  group('SealOutlineIconButton.accent', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.accent(
            icon: Icons.bookmark_outline,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.bookmark_outline), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.accent(
            icon: Icons.bookmark_outline,
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(IconButton));
      expect(tapped, isTrue);
    });

    testWidgets('uses IconButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.accent(
            icon: Icons.bookmark_outline,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(IconButton), findsOneWidget);
    });
  });

  group('SealOutlineIconButton.accentSecondary', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.accentSecondary(
            icon: Icons.tune_rounded,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.tune_rounded), findsOneWidget);
    });

    testWidgets('uses IconButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.accentSecondary(
            icon: Icons.tune_rounded,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(IconButton), findsOneWidget);
    });
  });

  group('SealOutlineIconButton.gradient', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.gradient(
            icon: Icons.auto_awesome_rounded,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.auto_awesome_rounded), findsOneWidget);
    });

    testWidgets('uses ShaderMask for gradient effect', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.gradient(
            icon: Icons.auto_awesome_rounded,
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
            icon: Icons.auto_awesome_rounded,
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(IconButton));
      expect(tapped, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          const SealOutlineIconButton.gradient(
            icon: Icons.auto_awesome_rounded,
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(IconButton));
      expect(tapped, isFalse);
    });
  });

  group('SealOutlineIconButton.accentGradient', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.accentGradient(
            icon: Icons.flash_on_rounded,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.flash_on_rounded), findsOneWidget);
    });

    testWidgets('uses ShaderMask for gradient effect', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineIconButton.accentGradient(
            icon: Icons.flash_on_rounded,
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
            icon: Icons.flash_on_rounded,
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(IconButton));
      expect(tapped, isTrue);
    });
  });
}
