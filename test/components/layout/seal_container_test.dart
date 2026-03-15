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
  group('SealContainer', () {
    testWidgets('renders child widget', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealContainer(child: Text('Hello'))),
      );
      await tester.pump();

      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets('uses Container internally', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealContainer(child: Text('Test'))),
      );
      await tester.pump();

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('renders border when showBorder is true (default)', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(const SealContainer(child: Text('Bordered'))),
      );
      await tester.pump();

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(SealContainer),
          matching: find.byType(Container),
        ),
      );
      final decoration = container.decoration as BoxDecoration?;
      expect(decoration?.border, isNotNull);
    });

    testWidgets('does not render border when showBorder is false', (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          const SealContainer(showBorder: false, child: Text('No border')),
        ),
      );
      await tester.pump();

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(SealContainer),
          matching: find.byType(Container),
        ),
      );
      final decoration = container.decoration as BoxDecoration?;
      expect(decoration?.border, isNull);
    });

    testWidgets('applies custom width and height', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SealContainer(width: 200, height: 100, child: Text('Sized')),
        ),
      );
      await tester.pump();

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(SealContainer),
          matching: find.byType(Container),
        ),
      );
      expect(container.constraints?.maxWidth, 200);
      expect(container.constraints?.maxHeight, 100);
    });

    testWidgets('applies gradient when provided', (tester) async {
      const gradient = LinearGradient(colors: [Colors.purple, Colors.blue]);

      await tester.pumpWidget(
        _wrap(
          const SealContainer(gradient: gradient, child: Text('Gradient')),
        ),
      );
      await tester.pump();

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(SealContainer),
          matching: find.byType(Container),
        ),
      );
      final decoration = container.decoration as BoxDecoration?;
      expect(decoration?.gradient, gradient);
      // When gradient is set, solid color should be null
      expect(decoration?.color, isNull);
    });

    testWidgets('applies custom color when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealContainer(color: Colors.red, child: Text('Colored'))),
      );
      await tester.pump();

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(SealContainer),
          matching: find.byType(Container),
        ),
      );
      final decoration = container.decoration as BoxDecoration?;
      expect(decoration?.color, Colors.red);
    });

    testWidgets('applies custom padding', (tester) async {
      const customPadding = EdgeInsets.all(32);
      await tester.pumpWidget(
        _wrap(
          const SealContainer(padding: customPadding, child: Text('Padded')),
        ),
      );
      await tester.pump();

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(SealContainer),
          matching: find.byType(Container),
        ),
      );
      expect(container.padding, customPadding);
    });

    testWidgets('applies custom margin', (tester) async {
      const customMargin = EdgeInsets.symmetric(horizontal: 16);
      await tester.pumpWidget(
        _wrap(
          const SealContainer(margin: customMargin, child: Text('Margined')),
        ),
      );
      await tester.pump();

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(SealContainer),
          matching: find.byType(Container),
        ),
      );
      expect(container.margin, customMargin);
    });
  });
}
