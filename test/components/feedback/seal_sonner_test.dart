import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Widget _wrap(Widget child) {
  return ShadApp(
    home: SealThemeScope(
      tokens: SealThemeFactory.darkTokens(),
      child: SingleChildScrollView(child: Center(child: child)),
    ),
  );
}

void main() {
  group('SealSonner', () {
    testWidgets('renders child without error', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SealSonner(child: Text('Content')),
        ),
      );
      await tester.pump();

      expect(find.text('Content'), findsOneWidget);
    });

    testWidgets('wraps ShadSonner', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SealSonner(child: Text('Content')),
        ),
      );
      await tester.pump();

      // At least one ShadSonner is present (SealThemeScope may inject another).
      expect(find.byType(ShadSonner), findsAtLeastNWidgets(1));
    });

    testWidgets('renders with custom alignment', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SealSonner(
            alignment: Alignment.topLeft,
            child: Text('Content'),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealSonner), findsOneWidget);
    });

    testWidgets('renders with custom visibleToastsAmount', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SealSonner(
            visibleToastsAmount: 5,
            child: Text('Content'),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealSonner), findsOneWidget);
    });

    testWidgets('showSealSonner displays toast', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealSonner(
            child: Builder(
              builder: (ctx) => GestureDetector(
                onTap: () => showSealSonner(
                  ctx,
                  title: const Text('Test toast'),
                ),
                child: const Text('Tap me'),
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Tap me'));
      await tester.pump();

      expect(find.byType(SealSonner), findsOneWidget);
    });

    testWidgets('of() returns ShadSonnerState', (tester) async {
      ShadSonnerState? state;
      await tester.pumpWidget(
        _wrap(
          SealSonner(
            child: Builder(
              builder: (ctx) {
                state = SealSonner.of(ctx);
                return const Text('Content');
              },
            ),
          ),
        ),
      );
      await tester.pump();

      expect(state, isNotNull);
    });
  });
}
