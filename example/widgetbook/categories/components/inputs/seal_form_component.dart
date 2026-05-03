import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';
import 'package:shadcn_ui/shadcn_ui.dart' show ShadInputFormField;
import 'package:widgetbook/widgetbook.dart';

class SealFormComponent extends WidgetbookComponent {
  SealFormComponent()
    : super(
        name: 'SealForm',
        useCases: [
          WidgetbookUseCase(
            name: 'Default',
            builder: (context) {
              final formKey = GlobalKey<SealFormState>();
              String? result;
              return StatefulBuilder(
                builder: (ctx, setState) => Padding(
                  padding: EdgeInsets.all(ctx.dimension.lg),
                  child: SealForm(
                    formKey: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ShadInputFormField(
                          id: 'username',
                          label: const Text('Username'),
                          placeholder: const Text('Enter username'),
                          validator: (v) =>
                              v.isEmpty ? 'Username is required' : null,
                        ),
                        ctx.dimension.sm.verticalGap,
                        ShadInputFormField(
                          id: 'email',
                          label: const Text('Email'),
                          placeholder: const Text('Enter email'),
                          validator: (v) =>
                              !v.contains('@') ? 'Enter a valid email' : null,
                        ),
                        ctx.dimension.md.verticalGap,
                        SealFilledButton.primary(
                          label: const Text('Submit'),
                          onPressed: () {
                            if (formKey.currentState!.saveAndValidate()) {
                              setState(() {
                                result = formKey.currentState!.value.toString();
                              });
                            }
                          },
                        ),
                        if (result != null) ...[
                          ctx.dimension.sm.verticalGap,
                          Text(result!),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      );
}
