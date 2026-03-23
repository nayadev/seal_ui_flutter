# SealForm — Default

Manages field registration, validation, and value collection for a group of form inputs.

## Usage

```dart
final _formKey = GlobalKey<SealFormState>();

SealForm(
  formKey: _formKey,
  child: Column(
    children: [
      ShadInputFormField(
        id: 'username',
        label: const Text('Username'),
        placeholder: const Text('Enter username'),
        validator: (v) => v.isEmpty ? 'Username is required' : null,
      ),
      ShadInputFormField(
        id: 'email',
        label: const Text('Email'),
        placeholder: const Text('Enter email'),
        validator: (v) => !v.contains('@') ? 'Enter a valid email' : null,
      ),
      SealFilledButton.primary(
        label: const Text('Submit'),
        onPressed: () {
          if (_formKey.currentState!.saveAndValidate()) {
            final values = _formKey.currentState!.value;
            print(values); // {username: 'Alice', email: 'alice@example.com'}
          }
        },
      ),
    ],
  ),
)
```
