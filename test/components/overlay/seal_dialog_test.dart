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
  group('SealDialog', () {
    testWidgets('renders title and description', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SealDialog(
            title: Text('Edit profile'),
            description: Text('Make changes to your profile here.'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Edit profile'), findsOneWidget);
      expect(find.text('Make changes to your profile here.'), findsOneWidget);
    });

    testWidgets('renders action buttons', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealDialog(
            title: const Text('Confirm'),
            actions: [
              SealFilledButton.primary(
                label: const Text('Save'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Save'), findsOneWidget);
    });

    testWidgets('renders alert variant', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SealDialog.alert(
            title: Text('Are you sure?'),
            description: Text('This action cannot be undone.'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Are you sure?'), findsOneWidget);
      expect(find.text('This action cannot be undone.'), findsOneWidget);
    });

    testWidgets('renders arbitrary child content', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SealDialog(
            title: Text('Details'),
            child: Text('Custom content'),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('Custom content'), findsOneWidget);
    });

    testWidgets('showSealDialog displays dialog in overlay', (tester) async {
      await tester.pumpWidget(
        _wrap(
          Builder(
            builder: (context) => SealFilledButton.primary(
              label: const Text('Open'),
              onPressed: () => showSealDialog<void>(
                context: context,
                builder: (_) => const SealDialog(
                  title: Text('Dialog title'),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('Dialog title'), findsOneWidget);
    });
  });
}
