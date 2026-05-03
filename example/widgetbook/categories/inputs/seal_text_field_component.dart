import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class SealTextFieldComponent extends WidgetbookComponent {
  SealTextFieldComponent()
    : super(
        name: 'SealTextField',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: SealTextField(
                label: context.knobs.string(
                  label: 'Label',
                  initialValue: 'Email',
                ),
                hint: context.knobs.string(
                  label: 'Hint',
                  initialValue: 'you@example.com',
                ),
                enabled: context.knobs.boolean(
                  label: 'Enabled',
                  initialValue: true,
                ),
                prefixIcon:
                    context.knobs.boolean(
                      label: 'Show Prefix Icon',
                      initialValue: true,
                    )
                    ? LucideIcons.mail
                    : null,
              ),
            ),
          ),
          WidgetbookUseCase(
            name: 'Password',
            builder: (context) => Padding(
              padding: EdgeInsets.all(context.dimension.lg),
              child: const SealTextField(
                label: 'Password',
                hint: '••••••••',
                obscureText: true,
                prefixIcon: LucideIcons.lock,
                suffixIcon: LucideIcons.eyeOff,
              ),
            ),
          ),
        ],
      );
}
