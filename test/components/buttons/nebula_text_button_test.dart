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
  group('NebulaTextButton', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaTextButton(label: 'Learn more', onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Learn more'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaTextButton(label: 'Tap Me', onPressed: () => tapped = true),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Tap Me'));
      expect(tapped, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(const NebulaTextButton(label: 'Disabled', onPressed: null)),
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
          const NebulaTextButton(
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
          NebulaTextButton(
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
        _wrap(NebulaTextButton(label: 'Test', onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(TextButton), findsOneWidget);
    });
  });
}
