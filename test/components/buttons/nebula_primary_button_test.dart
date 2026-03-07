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
  group('NebulaPrimaryButton', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaPrimaryButton(label: 'Submit', onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Submit'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaPrimaryButton(label: 'Tap Me', onPressed: () => tapped = true),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Tap Me'));
      expect(tapped, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(const NebulaPrimaryButton(label: 'Disabled', onPressed: null)),
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
          const NebulaPrimaryButton(
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
          NebulaPrimaryButton(
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

    testWidgets('uses FilledButton internally when not gradient', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(NebulaPrimaryButton(label: 'Test', onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(FilledButton), findsOneWidget);
    });

    testWidgets('renders gradient variant with InkWell', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaPrimaryButton(
            label: 'Gradient',
            useGradient: true,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(InkWell), findsOneWidget);
      expect(find.text('Gradient'), findsOneWidget);
    });

    testWidgets('gradient variant calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaPrimaryButton(
            label: 'Go',
            useGradient: true,
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Go'));
      expect(tapped, isTrue);
    });

    testWidgets('gradient variant is disabled when isLoading', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaPrimaryButton(
            label: 'Wait',
            useGradient: true,
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
  });
}
