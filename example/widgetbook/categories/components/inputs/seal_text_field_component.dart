import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' show UseCase;

@UseCase(name: 'Default', type: SealTextField, path: '[Components]/Inputs')
Widget buildSealTextFieldDefault(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(context.dimension.lg),
    child: SealTextField(
      label: Text(context.knobs.string(label: 'Label', initialValue: 'Email')),
      hint: Text(
        context.knobs.string(
          label: 'Hint',
          initialValue: 'you@example.com',
        ),
      ),
      enabled: context.knobs.boolean(label: 'Enabled', initialValue: true),
      prefixIcon:
          context.knobs.boolean(label: 'Show Prefix Icon', initialValue: true)
          ? LucideIcons.mail
          : null,
    ),
  );
}

@UseCase(name: 'Password', type: SealTextField, path: '[Components]/Inputs')
Widget buildSealTextFieldPassword(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(context.dimension.lg),
    child: const SealTextField(
      label: Text('Password'),
      hint: Text('••••••••'),
      obscureText: true,
      prefixIcon: LucideIcons.lock,
      suffixIcon: LucideIcons.eyeOff,
    ),
  );
}
