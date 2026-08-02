# Repository guidance

## Decompiled C documentation

- Comment every decompiled or reconstructed C file under `src/`.
- Begin each C file with a short description of the recovered subsystem and its
  known responsibilities.
- Give every recovered function a concise comment describing its inputs,
  observable state changes, return value, and important hardware or SDK effects
  when applicable.
- Comment non-obvious constants, offset-based accesses, matching-only control
  flow, and relationships between reconstructed functions.
- Keep confirmed behavior separate from inference. Preserve address-derived
  names and offset-based field names until evidence supports a semantic name;
  do not turn guesses into comments that read as established facts.
- Keep comments useful in both the portable and matching implementations. A
  matching assembly fallback should point readers to its documented portable C
  equivalent when one exists.
- Documentation changes must not alter the matching code or data layout. Run
  the relevant match target after editing decompiled C.
