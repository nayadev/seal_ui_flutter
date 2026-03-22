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

final _tabs = [
  SealTab<String>(
    value: 'account',
    label: const Text('Account'),
    content: const Text('Account panel'),
  ),
  SealTab<String>(
    value: 'security',
    label: const Text('Security'),
    content: const Text('Security panel'),
  ),
  SealTab<String>(
    value: 'billing',
    label: const Text('Billing'),
    content: const Text('Billing panel'),
  ),
];

void main() {
  group('SealTabs', () {
    testWidgets('renders all tab labels', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealTabs<String>(
            value: 'account',
            tabs: _tabs,
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Account'), findsOneWidget);
      expect(find.text('Security'), findsOneWidget);
      expect(find.text('Billing'), findsOneWidget);
    });

    testWidgets('renders selected tab content', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealTabs<String>(
            value: 'account',
            tabs: _tabs,
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Account panel'), findsOneWidget);
    });

    testWidgets('calls onChanged when a tab is tapped', (tester) async {
      String? received;
      await tester.pumpWidget(
        _wrap(
          SealTabs<String>(
            value: 'account',
            onChanged: (v) => received = v,
            tabs: _tabs,
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Security'));
      await tester.pump();

      expect(received, 'security');
    });

    testWidgets('renders with controller', (tester) async {
      final controller = ShadTabsController<String>(value: 'billing');
      await tester.pumpWidget(
        _wrap(
          SealTabs<String>.controlled(
            controller: controller,
            tabs: _tabs,
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Billing panel'), findsOneWidget);
      controller.dispose();
    });

    testWidgets('does not render content of unselected tabs', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealTabs<String>(
            value: 'account',
            tabs: _tabs,
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Security panel'), findsNothing);
      expect(find.text('Billing panel'), findsNothing);
    });
  });
}
