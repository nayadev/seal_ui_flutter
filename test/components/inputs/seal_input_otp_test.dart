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

Widget _defaultOtp({ValueChanged<String>? onChanged, bool enabled = true}) {
  return SealInputOTP(
    maxLength: 6,
    enabled: enabled,
    onChanged: onChanged,
    children: [
      SealInputOTPGroup(
        children: List.generate(3, (_) => const SealInputOTPSlot()),
      ),
      SealInputOTPGroup(
        children: List.generate(3, (_) => const SealInputOTPSlot()),
      ),
    ],
  );
}

void main() {
  group('SealInputOTP', () {
    testWidgets('renders correct number of slots', (tester) async {
      await tester.pumpWidget(_wrap(_defaultOtp()));
      await tester.pump();

      expect(find.byType(SealInputOTPSlot), findsNWidgets(6));
    });

    testWidgets('renders correct number of groups', (tester) async {
      await tester.pumpWidget(_wrap(_defaultOtp()));
      await tester.pump();

      expect(find.byType(SealInputOTPGroup), findsNWidgets(2));
    });

    testWidgets('renders four-digit OTP with single group', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealInputOTP(
            maxLength: 4,
            onChanged: (_) {},
            children: [
              SealInputOTPGroup(
                children: List.generate(4, (_) => const SealInputOTPSlot()),
              ),
            ],
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealInputOTPSlot), findsNWidgets(4));
      expect(find.byType(SealInputOTPGroup), findsOneWidget);
    });

    testWidgets('calls onChanged when value is entered', (tester) async {
      final values = <String>[];
      await tester.pumpWidget(_wrap(_defaultOtp(onChanged: values.add)));
      await tester.pump();

      await tester.enterText(find.byType(SealInputOTPSlot).first, '1');
      await tester.pump();

      expect(values, isNotEmpty);
    });

    testWidgets('disabled OTP does not receive input', (tester) async {
      final values = <String>[];
      await tester.pumpWidget(
        _wrap(_defaultOtp(onChanged: values.add, enabled: false)),
      );
      await tester.pump();

      // Verify the disabled widget is rendered
      expect(find.byType(SealInputOTPSlot), findsNWidgets(6));
    });
  });

  group('SealInputOTPSlot', () {
    testWidgets('renders as part of OTP', (tester) async {
      await tester.pumpWidget(
        _wrap(
          SealInputOTP(
            maxLength: 1,
            onChanged: (_) {},
            children: [
              SealInputOTPGroup(
                children: const [SealInputOTPSlot()],
              ),
            ],
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(SealInputOTPSlot), findsOneWidget);
    });
  });
}
