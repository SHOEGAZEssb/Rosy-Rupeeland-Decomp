# Audio recovery contracts

Audio behavior is recovered in four distinct layers. Actor bytecode supplies
the IDs and parameters, the recovered VM selects a sound-context facade, the
ARM9 managers apply game policy and Nitro timing, and the ARM7/Nitro driver
performs playback. An ID is meaningful only together with its SDAT domain:
SSEQ, SSAR archive/member, and STRM indices are separate namespaces.

## Evidence levels

- `match_verified`: recovered C or assembly is byte-identical to retail.
- `disassembly_verified`: the complete retail function and calling convention
  have been inspected, but readable source is not yet part of the matching ROM.
- `structural_candidate`: bytecode has the recovered operand shape followed by
  an actor-method dispatch. Actor method indices vary by class, so this alone
  does not prove which handler receives it.
- `compatibility_only`: host behavior exists to cross an unrecovered SDK or
  hardware boundary and must not be cited as evidence of game policy.

Do not select audio by listening, by file duration, or by guessing that an ID
belongs to the sound-effect namespace. Establish the bytecode operand, facade,
manager ABI, and SDAT category before changing playback.

## Static audits

The canonical stream declarations live in `include/tingle/sound_stream.h`.
`config/arm9/audio_abi_contracts.csv` records the expected argument count for
all recovered SSEQ, SSAR, and STRM facade entries plus the stream manager.
Audit the extracted ARM9 before changing a facade or host boundary:

```powershell
python tools/audit_arm_call_abi.py
```

The audit follows direct ARM `bl` calls and propagates live r0-r3 requirements
through wrappers. It deliberately treats stack-alignment pushes as preservation,
not arguments. Arguments beyond r3 remain an explicit contract because they
enter on the stack and require function-specific recovery.

List all structurally recognizable actor-script audio commands with runtime
addresses and nearest configured symbols:

```powershell
python tools/report_actor_script_audio.py
```

For STRM work, use the SDAT-validated focused report. This rejects constant IDs
that are not valid STRM entries and includes the SDAT name when present:

```powershell
python tools/report_actor_script_streams.py --stream 2
```

Selector 6 starts the selected STRM at offset zero and volume 127. Selector 7
stops the sole STRM with its operand as a 60 Hz fade duration. Selector 32 takes
stream ID, 100 ms start units, volume, fade frames, and a fade-in flag. These
contracts come from the recovered VM handlers; a reported actor dispatch stays
a structural candidate until its class method table is recovered or runtime
control flow confirms it.

## Runtime comparison

The recompilation accepts `--audio-trace PATH` and writes one flushed CSV row
for each mutating SSEQ, SSAR, STRM, or global mixer request. The shared schema
is `frame,event,type,id,member,arg0,arg1,arg2,result`. A retail debugger or
instrumented emulator capture should use the same schema at the recovered
facade/manager entry points. Compare ordered requests with:

```powershell
python tools/compare_audio_traces.py retail-audio.csv recomp-audio.csv
```

Frame origins are ignored by default while event order, domain, IDs, arguments,
and result classification remain exact. Use `--check-frame` only when both
captures begin on the same game frame. Keep request traces separate from mixed
PCM comparison: matching requests diagnoses game/decomp errors, while differing
PCM after matching requests diagnoses the native Nitro/audio boundary.

An audio fix is accepted only after the ABI audit passes, the relevant static
report identifies the source operand, a replay reaches the scene, and the
runtime request trace contains the expected ordered event without an invented
fallback or duplicate restart.
