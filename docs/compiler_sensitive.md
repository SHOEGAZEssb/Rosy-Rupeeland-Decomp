# Compiler-sensitive functions and the native port

This document is the inventory of reconstructed functions whose retail form
depends on Metrowerks code generation, ARM assembly, C++ runtime lowering, or
an expression whose ordering deserves explicit review during the native port.
It records the native behavior to preserve; it is not a requirement to imitate
the retail instruction sequence on a host compiler.

For a native build:

- do not define `MATCHING` and do not compile the ARM assembly fallbacks;
- treat the portable C branch as the starting implementation;
- preserve documented callback, ownership, integer-width, and side-effect
  ordering even when a host abstraction replaces the NitroSDK operation; and
- use the matching NDS build as the behavioral oracle, especially for rows
  marked as lifetime, callback, or hardware-ordering hazards.

Per-file options such as `-O4`, `-ipa file`, and `-lang c++` may be necessary
only to reproduce retail bytes. A function that merely changes registers or
instruction scheduling under another compiler does not need that source shape
in the native build. It belongs here when the repository has an explicit
fallback or when the compiler-dependent form exposes a porting constraint.

## Matching-only ARM implementations

Every function below has readable portable C and a matching-only ARM form,
either inline or in a separate assembly file. “Matching cause” describes why
the fallback exists; “native-port care” is the contract that survives it.

