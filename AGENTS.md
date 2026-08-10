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
- Name functions, types, fields, and data opportunistically as decompilation or
  native-port work establishes clear semantic evidence. Prefer these focused
  naming improvements along the way over speculative, standalone renaming.
- Keep comments useful in both the portable and matching implementations. A
  matching assembly fallback should point readers to its documented portable C
  equivalent when one exists.
- Documentation changes must not alter the matching code or data layout. Run
  the relevant match target after editing decompiled C.

## Overlays
- When decompiling overlays, fully finish the specific overlay, before moving on to the next one.
- Only verify the below mentionen ROM correctness guardrails after finishing the whole overlay.

## ROM correctness guardrail

- When adding or splitting reconstructed objects, update
  `config/arm9/link_replacements.txt` and the corresponding replacement-object
  dependencies in `build.ninja` together. Never rely on objects left by an
  earlier build.
- Export every assembly symbol referenced from another object with `.global`;
  exact per-object matches do not prove that the final module can link.
- Before finishing a decompilation batch, run `ninja rom` from the current
  sources and require its module checks and expected retail SHA-256 to pass.

## Repository documentation

- Do not treat repository documentation as a decompilation diary. Do not add a
  document, status entry, README note, or build-guide paragraph merely to record
  that another file or function was decompiled.
- Add or update standalone documentation only when the work establishes durable,
  concrete information such as subsystem behavior, a data format, an interface
  contract, a verified platform or SDK boundary, or a reproducible workflow.
- Document genuine coding traps when they would otherwise cost future work:
  compiler-sensitive constructs, misleading disassembly, relocation behavior,
  matching-only fallbacks, ownership constraints, and similar non-obvious facts.
- Keep ordinary progress in the source, symbols, delink configuration, match
  reports, and version-control history instead of duplicating it in prose.
- Put durable information in the narrowest existing relevant document. Create a
  new document only when the subject needs an enduring explanation that cannot
  be expressed clearly through source comments or existing documentation.
- Avoid tables or prose that simply enumerate every reconstructed file,
  function, address, size, or match percentage when those facts are already
  available from source, configuration, or generated reports.
