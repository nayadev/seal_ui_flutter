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
  group('NebulaFilledIconButton.primary', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaFilledIconButton.primary(icon: Icons.add, onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaFilledIconButton.primary(
            icon: Icons.add,
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(IconButton));
      expect(tapped, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          const NebulaFilledIconButton.primary(
            icon: Icons.add,
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(IconButton));
      expect(tapped, isFalse);
    });

    testWidgets('uses IconButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaFilledIconButton.primary(icon: Icons.add, onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('shows tooltip when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaFilledIconButton.primary(
            icon: Icons.add,
            onPressed: () {},
            tooltip: 'Add item',
          ),
        ),
      );
      await tester.pump();

      expect(find.byTooltip('Add item'), findsOneWidget);
    });
  });

  group('NebulaFilledIconButton.accent', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaFilledIconButton.accent(icon: Icons.star, onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          NebulaFilledIconButton.accent(
            icon: Icons.star,
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(IconButton));
      expect(tapped, isTrue);
    });

    testWidgets('uses IconButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaFilledIconButton.accent(icon: Icons.star, onPressed: () {}),
        ),
      );
      await tester.pump();

      expect(find.byType(IconButton), findsOneWidget);
    });
  });

  group('NebulaFilledIconButton.accentSecondary', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaFilledIconButton.accentSecondary(
            icon: Icons.edit,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.edit), findsOneWidget);
    });

    testWidgets('uses IconButton internally', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaFilledIconButton.accentSecondary(
            icon: Icons.edit,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(IconButton), findsOneWidget);
    });
  });

  group('NebulaFilledIconButton.gradient', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaFilledIconButton.gradient(
            icon: Icons.rocket_launch_rounded,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.rocket_launch_rounded), findsOneWidget);
    });

    testWidgets('uses InkWell for interaction', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaFilledIconButton.gradient(
            icon: Icons.rocket_launch_rounded,
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
          NebulaFilledIconButton.gradient(
            icon: Icons.rocket_launch_rounded,
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(InkWell));
      expect(tapped, isTrue);
    });

    testWidgets('does not call onPressed when disabled', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          const NebulaFilledIconButton.gradient(
            icon: Icons.rocket_launch_rounded,
            onPressed: null,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(InkWell));
      expect(tapped, isFalse);
    });

    testWidgets('shows tooltip when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaFilledIconButton.gradient(
            icon: Icons.rocket_launch_rounded,
            onPressed: () {},
            tooltip: 'Launch',
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(Tooltip), findsOneWidget);
    });
  });

  group('NebulaFilledIconButton.accentGradient', () {
    testWidgets('renders the icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaFilledIconButton.accentGradient(
            icon: Icons.bolt_rounded,
            onPressed: () {},
          ),
        ),
      );
      await tester.pump();

      expect(find.byIcon(Icons.bolt_rounded), findsOneWidget);
    });

    testWidgets('uses InkWell for interaction', (tester) async {
      await tester.pumpWidget(
        _wrap(
          NebulaFilledIconButton.accentGradient(
            icon: Icons.bolt_rounded,
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
          NebulaFilledIconButton.accentGradient(
            icon: Icons.bolt_rounded,
            onPressed: () => tapped = true,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.byType(InkWell));
      expect(tapped, isTrue);
    });
  });
}