| Function | Matching cause | Native-port care |
| --- | --- | --- |
| `UpdateKeyState` | MWCC does not reproduce the retail register allocation; the matching body is in `asm/system/input_update.s`. | Use the C in `src/system/input.c`. Preserve the 0x16-byte state stride, 12 key timers, 16-bit masks, initial repeat delay, repeat interval reload, and byte-sized timer decrement. Feed it a DS-compatible active-high key mask. |
| `GameWork_Init` | One `r2`/`r12` allocation differs, and inline-assembly labels require hand-encoded backward branches. | Use the C initializer. Preserve every fixed-width clear/default, the two pointer-bank helper calls, the 32-byte initial-data copy, and the final opaque-subobject initialization order. Do not carry `DCD` branch words or ARM register assumptions into native code. |
| `SceneManager_Push` | MWCC preserves the two parameters in the opposite registers. | Preserve null/capacity rejection, invoke the previous scene's `onCovered` callback before publishing the new current scene, then store and increment the count. Callback ordering is observable. |
| `SceneTouchTask_Update` | A four-halfword history copy changes register allocation throughout the retail function. | Copy the previous touch sample before dispatch, honor the manager enable flag, and preserve pressed/released/held callback ordering. In particular, release is emitted only after a preceding pressed or held state, and held processing updates the touch regions after the scene callback. |
| `TouchPanelManager_GetPoint` | MWCC does not emit the retail three-register aggregate store. | Construct a normal host `TouchPoint` with its vtable/type identity and the manager's retained current coordinates. The aggregate store itself has no native significance. |
| `FrameTaskList_Add` | MWCC chooses a different stack frame and register lifetime. | Preserve prepend/append ordering, list links, allocation tags, and count changes. The retail path assumes allocation succeeds and can dereference a null node; the native layer should adopt one explicit out-of-memory policy rather than accidentally relying on that failure path. |
| `FrameTaskList_DestroyNode` | The matching body fixes the destructor-call register schedule. | Cache the task, unlink and free the node, then invoke the task's deleting destructor. Neither callback nor later code may access the freed node. |
| `FrameTaskList_Remove` | The unlink branches use different registers when compiled from C. | Preserve head/tail repair, node release, count decrement, and the retail zero-count cleanup. The cleanup is defensive; a consistent list should already be empty when it runs. |
| `FrameTaskList_Update` | The retail iterator reloads `node->next` after freeing `node`, whereas the portable form caches `next` first. | Use the portable, cached-next implementation. The matching post-free read is a retail lifetime artifact, not a host contract. Validate removal of the head, tail, consecutive tasks, and tasks that mutate the list from callbacks. |
| `GraphicsSystem_Init` | Typed state-block expressions and volatile register accesses lower differently. | Replace DS allocation/resource helpers and display registers with a graphics-platform interface, while preserving manager-before-engine construction, main/sub resource binding, and the point at which the subsystem becomes active. Do not expose fixed addresses in game-owned native code. |
| `GraphicsSystem_CreateEngine` | The same typed state-block expressions alter code generation. | Accept only engine 0 or 1, construct the corresponding state with `(0,0,1)` or `(1,2,3)`, and publish it in the correct slot. The retail function has no meaningful return value. |
| `PaletteBuffer_Init` | MWCC reshapes or replaces the explicit halfword-clear loop. | Install the correct base type/vtable, clear exactly 256 16-bit colors, clear the dirty flag, and keep the CPU-side palette representation independent of host pixel formats. |
| `Thread_Create` | MWCC retains the aligned size in a different register set. | The allocation and stack-top calculation use `stackSize & ~7`, but the SDK receives the original size. Known callers are aligned; a native wrapper should validate or normalize this contract explicitly, create the thread suspended, and prevent stack release while it is running. |
| `GraphicsDisplay_SetupSubBg0` | MWCC reorders equivalent volatile accesses. | Replace the register sequence with one ordered renderer transaction: blank/disable planes, reset relevant state, establish resource ownership, configure the target screen, then apply the selected resource set. The exact register order is NDS-only, but the visible transition must not expose a partially configured frame. |
| `ErrorDisplay_ShowDefaultAndHalt` | The fallback forces the original direct local-call relocation. | Relocation shape is irrelevant natively. Preserve selection of resource set zero and entry into the platform's terminal error path; define explicitly whether the host shows an error loop, exits, or raises a fatal application event. |
| `CheckedFS_ReadFile` | MWCC folds the two base-relative file-offset calculations. | Preserve the signed byte-count result and short-read rule: a short transfer is accepted only when the current cursor has reached the file end. Host streams must provide equivalent start/current/end positions before replacing the fail-stop policy. |
| `GameString_Append` | MWCC commutes the two length operands. | Copy the old buffer before clearing it, then allocate and populate the combined buffer and release the temporary. Audit null/allocation failure and suffix-aliasing behavior when replacing the game allocator with a host string type; do not silently change ownership order. |
| `GameFile_Destroy` | The retail body explicitly normalizes the SDK open-status bit to Boolean. | Restore the class identity, close only an open handle, and perform the close before returning. The Boolean normalization is matching-only; the conditional close is the contract. |
| `GameFile_DestroyAndFree` | The same status normalization affects the deleting-destructor schedule. | Close an open handle before freeing the wrapper. The retail ABI returns the former address, which is invalid after free; native callers must not use it as a live object. |
| `TouchRegion_ContainsPoint` | The retail code eagerly normalizes four comparisons before combining them. | Preserve half-open bounds: `left <= x < right` and `top <= y < bottom`. The portable short-circuit form is appropriate while field loads remain side-effect-free. |
| `TouchRegion_Tick` | The retail body explicitly normalizes the pressed state to Boolean. | Only state 1 counts down. Decrement first and call `endPress` when the signed counter becomes negative; changing the comparison to zero changes the press lifetime. |
| `TouchRegionManager_Clear` | A virtual C++ delete expression emitted a redundant null guard. | Iterate over capacity rather than active count, invoke each non-null region's deleting destructor, null every destroyed slot, and clear count. Preserve ownership even if the host container representation changes. |
| `TouchRegionManager_BeginPressAt` | The retail body reloads the region array around the virtual callback. | Select the first enabled containing region, invoke `beginPress`, and return its value. The callback could theoretically mutate the manager; current portable C assumes the selected region remains alive, so validate this assumption before replacing the array with a mutation-tolerant host container. |
| `TouchRegionManager_EndPressOutside` | The retail body explicitly normalizes the pressed state. | For each pressed region outside the point, invoke `endPress`, and always return `-1`. Review iterator invalidation if an `endPress` implementation can remove regions. |
| `func_02072000` | MWCC assigns the temporary first-handle pointer to `r0` instead of retail `r1`. | Treat a null `resource0` as an empty set; otherwise release the offset-0x04 allocation of all three handles through their distinct resource-family destructors, then null all handles. Keep the address-derived name and numbered resource types until their formats are confirmed. |
| `func_02072140` | MWCC assigns the handle-load temporaries to `r0` instead of retail `r1`. | Apply the same empty-set and teardown contract as `func_02072000`, but preserve this variant's distinct third-resource destructor, `func_02071da8`, before clearing all three handles. |
| `func_02072234` | MWCC changes the allocator search registers and adds an extra return move when compiling the portable control flow. A hand-encoded backward `bne` avoids an extra inline-assembly fallthrough branch. | Preserve best-fit selection over free ranges, 16-bit block offsets/counts, one initial reference, and the owner/type fields. Split only when a spare descriptor exists; descriptor exhaustion deliberately grants the entire selected range. Callers treat each block as 128 bytes. |
| `func_0207230c` | Equivalent C changes scratch registers, combines adjacent pointer stores, and re-tests the decremented halfword. | Decrement the 16-bit reference count and free only when it reaches zero. Coalesce the successor before the predecessor, return removed nodes to the descriptor pool, and keep `rangeCount` synchronized. A release at zero underflows in retail code and is outside the valid caller contract. |

