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
  group('SealFilledButton.primary', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(SealFilledButton.primary(label: 'Submit', onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Submit'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealFilledButton.primary(
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
          const SealFilledButton.primary(label: 'Disabled', onPressed: null),
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
          const SealFilledButton.primary(
            label: 'Loading',
            isLoading: true,
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealBouncingDots), findsOneWidget);
      expect(find.text('Loading'), findsOneWidget);
    });

    testWidgets('renders icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledButton.primary(
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
        _wrap(SealFilledButton.primary(label: 'Test', onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(FilledButton), findsOneWidget);
    });
  });

  group('SealFilledButton.accent', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(SealFilledButton.accent(label: 'Continue', onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Continue'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealFilledButton.accent(
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
        _wrap(const SealFilledButton.accent(label: 'Off', onPressed: null)),
      );
      await tester.pump();

      await tester.tap(find.text('Off'));
      expect(tapped, isFalse);
    });

    testWidgets('uses FilledButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(SealFilledButton.accent(label: 'A', onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(FilledButton), findsOneWidget);
    });
  });

  group('SealFilledButton.gradient', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(SealFilledButton.gradient(label: 'Launch', onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Launch'), findsOneWidget);
    });

    testWidgets('renders with InkWell', (tester) async {
      await tester.pumpWidget(
        _wrap(SealFilledButton.gradient(label: 'Gradient', onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(InkWell), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealFilledButton.gradient(
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
          SealFilledButton.gradient(
            label: 'Wait',
            isLoading: true,
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(InkWell));
      expect(tapped, isFalse);
      expect(find.byType(SealBouncingDots), findsOneWidget);
    });

    testWidgets('renders icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledButton.gradient(
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

  group('SealFilledButton.accentSecondary', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledButton.accentSecondary(
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
          SealFilledButton.accentSecondary(
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
          const SealFilledButton.accentSecondary(
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
        _wrap(SealFilledButton.accentSecondary(label: 'A', onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(FilledButton), findsOneWidget);
    });
  });

  group('SealFilledButton.accentGradient', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledButton.accentGradient(label: 'Boost', onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.text('Boost'), findsOneWidget);
    });

    testWidgets('renders with InkWell', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledButton.accentGradient(
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
          SealFilledButton.accentGradient(
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
          SealFilledButton.accentGradient(
            label: 'Wait',
            isLoading: true,
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(InkWell));
      expect(tapped, isFalse);
      expect(find.byType(SealBouncingDots), findsOneWidget);
    });

    testWidgets('renders icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealFilledButton.accentGradient(
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
