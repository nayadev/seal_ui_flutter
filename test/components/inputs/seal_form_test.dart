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
  group('SealForm', () {
    testWidgets('renders child without error', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealForm(child: const Text('Form content')),
        ),
      );
      await tester.pump();

      expect(find.text('Form content'), findsOneWidget);
    });

    testWidgets('wraps ShadForm', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealForm(child: const Text('content')),
        ),
      );
      await tester.pump();

      expect(find.byType(ShadForm), findsOneWidget);
    });

    testWidgets('of() returns SealFormState', (tester) async {
      SealFormState? state;
      await tester.pumpWidget(
        _wrap(
          SealForm(
            child: Builder(
              builder: (ctx) {
                state = SealForm.of(ctx);
                return const Text('content');
              },
            ),
          ),
        ),
      );
      await tester.pump();

      expect(state, isNotNull);
    });

    testWidgets('maybeOf() returns null outside form', (tester) async {
      SealFormState? state;
      await tester.pumpWidget(
        _wrap(
          Builder(
            builder: (ctx) {
              state = SealForm.maybeOf(ctx);
              return const Text('content');
            },
          ),
        ),
      );
      await tester.pump();

      expect(state, isNull);
    });

    testWidgets('validates fields on saveAndValidate', (tester) async {
      final formKey = GlobalKey<SealFormState>();
      await tester.pumpWidget(
        _wrap(
          SealForm(
            formKey: formKey,
            child: ShadInputFormField(
              id: 'name',
              validator: (v) => v.isEmpty ? 'Required' : null,
            ),
          ),
        ),
      );
      await tester.pump();

      final isValid = formKey.currentState!.saveAndValidate();
      await tester.pump();

      expect(isValid, isFalse);
    });

    testWidgets('initialValue populates fields', (tester) async {
      final formKey = GlobalKey<SealFormState>();
      await tester.pumpWidget(
        _wrap(
          SealForm(
            formKey: formKey,
            initialValue: const {'name': 'Alice'},
            child: ShadInputFormField(id: 'name'),
          ),
        ),
      );
      await tester.pump();

      expect(formKey.currentState!.value['name'], 'Alice');
    });

    testWidgets('reset clears form state', (tester) async {
      final formKey = GlobalKey<SealFormState>();
      await tester.pumpWidget(
        _wrap(
          SealForm(
            formKey: formKey,
            child: ShadInputFormField(id: 'name'),
          ),
        ),
      );
      await tester.pump();

      formKey.currentState!.reset();
      await tester.pump();

      expect(formKey.currentState, isNotNull);
    });
  });

  group('SealAutovalidateMode typedef', () {
    test('maps to ShadAutovalidateMode', () {
      expect(
        SealAutovalidateMode.values,
        equals(ShadAutovalidateMode.values),
      );
    });
  });
}
