import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nebula_ui/nebula_ui.dart';

Widget _wrap(Widget child) {
  return NebulaTheme(
    tokens: NebulaThemeFactory.darkTokens(),
    child: MaterialApp(
      theme: NebulaThemeFactory.dark(),
      home: Scaffold(body: Center(child: child)),
    ),
  );
}

void main() {
  group('NebulaTextField', () {
    testWidgets('renders a TextField', (tester) async {
      await tester.pumpWidget(_wrap(const NebulaTextField()));
      await tester.pump();

      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('displays label text', (tester) async {
      await tester.pumpWidget(_wrap(const NebulaTextField(label: 'Email')));
      await tester.pump();

      expect(find.text('Email'), findsOneWidget);
    });

    testWidgets('displays hint text', (tester) async {
      await tester.pumpWidget(
        _wrap(const NebulaTextField(hint: 'you@example.com')),
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
        _wrap(NebulaTextField(onChanged: (v) => changedValue = v)),
      );
      await tester.pump();

      await tester.enterText(find.byType(TextField), 'hello');
      expect(changedValue, 'hello');
    });

    testWidgets('does not accept input when disabled', (tester) async {
      String? changedValue;
      await tester.pumpWidget(
        _wrap(
          NebulaTextField(enabled: false, onChanged: (v) => changedValue = v),
        ),
      );
      await tester.pump();

      await tester.enterText(find.byType(TextField), 'hello');
      expect(changedValue, isNull);
    });

    testWidgets('renders prefix icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(const NebulaTextField(prefixIcon: Icons.email)),
      );
      await tester.pump();

      expect(find.byIcon(Icons.email), findsOneWidget);
    });

    testWidgets('renders suffix icon when provided', (tester) async {
      await tester.pumpWidget(
        _wrap(const NebulaTextField(suffixIcon: Icons.visibility)),
      );
      await tester.pump();

      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });

    testWidgets('obscures text when obscureText is true', (tester) async {
      await tester.pumpWidget(_wrap(const NebulaTextField(obscureText: true)));
      await tester.pump();

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.obscureText, isTrue);
    });

    testWidgets('uses provided controller', (tester) async {
      final controller = TextEditingController(text: 'initial');
      await tester.pumpWidget(_wrap(NebulaTextField(controller: controller)));
      await tester.pump();

      expect(find.text('initial'), findsOneWidget);
      controller.dispose();
    });
  });
}
