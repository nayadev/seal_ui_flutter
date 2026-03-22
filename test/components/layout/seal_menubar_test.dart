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
  group('SealMenubar', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealMenubar(
            items: [
              SealMenubarItem(
                items: const [],
                child: const Text('File'),
              ),
            ],
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealMenubar), findsOneWidget);
    });

    testWidgets('renders multiple items', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealMenubar(
            items: [
              SealMenubarItem(
                items: [
                  SealContextMenuItem(
                    child: const Text('New'),
                    onPressed: () {},
                  ),
                ],
                child: const Text('File'),
              ),
              SealMenubarItem(
                items: [
                  SealContextMenuItem(
                    child: const Text('Undo'),
                    onPressed: () {},
                  ),
                ],
                child: const Text('Edit'),
              ),
            ],
          ),
        ),
      );
      await tester.pump();

      expect(find.text('File'), findsOneWidget);
      expect(find.text('Edit'), findsOneWidget);
    });

    testWidgets('dropdown items not visible before tap', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealMenubar(
            items: [
              SealMenubarItem(
                items: [
                  SealContextMenuItem(
                    child: const Text('New'),
                    onPressed: () {},
                  ),
                ],
                child: const Text('File'),
              ),
            ],
          ),
        ),
      );
      await tester.pump();

      expect(find.text('New'), findsNothing);
    });

    testWidgets('disabled item renders without error', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealMenubar(
            items: [
              SealMenubarItem(
                enabled: false,
                items: [
                  SealContextMenuItem(
                    child: const Text('Action'),
                    onPressed: () {},
                  ),
                ],
                child: const Text('Disabled'),
              ),
            ],
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Disabled'), findsOneWidget);
    });

    testWidgets('controller can be provided', (tester) async {
      final controller = SealMenubarController();
      await tester.pumpWidget(
        _wrap(
          SealMenubar(
            controller: controller,
            items: [
              SealMenubarItem(
                items: const [],
                child: const Text('File'),
              ),
            ],
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealMenubar), findsOneWidget);
      controller.dispose();
    });
  });
}
