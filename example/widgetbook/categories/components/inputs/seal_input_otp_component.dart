import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Default', type: SealInputOTP, path: '[Components]/Inputs')
Widget buildSealInputOTPDefault(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(context.dimension.lg),
    child: SealInputOTP(
      maxLength: 6,
      enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
      onChanged: (_) {},
      children: [
        SealInputOTPGroup(
          children: List.generate(3, (_) => const SealInputOTPSlot()),
        ),
        SealInputOTPGroup(
          children: List.generate(3, (_) => const SealInputOTPSlot()),
        ),
      ],
    ),
  );
}

@UseCase(name: 'Four Digit', type: SealInputOTP, path: '[Components]/Inputs')
Widget buildSealInputOTPFourDigit(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(context.dimension.lg),
    child: SealInputOTP(
      maxLength: 4,
      onChanged: (_) {},
      children: [
        SealInputOTPGroup(
          children: List.generate(4, (_) => const SealInputOTPSlot()),
        ),
      ],
    ),
  );
}