## C++ runtime and lifetime forms

These functions do not select a separate `MATCHING` body, but their recovered
source intentionally uses Metrowerks-style C++ lifetime machinery or an ABI
annotation. A native implementation should express the same ownership directly
instead of importing the Metrowerks runtime.

| Function | Compiler-sensitive form | Native-port care |
| --- | --- | --- |
| `DebugMenu_Update` | A C++ `delete` expression is required for the retail virtual deleting-destructor schedule. | Save `selection` before deletion, destroy the menu exactly once, and never read it afterward. Scene creation and the confirmation sound occur only after the menu has been destroyed. |
| `GamePhaseTransition_Update` | State 2 uses a C++ virtual `delete` expression. | Destroy the transition before calling `GamePhase_Start(0xE1, 1)`, return 1 after scheduling the replacement phase, and do not touch the transition after deletion. |
| `GraphicsResourceSets_Destroy` | `__destroy_arr` supplies the compiler runtime's array-destruction behavior. | Destroy both constructed sets in reverse order and release each set's three resources exactly once. A native container or explicit loop can replace the runtime helper. |
| `GraphicsResourceSets_Get` | `__construct_array`, a guard bit, and `__register_global_object` implement lazy global construction and exit-time destruction. | Preserve stable object identity and one-time construction. Choose and document native thread-safety and shutdown ownership explicitly; the original guard itself is not a portable synchronization primitive. |
| `ErrorDisplayContext_Get` | A compiler guard plus `__register_global_object` lazily registers a no-op destructor; the function also carries `throw()`. | A host-owned static context may replace the runtime record, but its address must remain stable and initialization must happen once. Use `noexcept` only if the replacement path truly cannot throw. |
| `GameString_Clear` | The recovered C++ signature uses the old `throw()` exception specification. | The operation frees the owned buffer and sets the pointer to null. Map the annotation to the native error model deliberately; do not let a throwing allocator/free adapter cross a `noexcept` boundary. |

## Maintenance rule

Update this document whenever reconstructed code adds any of the following:

- a `MATCHING` branch or inline `asm` function;
- a separately assembled replacement for readable C;
- a C++ delete, constructor-array, global-destructor, or exception-ABI form;
- a volatile/hardware sequence whose ordering differs between the matching and
  portable implementations; or
- a matching implementation that relies on invalidated storage, callback-time
  mutation assumptions, integer truncation, or another behavior a host compiler
  must not optimize away accidentally.

After changing a matching fallback, run its object target and `ninja rom`.
After changing native behavior, compare state transitions, callbacks, resource
ownership, and visible output against the matching NDS build rather than using
instruction identity as the validation criterion.
