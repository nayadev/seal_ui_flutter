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

void main() {
  group('SealBadge', () {
    testWidgets('renders primary badge', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealBadge.primary(child: Text('New'))),
      );
      await tester.pump();

      expect(find.text('New'), findsOneWidget);
    });

    testWidgets('renders accent badge', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealBadge.accent(child: Text('Beta'))),
      );
      await tester.pump();

      expect(find.text('Beta'), findsOneWidget);
    });

    testWidgets('renders secondary badge', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealBadge.secondary(child: Text('Draft'))),
      );
      await tester.pump();

      expect(find.text('Draft'), findsOneWidget);
    });

    testWidgets('renders outline badge', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealBadge.outline(child: Text('v1.0'))),
      );
      await tester.pump();

      expect(find.text('v1.0'), findsOneWidget);
    });

    testWidgets('renders success badge', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealBadge.success(child: Text('Active'))),
      );
      await tester.pump();

      expect(find.text('Active'), findsOneWidget);
    });

    testWidgets('renders warning badge', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealBadge.warning(child: Text('Pending'))),
      );
      await tester.pump();

      expect(find.text('Pending'), findsOneWidget);
    });

    testWidgets('renders error badge', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealBadge.error(child: Text('Expired'))),
      );
      await tester.pump();

      expect(find.text('Expired'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      bool called = false;
      await tester.pumpWidget(
        _wrap(
          SealBadge.primary(
            onPressed: () => called = true,
            child: const Text('Click'),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Click'));
      await tester.pump();

      expect(called, isTrue);
    });
  });
}
