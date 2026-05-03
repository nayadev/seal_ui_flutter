import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealInputOTPComponent extends WidgetbookComponent {
  SealInputOTPComponent()
    : super(
        name: 'SealInputOTP',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealInputOTP(
                maxLength: 6,
                enabled: context.knobs.boolean(
                  label: 'Enabled',
                  initialValue: true,
                ),
                onChanged: (_) {},
                children: [
                  SealInputOTPGroup(
                    children: List.generate(
                      3,
                      (_) => const SealInputOTPSlot(),
                    ),
                  ),
                  SealInputOTPGroup(
                    children: List.generate(
                      3,
                      (_) => const SealInputOTPSlot(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          WidgetbookUseCase(
            name: 'Four Digit',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealInputOTP(
                maxLength: 4,
                onChanged: (_) {},
                children: [
                  SealInputOTPGroup(
                    children: List.generate(
                      4,
                      (_) => const SealInputOTPSlot(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
