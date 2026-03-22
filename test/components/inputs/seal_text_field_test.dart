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
  group('SealTextField', () {
    testWidgets('renders an editable field', (tester) async {
      await tester.pumpWidget(_wrap(const SealTextField()));
      await tester.pump();

      expect(find.byType(EditableText), findsOneWidget);
    });

    testWidgets('displays label text', (tester) async {
      await tester.pumpWidget(_wrap(const SealTextField(label: 'Email')));
      await tester.pump();

      expect(find.text('Email'), findsOneWidget);
    });

    testWidgets('displays hint text', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealTextField(hint: 'you@example.com')),
      );
      await tester.pump();

      // Tap to focus so the hint is visible
      await tester.tap(find.byType(EditableText));
      await tester.pump();

      expect(find.text('you@example.com'), findsOneWidget);
    });

    testWidgets('calls onChanged when text is entered', (tester) async {
      String? changedValue;
      await tester.pumpWidget(
        _wrap(SealTextField(onChanged: (v) => changedValue = v)),
      );
      await tester.pump();

      await tester.enterText(find.byType(EditableText), 'hello');
      expect(changedValue, 'hello');
    });

    testWidgets('renders correctly when disabled', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealTextField(enabled: false)),
      );
      await tester.pump();

      expect(find.byType(EditableText), findsOneWidget);
    });

    testWidgets('renders prefix icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealTextField(prefixIcon: LucideIcons.mail)),
      );
      await tester.pump();

      expect(find.byIcon(LucideIcons.mail), findsOneWidget);
    });

    testWidgets('renders suffix icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealTextField(suffixIcon: LucideIcons.eye)),
      );
      await tester.pump();

      expect(find.byIcon(LucideIcons.eye), findsOneWidget);
    });

    testWidgets('obscures text when obscureText is true', (tester) async {
      await tester.pumpWidget(_wrap(const SealTextField(obscureText: true)));
      await tester.pump();

      final editableText = tester.widget<EditableText>(
        find.byType(EditableText).first,
      );
      expect(editableText.obscureText, isTrue);
    });

    testWidgets('uses provided controller', (tester) async {
      final controller = TextEditingController(text: 'initial');
      await tester.pumpWidget(_wrap(SealTextField(controller: controller)));
      await tester.pump();

      expect(find.text('initial'), findsOneWidget);
      controller.dispose();
    });
  });
}
