import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:seal_ui/seal_ui.dart';

Widget _wrap(Widget child) {
  return SealTheme(
    tokens: SealThemeFactory.darkTokens(),
    child: MaterialApp(
      theme: SealThemeFactory.dark(),
      home: Scaffold(body: Center(child: child)),
    ),
  );
}

void main() {
  group('SealTextField', () {
    testWidgets('renders a TextField', (tester) async {
      await tester.pumpWidget(_wrap(const SealTextField()));
      await tester.pump();

      expect(find.byType(TextField), findsOneWidget);
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
      await tester.tap(find.byType(TextField));
      await tester.pump();

      expect(find.text('you@example.com'), findsOneWidget);
    });

    testWidgets('calls onChanged when text is entered', (tester) async {
      String? changedValue;
      await tester.pumpWidget(
        _wrap(SealTextField(onChanged: (v) => changedValue = v)),
      );
      await tester.pump();

      await tester.enterText(find.byType(TextField), 'hello');
      expect(changedValue, 'hello');
    });

    testWidgets('does not accept input when disabled', (tester) async {
      String? changedValue;
      await tester.pumpWidget(
        _wrap(
          SealTextField(enabled: false, onChanged: (v) => changedValue = v),
        ),
      );
      await tester.pump();

      await tester.enterText(find.byType(TextField), 'hello');
      expect(changedValue, isNull);
    });

    testWidgets('renders prefix icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealTextField(prefixIcon: Icons.email)),
      );
      await tester.pump();

      expect(find.byIcon(Icons.email), findsOneWidget);
    });

    testWidgets('renders suffix icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(const SealTextField(suffixIcon: Icons.visibility)),
      );
      await tester.pump();

      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });

    testWidgets('obscures text when obscureText is true', (tester) async {
      await tester.pumpWidget(_wrap(const SealTextField(obscureText: true)));
      await tester.pump();

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.obscureText, isTrue);
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
