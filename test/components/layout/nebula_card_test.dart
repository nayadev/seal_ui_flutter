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
  group('NebulaCard', () {
    testWidgets('renders header widget', (tester) async {
      await tester.pumpWidget(_wrap(const NebulaCard(header: Text('Header'))));
      await tester.pump();

      expect(find.text('Header'), findsOneWidget);
    });

    testWidgets('renders body widget', (tester) async {
      await tester.pumpWidget(
        _wrap(const NebulaCard(body: Text('Body content'))),
      );
      await tester.pump();

      expect(find.text('Body content'), findsOneWidget);
    });

    testWidgets('renders footer widget', (tester) async {
      await tester.pumpWidget(_wrap(const NebulaCard(footer: Text('Footer'))));
      await tester.pump();

      expect(find.text('Footer'), findsOneWidget);
    });

    testWidgets('renders all sections together', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const NebulaCard(
            header: Text('Header'),
            body: Text('Body'),
            footer: Text('Footer'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Header'), findsOneWidget);
      expect(find.text('Body'), findsOneWidget);
      expect(find.text('Footer'), findsOneWidget);
    });

    testWidgets('shows dividers between sections', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const NebulaCard(
            header: Text('Header'),
            body: Text('Body'),
            footer: Text('Footer'),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(Divider), findsNWidgets(2));
    });

    testWidgets('shows no divider with single section', (tester) async {
      await tester.pumpWidget(_wrap(const NebulaCard(body: Text('Only body'))));
      await tester.pump();

      expect(find.byType(Divider), findsNothing);
    });

    testWidgets('renders border when showBorder is true', (tester) async {
      await tester.pumpWidget(_wrap(const NebulaCard(body: Text('Bordered'))));
      await tester.pump();

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(NebulaCard),
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
        _wrap(const NebulaCard(showBorder: false, body: Text('No border'))),
      );
      await tester.pump();

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(NebulaCard),
          matching: find.byType(Container),
        ),
      );
      final decoration = container.decoration as BoxDecoration?;
      expect(decoration?.border, isNull);
    });

    testWidgets('applies gradient when provided', (tester) async {
      const gradient = LinearGradient(colors: [Colors.purple, Colors.blue]);
      await tester.pumpWidget(
        _wrap(const NebulaCard(gradient: gradient, body: Text('Gradient'))),
      );
      await tester.pump();

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(NebulaCard),
          matching: find.byType(Container),
        ),
      );
      final decoration = container.decoration as BoxDecoration?;
      expect(decoration?.gradient, gradient);
      expect(decoration?.color, isNull);
    });

    testWidgets('applies custom width', (tester) async {
      await tester.pumpWidget(
        _wrap(const NebulaCard(width: 300, body: Text('Sized'))),
      );
      await tester.pump();

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(NebulaCard),
          matching: find.byType(Container),
        ),
      );
      expect(container.constraints?.maxWidth, 300);
    });

    testWidgets('has shadow when elevation is positive', (tester) async {
      await tester.pumpWidget(_wrap(const NebulaCard(body: Text('Elevated'))));
      await tester.pump();

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(NebulaCard),
          matching: find.byType(Container),
        ),
      );
      final decoration = container.decoration as BoxDecoration?;
      expect(decoration?.boxShadow, isNotNull);
      expect(decoration!.boxShadow!, isNotEmpty);
    });

    testWidgets('has no shadow when elevation is zero', (tester) async {
      await tester.pumpWidget(
        _wrap(const NebulaCard(elevation: 0, body: Text('Flat'))),
      );
      await tester.pump();

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(NebulaCard),
          matching: find.byType(Container),
        ),
      );
      final decoration = container.decoration as BoxDecoration?;
      expect(decoration?.boxShadow, isNull);
    });

    testWidgets('calls onTap when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaCard(body: const Text('Tappable'), onTap: () => tapped = true),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Tappable'));
      expect(tapped, isTrue);
    });

    testWidgets('renders InkWell when onTap is provided', (tester) async {
      await tester.pumpWidget(
        _wrap(NebulaCard(body: const Text('Ink'), onTap: () {})),
      );
      await tester.pump();

      expect(
        find.descendant(
          of: find.byType(NebulaCard),
          matching: find.byType(InkWell),
        ),
        findsOneWidget,
      );
    });

    testWidgets('does not render InkWell when onTap is null', (tester) async {
      await tester.pumpWidget(_wrap(const NebulaCard(body: Text('No ink'))));
      await tester.pump();

      expect(
        find.descendant(
          of: find.byType(NebulaCard),
          matching: find.byType(InkWell),
        ),
        findsNothing,
      );
    });
  });
}
