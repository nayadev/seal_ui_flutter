import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nebula_ui/nebula_ui.dart';

/// Helper that wraps a widget with the required NebulaTheme + MaterialApp.
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
  group('NebulaOutlineButton.primary', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaOutlineButton.primary(label: 'Cancel', onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaOutlineButton.primary(
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
          const NebulaOutlineButton.primary(label: 'Disabled', onPressed: null),
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
          const NebulaOutlineButton.primary(
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
          NebulaOutlineButton.primary(
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
        _wrap(NebulaOutlineButton.primary(label: 'Test', onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(OutlinedButton), findsOneWidget);
    });
  });

  group('NebulaOutlineButton.accent', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaOutlineButton.accent(label: 'Details', onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Details'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaOutlineButton.accent(
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
        _wrap(const NebulaOutlineButton.accent(label: 'Off', onPressed: null)),
      );
      await tester.pump();

      await tester.tap(find.text('Off'));
      expect(tapped, isFalse);
    });

    testWidgets('uses OutlinedButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaOutlineButton.accent(label: 'A', onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(OutlinedButton), findsOneWidget);
    });
  });

  group('NebulaOutlineButton.accentSecondary', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaOutlineButton.accentSecondary(label: 'Info', onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.text('Info'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaOutlineButton.accentSecondary(
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
          const NebulaOutlineButton.accentSecondary(
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
          NebulaOutlineButton.accentSecondary(label: 'A', onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.byType(OutlinedButton), findsOneWidget);
    });
  });

  group('NebulaOutlineButton.gradient', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaOutlineButton.gradient(label: 'Explore', onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Explore'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaOutlineButton.gradient(
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
          const NebulaOutlineButton.gradient(label: 'Off', onPressed: null),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Off'));
      expect(tapped, isFalse);
    });

    testWidgets('wraps with ShaderMask', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaOutlineButton.gradient(label: 'G', onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(ShaderMask), findsOneWidget);
      expect(find.byType(OutlinedButton), findsOneWidget);
    });

    testWidgets('renders icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaOutlineButton.gradient(
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
          const NebulaOutlineButton.gradient(
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

  group('NebulaOutlineButton.accentGradient', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaOutlineButton.accentGradient(label: 'More', onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.text('More'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaOutlineButton.accentGradient(
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
          const NebulaOutlineButton.accentGradient(
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
          NebulaOutlineButton.accentGradient(label: 'AG', onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.byType(ShaderMask), findsOneWidget);
      expect(find.byType(OutlinedButton), findsOneWidget);
    });

    testWidgets('renders icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaOutlineButton.accentGradient(
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
          const NebulaOutlineButton.accentGradient(
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
