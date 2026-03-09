import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nebula_ui/nebula_ui.dart';

Widget _wrap(Widget child) {
  return NebulaTheme(
    tokens: NebulaThemeFactory.darkTokens(),
    child: MaterialApp(
      theme: NebulaThemeFactory.dark(),
      home: Scaffold(body: Center(child: child)),
    ),
  );
}

void main() {
  group('NebulaIconButton.primary', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaIconButton.primary(icon: Icons.close, onPressed: () {})),
      );
      await tester.pump();

      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaIconButton.primary(
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
          const NebulaIconButton.primary(icon: Icons.close, onPressed: null),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(IconButton));
      expect(tapped, isFalse);
    });

    testWidgets('uses IconButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaIconButton.primary(icon: Icons.close, onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('shows tooltip when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaIconButton.primary(
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

  group('NebulaIconButton.accent', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaIconButton.accent(icon: Icons.more_vert, onPressed: () {})),
      );
      await tester.pump();

      expect(find.byIcon(Icons.more_vert), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaIconButton.accent(
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
        _wrap(NebulaIconButton.accent(icon: Icons.more_vert, onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(IconButton), findsOneWidget);
    });
  });

  group('NebulaIconButton.accentSecondary', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaIconButton.accentSecondary(
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
          NebulaIconButton.accentSecondary(
            icon: Icons.info_outline,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(IconButton), findsOneWidget);
    });
  });

  group('NebulaIconButton.gradient', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaIconButton.gradient(icon: Icons.tune_rounded, onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.tune_rounded), findsOneWidget);
    });

    testWidgets('uses ShaderMask for gradient effect', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaIconButton.gradient(icon: Icons.tune_rounded, onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.byType(ShaderMask), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaIconButton.gradient(
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
          const NebulaIconButton.gradient(
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
          NebulaIconButton.gradient(
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

  group('NebulaIconButton.accentGradient', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaIconButton.accentGradient(
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
          NebulaIconButton.accentGradient(
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
          NebulaIconButton.accentGradient(
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
