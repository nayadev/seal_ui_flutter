import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadApp;

Widget _wrap(Widget child) {
  return ShadApp(
    home: SealThemeScope(
      tokens: SealThemeFactory.darkTokens(),
      child: Center(child: child),
    ),
  );
}

void main() {
  group('SealSheet', () {
    testWidgets('showSealSheet displays title', (tester) async {
      await tester.pumpWidget(
        _wrap(
          Builder(
            builder: (context) => SealFilledButton.primary(
              label: const Text('Open'),
              onPressed: () => showSealSheet<void>(
                context: context,
                builder: (_) => const SealSheet(
                  title: Text('Filter'),
                  description: Text('Narrow down your results.'),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('Filter'), findsOneWidget);
      expect(find.text('Narrow down your results.'), findsOneWidget);
    });

    testWidgets('showSealSheet displays child content', (tester) async {
      await tester.pumpWidget(
        _wrap(
          Builder(
            builder: (context) => SealFilledButton.primary(
              label: const Text('Open'),
              onPressed: () => showSealSheet<void>(
                context: context,
                builder: (_) => const SealSheet(
                  title: Text('Settings'),
                  child: Text('Sheet body'),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('Sheet body'), findsOneWidget);
    });

    testWidgets('showSealSheet displays action buttons', (tester) async {
      await tester.pumpWidget(
        _wrap(
          Builder(
            builder: (context) => SealFilledButton.primary(
              label: const Text('Open'),
              onPressed: () => showSealSheet<void>(
                context: context,
                builder: (ctx) => SealSheet(
                  title: const Text('Confirm'),
                  actions: [
                    SealFilledButton.primary(
                      label: const Text('Apply'),
                      onPressed: () => Navigator.of(ctx).pop(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('Apply'), findsOneWidget);
    });

    testWidgets('showSealSheet from right side', (tester) async {
      await tester.pumpWidget(
        _wrap(
          Builder(
            builder: (context) => SealFilledButton.primary(
              label: const Text('Open Right'),
              onPressed: () => showSealSheet<void>(
                context: context,
                side: SealSheetSide.right,
                builder: (_) => const SealSheet(
                  title: Text('Right sheet'),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Open Right'));
      await tester.pumpAndSettle();

      expect(find.text('Right sheet'), findsOneWidget);
    });

    testWidgets('showSealSheet from top side', (tester) async {
      await tester.pumpWidget(
        _wrap(
          Builder(
            builder: (context) => SealFilledButton.primary(
              label: const Text('Open Top'),
              onPressed: () => showSealSheet<void>(
                context: context,
                side: SealSheetSide.top,
                builder: (_) => const SealSheet(
                  title: Text('Top sheet'),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Open Top'));
      await tester.pumpAndSettle();

      expect(find.text('Top sheet'), findsOneWidget);
    });
  });
}
