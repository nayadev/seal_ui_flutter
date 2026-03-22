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
  group('SealContextMenuRegion', () {
    testWidgets('renders child without error', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealContextMenuRegion(
            items: [
              SealContextMenuItem(
                child: const Text('Copy'),
                onPressed: () {},
              ),
            ],
            child: const Text('Target'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Target'), findsOneWidget);
    });

    testWidgets('menu items are not visible before trigger', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealContextMenuRegion(
            items: [
              SealContextMenuItem(
                child: const Text('Copy'),
                onPressed: () {},
              ),
            ],
            child: const Text('Target'),
          ),
        ),
      );
      await tester.pump();

      // Menu items should not be visible before interaction.
      expect(find.text('Copy'), findsNothing);
    });

    testWidgets('renders with multiple items', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealContextMenuRegion(
            items: [
              SealContextMenuItem(
                child: const Text('Cut'),
                onPressed: () {},
              ),
              SealContextMenuItem(
                child: const Text('Copy'),
                onPressed: () {},
              ),
              SealContextMenuItem(
                child: const Text('Paste'),
                onPressed: () {},
              ),
            ],
            child: const Text('Target'),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealContextMenuRegion), findsOneWidget);
    });

    testWidgets('renders with leading icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealContextMenuRegion(
            items: [
              SealContextMenuItem(
                leading: const Icon(LucideIcons.copy, size: 14),
                child: const Text('Copy'),
                onPressed: () {},
              ),
            ],
            child: const Text('Target'),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealContextMenuRegion), findsOneWidget);
    });

    testWidgets('renders with disabled item', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealContextMenuRegion(
            items: [
              const SealContextMenuItem(
                enabled: false,
                child: Text('Disabled'),
              ),
            ],
            child: const Text('Target'),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealContextMenuRegion), findsOneWidget);
    });

    testWidgets('renders with submenu items', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealContextMenuRegion(
            items: [
              SealContextMenuItem(
                items: [
                  SealContextMenuItem(
                    child: const Text('Sub item'),
                    onPressed: () {},
                  ),
                ],
                child: const Text('Parent'),
              ),
            ],
            child: const Text('Target'),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealContextMenuRegion), findsOneWidget);
    });

    testWidgets('controller can be provided', (tester) async {
      final controller = SealContextMenuController();
      await tester.pumpWidget(
        _wrap(
          SealContextMenuRegion(
            controller: controller,
            items: [
              SealContextMenuItem(
                child: const Text('Copy'),
                onPressed: () {},
              ),
            ],
            child: const Text('Target'),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealContextMenuRegion), findsOneWidget);
      controller.dispose();
    });
  });

  group('SealContextMenuItem', () {
    testWidgets('inset variant renders without error', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealContextMenuRegion(
            items: [
              const SealContextMenuItem(
                inset: true,
                child: Text('Inset item'),
              ),
            ],
            child: const Text('Target'),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealContextMenuRegion), findsOneWidget);
    });
  });
}
