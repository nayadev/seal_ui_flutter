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
  group('SealTooltip', () {
    testWidgets('renders child widget', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealTooltip(
            message: 'Delete item',
            child: SealFilledButton.primary(
              label: const Text('Hover me'),
              onPressed: () {},
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Hover me'), findsOneWidget);
    });

    testWidgets('does not show message by default (before hover)',
        (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SealTooltip(
            message: 'Tooltip text',
            child: Text('Target'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Target'), findsOneWidget);
      expect(find.text('Tooltip text'), findsNothing);
    });

    testWidgets('wraps ShadTooltip', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SealTooltip(
            message: 'Tooltip text',
            child: Text('Target'),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ShadTooltip), findsOneWidget);
    });

    testWidgets('renders with custom builder', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealTooltip.custom(
            builder: (ctx) => const Text('Custom content'),
            child: const Text('Target'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Target'), findsOneWidget);
    });

    testWidgets('custom builder also wraps ShadTooltip', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealTooltip.custom(
            builder: (ctx) => const Text('Custom content'),
            child: const Text('Target'),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ShadTooltip), findsOneWidget);
    });
  });
}
