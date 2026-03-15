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
  group('SealIconButton.primary', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(SealIconButton.primary(icon: Icons.close, onPressed: () {})),
      );
      await tester.pump();

      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealIconButton.primary(
            icon: Icons.close,
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
          const SealIconButton.primary(icon: Icons.close, onPressed: null),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(IconButton));
      expect(tapped, isFalse);
    });

    testWidgets('uses IconButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(SealIconButton.primary(icon: Icons.close, onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('shows tooltip when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealIconButton.primary(
            icon: Icons.close,
            onPressed: () {},
            tooltip: 'Close',
          ),
        ),
      );
      await tester.pump();

      expect(find.byTooltip('Close'), findsOneWidget);
    });
  });

  group('SealIconButton.accent', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(SealIconButton.accent(icon: Icons.more_vert, onPressed: () {})),
      );
      await tester.pump();

      expect(find.byIcon(Icons.more_vert), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealIconButton.accent(
            icon: Icons.more_vert,
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
        _wrap(SealIconButton.accent(icon: Icons.more_vert, onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(IconButton), findsOneWidget);
    });
  });

  group('SealIconButton.accentSecondary', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealIconButton.accentSecondary(
            icon: Icons.info_outline,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.info_outline), findsOneWidget);
    });

    testWidgets('uses IconButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealIconButton.accentSecondary(
            icon: Icons.info_outline,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(IconButton), findsOneWidget);
    });
  });

  group('SealIconButton.gradient', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealIconButton.gradient(icon: Icons.tune_rounded, onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.tune_rounded), findsOneWidget);
    });

    testWidgets('uses ShaderMask for gradient effect', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealIconButton.gradient(icon: Icons.tune_rounded, onPressed: () {}),
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
            icon: Icons.tune_rounded,
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
          const SealIconButton.gradient(
            icon: Icons.tune_rounded,
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(IconButton));
      expect(tapped, isFalse);
    });

    testWidgets('shows tooltip when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealIconButton.gradient(
            icon: Icons.tune_rounded,
            onPressed: () {},
            tooltip: 'Filter',
          ),
        ),
      );
      await tester.pump();

      expect(find.byTooltip('Filter'), findsOneWidget);
    });
  });

  group('SealIconButton.accentGradient', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealIconButton.accentGradient(
            icon: Icons.search_rounded,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.search_rounded), findsOneWidget);
    });

    testWidgets('uses ShaderMask for gradient effect', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealIconButton.accentGradient(
            icon: Icons.search_rounded,
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
            icon: Icons.search_rounded,
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
