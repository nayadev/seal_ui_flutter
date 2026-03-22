import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Widget _wrap(Widget child) {
  return ShadApp(
    home: SealThemeScope(
      tokens: SealThemeFactory.darkTokens(),
      child: Center(child: child),
    ),
  );
}

final _items = [
  const SealAccordionItem<String>(
    value: 'q1',
    title: Text('What is Seal UI?'),
    child: Text('A token-driven Flutter design system.'),
  ),
  const SealAccordionItem<String>(
    value: 'q2',
    title: Text('How do I install it?'),
    child: Text('Add seal_ui to your pubspec.yaml.'),
  ),
  const SealAccordionItem<String>(
    value: 'q3',
    title: Text('Does it support dark mode?'),
    child: Text('Yes — dark mode is the primary experience.'),
  ),
];

void main() {
  group('SealAccordion', () {
    testWidgets('renders all item titles', (tester) async {
      await tester.pumpWidget(
        _wrap(SealAccordion<String>(items: _items)),
      );
      await tester.pump();

      expect(find.text('What is Seal UI?'), findsOneWidget);
      expect(find.text('How do I install it?'), findsOneWidget);
      expect(find.text('Does it support dark mode?'), findsOneWidget);
    });

    testWidgets('content is hidden before expanding', (tester) async {
      await tester.pumpWidget(
        _wrap(SealAccordion<String>(items: _items)),
      );
      await tester.pump();

      expect(find.text('A token-driven Flutter design system.'), findsNothing);
    });

    testWidgets('expands item when tapped', (tester) async {
      await tester.pumpWidget(
        _wrap(SealAccordion<String>(items: _items)),
      );
      await tester.pump();

      await tester.tap(find.text('What is Seal UI?'));
      await tester.pumpAndSettle();

      expect(
        find.text('A token-driven Flutter design system.'),
        findsOneWidget,
      );
    });

    testWidgets('renders with initial value expanded', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealAccordion<String>(items: _items, initialValue: 'q2'),
        ),
      );
      await tester.pump();

      expect(find.text('Add seal_ui to your pubspec.yaml.'), findsOneWidget);
    });

    testWidgets('multiple mode renders all titles', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealAccordion<String>.multiple(
            items: _items,
            initialValues: ['q1', 'q3'],
          ),
        ),
      );
      await tester.pump();

      expect(find.text('What is Seal UI?'), findsOneWidget);
      expect(find.text('Does it support dark mode?'), findsOneWidget);
    });
  });
}
