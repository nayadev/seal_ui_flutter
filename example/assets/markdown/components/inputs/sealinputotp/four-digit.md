# SealInputOTP — Four Digit

A 4-digit OTP with a single group. Useful for shorter PINs.

## Usage

```dart
SealInputOTP(
  maxLength: 4,
  onChanged: (value) => debugPrint(value),
  children: [
    SealInputOTPGroup(
      children: List.generate(4, (_) => const SealInputOTPSlot()),
    ),
  ],
)
```
