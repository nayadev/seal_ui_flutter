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
  group('NebulaTextButton.primary', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaTextButton.primary(label: 'Learn more', onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Learn more'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaTextButton.primary(
            label: 'Tap Me',
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Tap Me'));
      expect(tapped, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          const NebulaTextButton.primary(label: 'Disabled', onPressed: null),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Disabled'));
      expect(tapped, isFalse);
    });

    testWidgets('shows loading indicator when isLoading is true', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          const NebulaTextButton.primary(
            label: 'Loading',
            isLoading: true,
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(NebulaBouncingDots), findsOneWidget);
      expect(find.text('Loading'), findsNothing);
    });

    testWidgets('renders icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaTextButton.primary(
            label: 'Skip',
            icon: Icons.arrow_forward,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
      expect(find.text('Skip'), findsOneWidget);
    });

    testWidgets('uses TextButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaTextButton.primary(label: 'Test', onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(TextButton), findsOneWidget);
    });
  });

  group('NebulaTextButton.accent', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaTextButton.accent(label: 'Details', onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Details'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaTextButton.accent(label: 'Go', onPressed: () => tapped = true),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Go'));
      expect(tapped, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(const NebulaTextButton.accent(label: 'Off', onPressed: null)),
      );
      await tester.pump();

      await tester.tap(find.text('Off'));
      expect(tapped, isFalse);
    });

    testWidgets('uses TextButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaTextButton.accent(label: 'A', onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(TextButton), findsOneWidget);
    });
  });

  group('NebulaTextButton.accentSecondary', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaTextButton.accentSecondary(label: 'Info', onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.text('Info'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaTextButton.accentSecondary(
            label: 'Go',
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Go'));
      expect(tapped, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          const NebulaTextButton.accentSecondary(label: 'Off', onPressed: null),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Off'));
      expect(tapped, isFalse);
    });

    testWidgets('uses TextButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaTextButton.accentSecondary(label: 'A', onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(TextButton), findsOneWidget);
    });
  });

  group('NebulaTextButton.gradient', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaTextButton.gradient(label: 'Discover', onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Discover'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaTextButton.gradient(
            label: 'Go',
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Go'));
      expect(tapped, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(const NebulaTextButton.gradient(label: 'Off', onPressed: null)),
      );
      await tester.pump();

      await tester.tap(find.text('Off'));
      expect(tapped, isFalse);
    });

    testWidgets('wraps with ShaderMask', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaTextButton.gradient(label: 'G', onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(ShaderMask), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('renders icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaTextButton.gradient(
            label: 'Nav',
            icon: Icons.explore,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.explore), findsOneWidget);
      expect(find.text('Nav'), findsOneWidget);
    });

    testWidgets('shows loading indicator when isLoading is true', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          const NebulaTextButton.gradient(
            label: 'Wait',
            isLoading: true,
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(NebulaBouncingDots), findsOneWidget);
      expect(find.text('Wait'), findsNothing);
    });
  });

  group('NebulaTextButton.accentGradient', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaTextButton.accentGradient(label: 'More', onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('More'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaTextButton.accentGradient(
            label: 'Go',
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Go'));
      expect(tapped, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          const NebulaTextButton.accentGradient(label: 'Off', onPressed: null),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Off'));
      expect(tapped, isFalse);
    });

    testWidgets('wraps with ShaderMask', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaTextButton.accentGradient(label: 'AG', onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(ShaderMask), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('renders icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaTextButton.accentGradient(
            label: 'Nav',
            icon: Icons.star,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.text('Nav'), findsOneWidget);
    });

    testWidgets('shows loading indicator when isLoading is true', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          const NebulaTextButton.accentGradient(
            label: 'Wait',
            isLoading: true,
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(NebulaBouncingDots), findsOneWidget);
      expect(find.text('Wait'), findsNothing);
    });
  });
}
