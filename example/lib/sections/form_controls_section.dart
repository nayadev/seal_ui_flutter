import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';

/// Showcases form control components: checkbox, switch, radio group.
class FormControlsSection extends StatefulWidget {
  const FormControlsSection({super.key});

  @override
  State<FormControlsSection> createState() => _FormControlsSectionState();
}

class _FormControlsSectionState extends State<FormControlsSection> {
  bool _checkboxA = false;
  bool _checkboxB = true;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;
    final typo = context.themeTokens.typography;
    final dimension = context.dimension;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Form Controls',
          style: typo.title.copyWith(color: colors.textPrimary),
        ),
        dimension.md.verticalGap,

        Text(
          'Checkbox',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.xs.verticalGap,
        SealCheckbox(
          value: _checkboxA,
          onChanged: (v) => setState(() => _checkboxA = v),
          label: const Text('Accept terms and conditions'),
          sublabel: const Text('You agree to our Terms of Service.'),
        ),
        dimension.xs.verticalGap,
        SealCheckbox(
          value: _checkboxB,
          onChanged: (v) => setState(() => _checkboxB = v),
          label: const Text('Subscribe to newsletter'),
        ),
        dimension.xs.verticalGap,
        SealCheckbox(
          value: false,
          enabled: false,
          onChanged: null,
          label: const Text('Disabled option'),
        ),
      ],
    );
  }
}
