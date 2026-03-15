import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:seal_ui/seal_ui.dart';

/// Helper that wraps a widget with the required SealTheme + MaterialApp.
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
  group('SealOutlineButton.primary', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(SealOutlineButton.primary(label: 'Cancel', onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealOutlineButton.primary(
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
          const SealOutlineButton.primary(label: 'Disabled', onPressed: null),
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
          const SealOutlineButton.primary(
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
          SealOutlineButton.primary(
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

    testWidgets('uses OutlinedButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(SealOutlineButton.primary(label: 'Test', onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(OutlinedButton), findsOneWidget);
    });
  });

  group('SealOutlineButton.accent', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(SealOutlineButton.accent(label: 'Details', onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Details'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealOutlineButton.accent(
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
        _wrap(const SealOutlineButton.accent(label: 'Off', onPressed: null)),
      );
      await tester.pump();

      await tester.tap(find.text('Off'));
      expect(tapped, isFalse);
    });

    testWidgets('uses OutlinedButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(SealOutlineButton.accent(label: 'A', onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(OutlinedButton), findsOneWidget);
    });
  });

  group('SealOutlineButton.accentSecondary', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineButton.accentSecondary(label: 'Info', onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.text('Info'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealOutlineButton.accentSecondary(
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
          const SealOutlineButton.accentSecondary(
            label: 'Off',
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Off'));
      expect(tapped, isFalse);
    });

    testWidgets('uses OutlinedButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineButton.accentSecondary(label: 'A', onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.byType(OutlinedButton), findsOneWidget);
    });
  });

  group('SealOutlineButton.gradient', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(SealOutlineButton.gradient(label: 'Explore', onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Explore'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealOutlineButton.gradient(
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
          const SealOutlineButton.gradient(label: 'Off', onPressed: null),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Off'));
      expect(tapped, isFalse);
    });

    testWidgets('wraps with ShaderMask', (tester) async {
      await tester.pumpWidget(
        _wrap(SealOutlineButton.gradient(label: 'G', onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(ShaderMask), findsOneWidget);
      expect(find.byType(OutlinedButton), findsOneWidget);
    });

    testWidgets('renders icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineButton.gradient(
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
          const SealOutlineButton.gradient(
            label: 'Wait',
            isLoading: true,
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealBouncingDots), findsOneWidget);
      expect(find.text('Wait'), findsOneWidget);
    });
  });

  group('SealOutlineButton.accentGradient', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineButton.accentGradient(label: 'More', onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.text('More'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          SealOutlineButton.accentGradient(
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
          const SealOutlineButton.accentGradient(
            label: 'Off',
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Off'));
      expect(tapped, isFalse);
    });

    testWidgets('wraps with ShaderMask', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineButton.accentGradient(label: 'AG', onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.byType(ShaderMask), findsOneWidget);
      expect(find.byType(OutlinedButton), findsOneWidget);
    });

    testWidgets('renders icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealOutlineButton.accentGradient(
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
          const SealOutlineButton.accentGradient(
            label: 'Wait',
            isLoading: true,
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealBouncingDots), findsOneWidget);
      expect(find.text('Wait'), findsOneWidget);
    });
  });
}
