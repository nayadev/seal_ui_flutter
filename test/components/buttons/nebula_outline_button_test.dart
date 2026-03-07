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
  group('NebulaOutlineButton', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaOutlineButton(label: 'Cancel', onPressed: () {})),
      );
      await tester.pump();

      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaOutlineButton(label: 'Tap Me', onPressed: () => tapped = true),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Tap Me'));
      expect(tapped, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(NebulaOutlineButton(label: 'Disabled', onPressed: null)),
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
          const NebulaOutlineButton(
            label: 'Loading',
            isLoading: true,
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Loading'), findsNothing);
    });

    testWidgets('renders icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaOutlineButton(
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
        _wrap(NebulaOutlineButton(label: 'Test', onPressed: () {})),
      );
      await tester.pump();

      expect(find.byType(OutlinedButton), findsOneWidget);
    });
  });
}
