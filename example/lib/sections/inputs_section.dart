import 'package:flutter/widgets.dart';
import 'package:seal_ui/seal_ui.dart';

/// Showcases all input and form control components: [SealCheckbox],
/// [SealRadioGroup], [SealSelect], [SealSlider], [SealSwitch],
/// [SealTextarea], and [SealTextField].
class InputsSection extends StatefulWidget {
  const InputsSection({super.key});

  @override
  State<InputsSection> createState() => _InputsSectionState();
}

class _InputsSectionState extends State<InputsSection> {
  bool _checkboxA = false;
  bool _checkboxB = true;
  String? _radioTheme = 'system';
  String? _selectTheme;
  bool _switchA = false;
  bool _switchB = true;

  @override
  Widget build(BuildContext context) {
    final colors = context.themeTokens.colors;
    final typo = context.themeTokens.typography;
    final dimension = context.dimension;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Inputs', style: typo.title.copyWith(color: colors.textPrimary)),
        dimension.md.verticalGap,

        // ── Checkbox ─────────────────────────────────────────────────────
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

        dimension.lg.verticalGap,

        // ── Radio Group ───────────────────────────────────────────────────
        Text(
          'Radio Group',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.xs.verticalGap,
        SealRadioGroup<String>(
          value: _radioTheme,
          onChanged: (v) => setState(() => _radioTheme = v),
          items: const [
            SealRadioItem(value: 'light', label: Text('Light')),
            SealRadioItem(value: 'dark', label: Text('Dark')),
            SealRadioItem(value: 'system', label: Text('System')),
          ],
        ),
        dimension.xs.verticalGap,
        SealRadioGroup<String>(
          value: 'dark',
          enabled: false,
          onChanged: null,
          items: const [
            SealRadioItem(value: 'light', label: Text('Light')),
            SealRadioItem(value: 'dark', label: Text('Dark')),
          ],
        ),

        dimension.lg.verticalGap,

        // ── Select ────────────────────────────────────────────────────────
        Text(
          'Select',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.xs.verticalGap,
        SealSelect<String>(
          label: 'Theme',
          placeholder: 'Choose a theme',
          value: _selectTheme,
          onChanged: (v) => setState(() => _selectTheme = v),
          options: const [
            SealSelectOption(value: 'nebula', label: 'Nebula'),
            SealSelectOption(value: 'arctic', label: 'Arctic'),
            SealSelectOption(value: 'ocean', label: 'Deep Ocean'),
            SealSelectOption(value: 'terminal', label: 'Terminal'),
          ],
        ),
        dimension.xs.verticalGap,
        SealSelect<String>(
          placeholder: 'Disabled',
          enabled: false,
          onChanged: null,
          options: const [
            SealSelectOption(value: 'nebula', label: 'Nebula'),
          ],
        ),

        dimension.lg.verticalGap,

        // ── Slider ────────────────────────────────────────────────────────
        Text(
          'Slider',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.xs.verticalGap,
        SealSlider(value: 0.4, onChanged: (_) {}),
        dimension.xs.verticalGap,
        SealSlider(value: 60, min: 0, max: 100, divisions: 10, onChanged: (_) {}),
        dimension.xs.verticalGap,
        const SealSlider(value: 0.5, enabled: false),

        dimension.lg.verticalGap,

        // ── Switch ────────────────────────────────────────────────────────
        Text(
          'Switch',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.xs.verticalGap,
        SealSwitch(
          value: _switchA,
          onChanged: (v) => setState(() => _switchA = v),
          label: const Text('Enable notifications'),
        ),
        dimension.xs.verticalGap,
        SealSwitch(
          value: _switchB,
          onChanged: (v) => setState(() => _switchB = v),
          label: const Text('Dark mode'),
          sublabel: const Text('Switch between dark and light themes.'),
        ),
        dimension.xs.verticalGap,
        SealSwitch(
          value: false,
          enabled: false,
          onChanged: null,
          label: const Text('Disabled switch'),
        ),

        dimension.lg.verticalGap,

        // ── Textarea ──────────────────────────────────────────────────────
        Text(
          'Textarea',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.xs.verticalGap,
        const SealTextarea(
          label: 'Description',
          hint: 'Enter a description…',
        ),
        dimension.xs.verticalGap,
        const SealTextarea(hint: 'Disabled', enabled: false),

        dimension.lg.verticalGap,

        // ── Text Field ────────────────────────────────────────────────────
        Text(
          'Text Field',
          style: typo.subtitle.copyWith(color: colors.textSecondary),
        ),
        dimension.xs.verticalGap,
        const SealTextField(
          label: 'Email',
          hint: 'you@example.com',
          prefixIcon: LucideIcons.mail,
        ),
        dimension.xs.verticalGap,
        const SealTextField(
          label: 'Password',
          hint: '••••••••',
          obscureText: true,
          prefixIcon: LucideIcons.lock,
          suffixIcon: LucideIcons.eyeOff,
        ),
      ],
    );
  }
}
