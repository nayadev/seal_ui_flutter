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
  group('SealAvatar', () {
    testWidgets('renders with placeholder widget', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SealAvatar(
            src: '',
            placeholder: Text('JD'),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealAvatar), findsOneWidget);
    });

    testWidgets('renders small variant', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SealAvatar.small(
            src: '',
            placeholder: Text('SM'),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealAvatar), findsOneWidget);
    });

    testWidgets('renders large variant', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SealAvatar.large(
            src: '',
            placeholder: Text('LG'),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealAvatar), findsOneWidget);
    });

    testWidgets('renders default size', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealAvatar(src: '')),
      );
      await tester.pump();

      expect(find.byType(SealAvatar), findsOneWidget);
    });

    testWidgets('renders with custom size', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SealAvatar(src: '', size: 64),
        ),
      );
      await tester.pump();

      expect(find.byType(SealAvatar), findsOneWidget);
    });
  });
}
