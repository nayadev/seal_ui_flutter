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
  group('NebulaFilledButton.primary', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaFilledButton.primary(label: 'Submit', onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Submit'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaFilledButton.primary(
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
          const NebulaFilledButton.primary(label: 'Disabled', onPressed: null),
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
          const NebulaFilledButton.primary(
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
          NebulaFilledButton.primary(
            label: 'Settings',
            icon: Icons.settings,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.settings), findsOneWidget);
      expect(find.text('Settings'), findsOneWidget);
    });

    testWidgets('uses FilledButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaFilledButton.primary(label: 'Test', onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(FilledButton), findsOneWidget);
    });
  });

  group('NebulaFilledButton.accent', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaFilledButton.accent(label: 'Continue', onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Continue'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaFilledButton.accent(
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
        _wrap(const NebulaFilledButton.accent(label: 'Off', onPressed: null)),
      );
      await tester.pump();

      await tester.tap(find.text('Off'));
      expect(tapped, isFalse);
    });

    testWidgets('uses FilledButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaFilledButton.accent(label: 'A', onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(FilledButton), findsOneWidget);
    });
  });

  group('NebulaFilledButton.gradient', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaFilledButton.gradient(label: 'Launch', onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Launch'), findsOneWidget);
    });

    testWidgets('renders with InkWell', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaFilledButton.gradient(label: 'Gradient', onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(InkWell), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaFilledButton.gradient(
            label: 'Go',
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Go'));
      expect(tapped, isTrue);
    });

    testWidgets('is disabled when isLoading', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaFilledButton.gradient(
            label: 'Wait',
            isLoading: true,
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(InkWell));
      expect(tapped, isFalse);
      expect(find.byType(NebulaBouncingDots), findsOneWidget);
    });

    testWidgets('renders icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaFilledButton.gradient(
            label: 'Explore',
            icon: Icons.rocket_launch,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.rocket_launch), findsOneWidget);
      expect(find.text('Explore'), findsOneWidget);
    });
  });

  group('NebulaFilledButton.accentSecondary', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaFilledButton.accentSecondary(
            label: 'Confirm',
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Confirm'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaFilledButton.accentSecondary(
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
          const NebulaFilledButton.accentSecondary(
            label: 'Off',
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Off'));
      expect(tapped, isFalse);
    });

    testWidgets('uses FilledButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaFilledButton.accentSecondary(label: 'A', onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(FilledButton), findsOneWidget);
    });
  });

  group('NebulaFilledButton.accentGradient', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaFilledButton.accentGradient(label: 'Boost', onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.text('Boost'), findsOneWidget);
    });

    testWidgets('renders with InkWell', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaFilledButton.accentGradient(
            label: 'Accent Grad',
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(InkWell), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaFilledButton.accentGradient(
            label: 'Go',
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Go'));
      expect(tapped, isTrue);
    });

    testWidgets('is disabled when isLoading', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaFilledButton.accentGradient(
            label: 'Wait',
            isLoading: true,
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(InkWell));
      expect(tapped, isFalse);
      expect(find.byType(NebulaBouncingDots), findsOneWidget);
    });

    testWidgets('renders icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaFilledButton.accentGradient(
            label: 'Spark',
            icon: Icons.auto_awesome,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.auto_awesome), findsOneWidget);
      expect(find.text('Spark'), findsOneWidget);
    });
  });
}
