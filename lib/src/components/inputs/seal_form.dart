import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// The state exposed by [SealForm].
///
/// Alias for [ShadFormState].
typedef SealFormState = ShadFormState;

/// The map of registered form field states.
///
/// Alias for [ShadFormFields].
typedef SealFormFields = ShadFormFields;

/// Controls when form fields auto-validate their input.
///
/// Alias for [ShadAutovalidateMode].
typedef SealAutovalidateMode = ShadAutovalidateMode;

/// A form that manages field registration, validation, and value collection.
///
/// Wrap any subtree of Seal input fields (e.g. [SealTextField],
/// [SealCheckbox], [SealSelect]) with [SealForm] to enable coordinated
/// validation and value access.
///
/// Access the form state via [SealForm.of] or a [GlobalKey<SealFormState>]:
///
/// ```dart
/// final _formKey = GlobalKey<SealFormState>();
///
/// SealForm(
///   key: _formKey,
///   child: Column(
///     children: [
///       ShadInputFormField(
///         id: 'email',
///         label: const Text('Email'),
///         validator: (v) => v == null || v.isEmpty ? 'Required' : null,
///       ),
///       SealFilledButton.primary(
///         label: const Text('Submit'),
///         onPressed: () {
///           if (_formKey.currentState!.saveAndValidate()) {
///             final values = _formKey.currentState!.value;
///             print(values);
///           }
///         },
///       ),
///     ],
///   ),
/// )
/// ```
class SealForm extends StatelessWidget {
  /// Creates a form.
  const SealForm({
    super.key,
    required this.child,
    this.formKey,
    this.onChanged,
    this.canPop,
    this.onPopInvokedWithResult,
    this.autovalidateMode =
        SealAutovalidateMode.alwaysAfterFirstValidation,
    this.initialValue = const {},
    this.enabled = true,
    this.skipDisabled = false,
    this.clearValueOnUnregister = false,
    this.fieldIdSeparator = '.',
  });

  /// The widget tree contained within the form.
  final Widget child;

  /// Optional key to access the [SealFormState] from outside the widget.
  final GlobalKey<SealFormState>? formKey;

  /// Called whenever any field value changes.
  final VoidCallback? onChanged;

  /// Whether a back-navigation pop is allowed.
  final bool? canPop;

  /// Called when the form is popped via navigation.
  final PopInvokedWithResultCallback<Object?>? onPopInvokedWithResult;

  /// When fields validate their input. Defaults to
  /// [SealAutovalidateMode.alwaysAfterFirstValidation].
  final SealAutovalidateMode autovalidateMode;

  /// Initial values keyed by field id.
  final Map<String, dynamic> initialValue;

  /// Whether form fields respond to input. Defaults to `true`.
  final bool enabled;

  /// Whether disabled fields are skipped during validation.
  final bool skipDisabled;

  /// Whether to clear a field's value when it is removed from the tree.
  final bool clearValueOnUnregister;

  /// Separator for nested field ids. Defaults to `'.'`.
  final String? fieldIdSeparator;

  /// Returns the nearest [SealFormState] from [context].
  ///
  /// Throws if no [SealForm] ancestor is found.
  static SealFormState of(BuildContext context) => ShadForm.of(context);

  /// Returns the nearest [SealFormState] from [context], or `null` if none.
  static SealFormState? maybeOf(BuildContext context) =>
      ShadForm.maybeOf(context);

  @override
  Widget build(BuildContext context) {
    return ShadForm(
      key: formKey,
      onChanged: onChanged,
      canPop: canPop,
      onPopInvokedWithResult: onPopInvokedWithResult,
      autovalidateMode: autovalidateMode,
      initialValue: initialValue,
      enabled: enabled,
      skipDisabled: skipDisabled,
      clearValueOnUnregister: clearValueOnUnregister,
      fieldIdSeparator: fieldIdSeparator,
      child: child,
    );
  }
}
