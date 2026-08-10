# Game-work flags

## Storage contract

`GameWork_SetFlag`, `GameWork_TestFlag`, and `GameWork_ClearFlag` access the
`GameWork.bytes024C` array. Each flag number maps to byte `flag / 8` and bit
`flag % 8`. The backing array is `0x180` bytes, providing storage for 3,072
flags. These functions perform no bounds checking, so callers must supply a
flag in the range `0-3071`.

`GameWork_SetFlag` and `GameWork_ClearFlag` preserve the other seven bits in the
selected byte. `GameWork_TestFlag` returns zero or one and does not modify the
work object.

## Native recompilation boundary

This unit has no NitroSDK calls, hardware-register accesses, fixed global
addresses, allocation, or architecture-specific code. Its C implementation is
directly reusable by the native recompilation once the `GameWork` ABI and
storage strategy are settled. The unchecked index is part of the recovered
caller contract and should be validated only at a higher-level boundary that
accepts untrusted host input.
