# SealInputOTP — Default

A token-styled OTP input built on `ShadInputOTP`. Compose `SealInputOTPGroup`
and `SealInputOTPSlot` to define the layout. Focus advances automatically
as each slot is filled.

## Usage

```dart
SealInputOTP(
  maxLength: 6,
  onChanged: (value) => debugPrint(value),
  children: [
    SealInputOTPGroup(
      children: List.generate(3, (_) => const SealInputOTPSlot()),
    ),
    SealInputOTPGroup(
      children: List.generate(3, (_) => const SealInputOTPSlot()),
    ),
  ],
)
```
