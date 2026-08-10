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
| `PackedTimerArray_Init` through `PackedTimerArray_GetGlobal` | The matching object is partially linked with `asm/system/packed_timer_array_data.s` so three externally referenced BSS labels retain their retail order. That partial link changes call-relocation associations reported by Objdiff even though the C instructions, BSS bytes, linked ARM9, and ROM are exact. | Use the contiguous `PackedTimerArray` storage in the portable C branch. Preserve 256 stable 12-byte entries; the interior labels at indices 207 and 209 are address artifacts, not separate native allocations. |
| `InitHeap`, `func_02002744`, `func_020027c8` | MWCC does not reproduce the retail register schedule for arena initialization, child-heap creation, and heap teardown. Their matching branches use inline ARM. Calls to immediately following functions are byte-exact in the linked ROM but Objdiff associates the relocations differently in the separately compiled object. `asm/system/heap_state.s` also preserves the retail adjacency of the allocation-size accumulator and root heap context. | Use the portable C branches and replace the NitroSDK arena/heap primitives behind a platform allocator boundary. Preserve 16-byte root-arena alignment, the extra `0x50` bytes reserved before a child heap is created, allocation enumeration before heap destruction, and the fact that destroying a child heap does not release its backing root allocation. |
| `func_02002930` | MWCC combines adjacent signed-bitfield copies when compiled from readable C. The matching form retains the retail field-by-field load/store sequence. | Use the portable C copy. Preserve the destination's unknown top five flag bits, copy the screen/mode/endpoints individually, and retain signed six-bit endpoint semantics rather than replacing the packed word with an unchecked raw copy. |
| `func_020053b8`, `func_020053f4`, `func_02005548` | MWCC folds the readable CNcgFile format tests into an unsigned range check and addresses the local signature arrays directly from `sp`; matching forms retain the retail comparisons and temporary base register. | Compute 32 bytes per signed width/height tile for format zero and 64 for formats one or two, retaining the retail fallback for unknown formats. Build the graphics and palette signature bytes in `NCCG` and `NCCL` order; the ARM register and stack-address choices have no native significance. |
| `func_0200572c` | Typed handle fields and the reusable masked variant make MWCC retain different registers and schedule the two manager calls differently. | Create both handles from the same resource triple and low eight bits of the variant, set flag bit 3 on each, retain selector/origin, and initialize the embedded position to zero. The register schedule is matching-only. |
| `func_020058b8` | Typed coordinate and handle fields make MWCC retain x/y and synthesize a halfword mask constant; the matching object reloads both coordinates together before its halfword stores. | Clear hidden flag bit 3 and update signed coordinates only inside `-64 < x < 320`, `-50 < y < 242`; otherwise set the hidden bit and preserve coordinates. The reload and mask form are NDS matching details. |
| `func_02002cdc` through `func_02002e5c` | `asm/system/display_controller_state.s` preserves a 12-byte global-destructor record, two independently referenced 0x14-byte screen states, and eight trailing bytes in their retail BSS order. | Native code may own the two screen states as one aggregate. Preserve main/sub selector mapping, signed packed transition modes, per-frame hardware application, and the registered object's lifetime; the interior BSS labels are matching artifacts. |
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
| `GraphicsVramAllocator_Allocate` | MWCC changes the allocator search registers and adds an extra return move when compiling the portable control flow. A hand-encoded backward `bne` avoids an extra inline-assembly fallthrough branch. | Preserve best-fit selection over free ranges, 16-bit block offsets/counts, one initial reference, and the owner/type fields. Split only when a spare descriptor exists; descriptor exhaustion deliberately grants the entire selected range. Callers treat each block as 128 bytes. |
| `GraphicsVramAllocator_Release` | Equivalent C changes scratch registers, combines adjacent pointer stores, and re-tests the decremented halfword. | Decrement the 16-bit reference count and free only when it reaches zero. Coalesce the successor before the predecessor, return removed nodes to the descriptor pool, and keep `rangeCount` synchronized. A release at zero underflows in retail code and is outside the valid caller contract. |
| `GraphicsRenderEntryPool_AllocateChain` | MWCC chooses different long-lived registers for the pool endpoints and returned root; its inline-assembly backward branch is hand encoded to avoid an inserted fallthrough branch. | Allocate a positive requested count using a do-while loop, append only the first descriptor to the active list, chain later descriptors through `chainNext`, and count every descriptor. Free-list exhaustion returns a shorter chain. Retail zero-count behavior consumes the free list and is outside the confirmed caller contract. |
| `GraphicsRenderEntryPool_AppendRoot` | Equivalent C folds the empty and non-empty append paths into conditional instructions and shortens the function. | Ignore null, append an existing entry to the active root list, clear its forward list link, and leave both the free list and `allocatedCount` unchanged. |
| `GraphicsRenderEntryPool_SortRoots` | Equivalent insertion-sort C changes register allocation and combines adjacent link stores; two backward branches are hand encoded to prevent inline-assembly fallthrough branches. | Stably sort only active root entries by ascending signed `sortKey`. Equal keys retain order, chained entries remain attached to their roots, and both head and tail must be repaired after each move. |
| `GraphicsTransferQueue_Reset` | MWCC reverses the retail initialization of the loop counter and retained queue pointer. Two backward loop branches are hand encoded to avoid inline-assembly fallthrough branches. | Clear all 128 entries before rebuilding their free-list links, reset both active endpoints and count, and leave the final descriptor's next link null as established by its clear. Reset discards pending metadata without executing transfers. |
| `GraphicsIndexedChainPool_AllocateChain` | MWCC assigns different registers to all four pool endpoints and the returned root; the matching loop uses a hand-encoded backward branch. | Require a positive requested count, append only the first descriptor as an active root, store mode only on that root, chain later descriptors through offset 0x08, and increment the allocation count for every descriptor actually obtained. |
| `GraphicsIndexedChainPool_ReleaseChain` | Equivalent C produces a smaller function by changing register lifetimes and combining the free-list loop. The matching backward branch is hand encoded. | Detach the root from the active list before recycling it and its entire chain, repair both endpoints, clear all three links on each recycled descriptor as shown, and decrement the allocation count once per descriptor. |
| `GraphicsSpriteState_Reset` | MWCC schedules the `mov 0x100` for the scale defaults one instruction later than retail when compiling the typed portable state layout. | Clear all pointers, flags, positions, and animation indices, then initialize all three signed 8.8 scale fields to `0x100` (1.0). The retail instruction placement has no native significance. |
| `func_02072b68` | Typed resource access changes retained registers and makes the portable function four bytes larger. | Lazily prepare the resource, clamp the animation index to `count - 1`, reset frame/time state, invalidate the attached allocation unless suppression bit 0 is set, then clear flags bit 0. Resource count zero is outside the retail contract. |
| `func_02072bdc` | MWCC assigns different resource and loop registers and makes the portable function eight bytes smaller; the matching duration loop uses a hand-encoded backward branch. | Clamp the frame index, sum only preceding 16-bit frame durations, convert the sum to signed 8.8 by shifting eight bits, invalidate unless suppressed, then set flags bit 0. |
| `GraphicsSpriteState_ResetFrame` | Equivalent typed C chooses a different invalidation branch shape and is four bytes larger. | Reset frame index and time before invalidating the attached allocation, honor suppression bit 0, and clear flags bit 0 without forcing resource preparation. |
| `GraphicsSpriteState_GetSequenceDuration` | Typed resource traversal changes the retail register schedule. | Lazily prepare the resource, select the current 8-byte sequence record, and return its duration halfword unchanged. |
| `GraphicsSpriteState_AdvanceAnimation` | The signed 8.8 boundary logic and variable-duration search produce a substantially different register schedule from typed C; the matching duration-loop branch is hand encoded. | Honor pause bit 1 in `field_3b` and blocking flags mask `0x35`; add signed `scaleZ`, wrap only when flags bit 1 is set, otherwise clamp and set terminal bit 0. Derive the frame by accumulating 16-bit durations and invalidate only when the frame changes. |
| `GraphicsSpriteState_GetCurrentFrameResourceField02` | Typed traversal across three resource tables changes retained registers. | Resolve current sequence plus frame index through the timing table, then use its resource index to return the final record's offset-0x02 halfword. Preserve lazy preparation before dereferencing tables. |
| `func_02073e48` | MWCC retains the first four parameters in a particular register set while loading three additional narrow arguments from the ARM stack. | Select the animation before storing the remaining configuration. Preserve 8- and 16-bit truncation, and OR the supplied flag word into existing flags rather than replacing them; animation selection may reset frame state and invalidate attached metadata. |
| `GraphicsSpriteGroup_Init` | The typed constructor changes one zero/default register assignment. | Initialize every group link, endpoint, count, and opaque field before exposure; retain the owner pointer and set offset `0x20` to one. The register choice is not portable behavior. |
| `GraphicsSpriteGroup_AppendState` | Typed doubly linked-list code combines stores and chooses different scratch registers. | Ignore null, append at the tail, repair the empty-list head, set both state links, and increment the group count exactly once. The group does not allocate or acquire the state here. |
| `GraphicsSpriteGroup_RemoveState` | Typed unlink code reloads links and emits a longer conditional-store sequence. | Ignore null, repair both neighboring links plus head/tail, and decrement count exactly once. Retail leaves the removed state's own link fields intact, so native code must not treat them as proof that it remains linked. |
| `func_020742cc` | Typed heap/list code retains the allocation and owner in different registers and emits four extra bytes. | Allocate a fixed 0x24-byte group, initialize it, append it to the owner's list, and increment the count. Retail assumes allocation success despite its conditional initializer; a native port must choose an explicit failure policy before touching the owner list. |
| `func_02074330` | The otherwise-unused membership scan needs a hand-encoded backward branch to avoid MWCC inline-assembly fallthrough code. | Null is ignored. Valid callers must pass a group owned by the supplied renderer; unlink it, release every contained sprite, free the group, and decrement the owner count. Do not preserve the inert scan as a substitute for actual native validation. |
| `GraphicsSpriteState_ReplaceResources` | Typed pointer comparisons and repeated byte/halfword flag normalization produce code eight bytes shorter than retail. | Ignore null and frozen states. On changed resources, release the precise cached allocation before clearing its pointer; reacquire offset `0x0c` only for attached states. For an unattached animation-resource change, compare the nested identities before deciding whether the cached VRAM range remains compatible. |
| `GraphicsSpriteRenderer_HideAllSprites` | Typed OAM-record iteration changes register allocation and loop shape; the matching backward branch is hand encoded. | Preserve every non-coordinate attribute bit while setting attribute-0 bits 8-9 to the hidden value, flush the full 128-entry shadow buffer before transfer, and upload to main or sub OAM according to renderer offset `0x24`. A native renderer should perform this as one ordered visibility reset. |
| `GraphicsSpriteRenderer_AcquireGraphicsVramBinding` | Signed divide-by-power-of-two lowering, the interrupt-state temporary, and transfer arguments require the retail register schedule. | Reuse a type-1 range by incrementing its 16-bit reference count. Otherwise prepare the resource, round its positive byte size up to 128-byte blocks, allocate, and queue the initial upload while preserving the interrupt state. Retail assumes allocator success. |
| `GraphicsSpriteRenderer_FindVramBinding` | Typed list traversal is four bytes larger; its matching backward branch is hand encoded. | Search the allocator's address-ordered nodes by both byte-sized type and owner identity, returning the first match or null. The allocator embeds the first traversed node at renderer offset `0x448`; do not replace this with an unrelated ownership lookup. |
| `GraphicsSpriteRenderer_ConfigureObjectDisplay` | Equivalent structured C changes branch layout, register lifetimes, and literal-pool placement around volatile `DISPCNT` accesses and four SDK calls. | Treat engine selection, object-mapping setup, the read/modify/write of main or sub `DISPCNT`, and the final object mode as one ordered hardware transaction. Invalid modes can return after an earlier stage, so a native backend should validate first if partial configuration is unsafe on its target. Preserve unrelated register bits with mask `0xffcfffef` and set `0x00200010`. |
| `GraphicsSpriteRenderer_GetObjectPaletteAddress` | Returning memory-mapped palette pointers from structured C collapses the retail engine dispatch and address construction into fewer instructions. | Require the renderer's offset-0x0c active object, use the allocation byte at offset 0x12 as a 32-byte slot, and map it onto main OBJ palette base `0x05000200` or sub OBJ palette base `0x05000600`. A native renderer must translate this address through its backend rather than dereference the NDS address directly. |
| `func_02075630` | Equivalent C has the same size but assigns the renderer, chain cursor, loop counter, constants, and resource temporaries to different registers. | Disable interrupts across the complete enqueue loop, save and restore the prior state through the shared offset-0x04 word, and queue one type-2 32-byte transfer per resource record. The resource count and indexed chain are assumed consistent; native validation must not leave interrupts disabled on failure. |
| `func_0207593c` | Typed 4-by-3 OAM traversal changes register allocation and produces a shorter loop; both matching backward branches are hand encoded. | Place twelve 64-pixel cells while preserving unrelated OAM bits. Use inclusive extended visibility bounds X=-64..256 and Y=-64..192; outside them, set attribute-0 bits 8-9 to hidden value 2, otherwise clear both bits. |
| `func_02075a04` | Typed clamping and OAM iteration shorten the retail function; the matching backward branch is hand encoded. | Clamp the stored priority to 0..3 even when no OAM block exists. When active, combine it with field_20 in the owner word and replace only attribute-2 priority bits 10-11 across all twelve cells. |
| `func_02075a88` | Typed OAM iteration is four bytes longer than retail; the matching backward branch is hand encoded. | Ignore an inactive OAM block, truncate objectMode to its low two bits, and replace only attribute-0 bits 10-11 across all twelve text cells. Do not confuse these object-mode bits with the attribute-2 priority bits updated by `func_02075a04`. |
| `func_02076004` | Structured decimal formatting changes register allocation and produces eight extra bytes; the matching backward branch is hand encoded. | Interpret the sign of placeValue as a leading-position policy, not the sign of value. A positive place value emits every position, using spaces or zeroes according to zeroPad; a negative place value omits leading cells. Preserve modulo truncation to the requested width and the UTF-16 terminator. Zero and INT_MIN place values are outside the retail division contract. |
| `func_02076148`, `func_020761f8` | Structured UTF-16 traversal changes register allocation and branch layout; the measurement routine's dense ARM jump table is retained in matching assembly. | A negative glyph advance means fixed width using its absolute value; otherwise use a positive glyph metric plus spacing and fall back to the requested advance plus spacing when the metric is zero. Measurement treats the entire `0xee00..0xefff` range as nonprinting controls. Preserve the confirmed terminating and parameter-consuming commands, and bounds-check parameter reads in a native parser if input can be untrusted. |
| `GraphicsSpriteCanvas_DrawLine`, `func_020763dc`, `GraphicsSpriteCanvas_FillRect` | The retail line routine packs its 16-bit loop count and color into `r5`, then conditionally branches-with-link into a private pixel writer that reads that retained register instead of a C argument. The optimized rectangle fill uses exact tiled pointer stepping and partial-word masks; matching bodies are retained as instruction words, so Objdiff classifies them as data even though full-ROM verification is exact. | Replace the private helper pair with an ordinary typed pixel operation. Preserve the 256-by-192 bounds, low-nibble color truncation, inclusive endpoints, per-pixel line clipping, and the NDS layout of 64-by-64 blocks containing 8-by-8 tiles. A native linear framebuffer needs an explicit layout conversion rather than the retail address arithmetic. |
| `GraphicsSpriteRegionAllocator_Allocate`, `GraphicsSpriteRegionAllocator_Release` | Typed first-fit allocation and coalescing choose different registers and branch schedules; the matching allocation scan uses a hand-encoded backward branch. | Preserve stable descriptor addresses, 16-bit type/reference fields, successor-before-predecessor coalescing, and the fixed 32-descriptor metadata limit. If a free region fits but no spare descriptor exists, retail intentionally grants the whole region rather than failing or losing the remainder. |
| `GraphicsSpriteSmallRegionAllocator_Allocate`, `GraphicsSpriteSmallRegionAllocator_Release` | This `0x4000`-unit allocator variant has the same compiler-sensitive scan and list operations as the `0x20000` variant. Its successor-coalescing path additionally clears the surviving released region's owner, while its predecessor-only path does not. | Preserve that asymmetric owner clearing until callers prove it unobservable; do not generalize the two allocators into one implementation solely from their shared layout. Descriptor exhaustion still grants the whole selected region, and the reference field remains 16-bit. |
| `GraphicsAnimationInstance_Init` | MWCC schedules the `0x1000` scale constant between independent initialization stores differently from the readable typed C. The matching fallback also hand-encodes its PC-relative load of the trailing `0x7fff` literal, which Objdiff classifies as data despite an exact ROM. | Initialize the entire 0x5c-byte instance deterministically, retain the owner, set both signed 20.12 scale fields to `0x1000`, and preserve the byte and halfword defaults. The retail store schedule and literal-pool placement have no native semantic significance. |
| `GraphicsAnimationInstance_Update` | Signed division by 256, halfword flag normalization, and typed traversal of the sequence/frame tables produce a substantially different register schedule. The matching duration-loop branch is hand encoded. | Preserve signed 24.8 truncation toward zero, the blocking mask `0x15`, terminal bit 0, loop bit 1, and one-span wrapping in either direction. Retail assumes valid positive sequence metadata and does not repeatedly wrap an oversized tick; a native port should define validation without silently changing valid-input timing. |
| `GraphicsAnimationInstanceManager_Init`, `GraphicsAnimationInstanceManager_Append`, `GraphicsAnimationInstanceManager_Unlink` | Typed initialization and doubly linked-list operations reuse parameter and scratch registers differently and reverse two equivalent conditional stores. | Preserve the manager's 0x28-byte initialization defaults, append/unlink head and tail repair, and exact count changes. Unlink leaves the removed instance's own links intact and assumes membership; native code should not infer membership from stale links. |
| `GraphicsAnimationInstanceManager_Render` | Typed flag tests, list traversal, and volatile matrix-register accesses produce a shorter schedule. The matching loop branch and two PC-relative MMIO-address loads are hand encoded, so Objdiff reports a false negative while the full ROM is exact. | Treat matrix push, three translation writes, instance callbacks, and matrix pop as one ordered rendering transaction. Cache `next` before render/destruction callbacks, auto-destroy only when flags bits 5 and 0 are both set, and render only when bits 2 and 3 are clear. A native backend must replace the fixed geometry addresses without exposing a partially balanced matrix stack. |
| `Graphics3DResourceOwner_Init` | The retail jump-table layout and scheduling of two retained constructor arguments require a matching ARM body even though the typed switch has identical behavior. | Construct both fixed allocators before publishing configuration. Preserve the exact texture-bank mask mappings `0..6 -> 1,2,4,8,3,6,12`, expand the initial texture range to `0x40000` only for paired modes 4..6, and map the second selector `0..2 -> 0,0x20,0x40`. Invalid selectors return the initialized object after any earlier bank side effect. A native backend should validate both selectors before applying hardware changes if partial configuration is unacceptable. |
| `Graphics3DResourceOwner_CreateManager`, `Graphics3DResourceOwner_RemoveManager`, `Graphics3DResourceOwner_ClearManagers` | Typed heap/list code changes register lifetimes and removes retail's redundant post-unlink null guard. Matching creation uses hand-encoded PC-relative loads for the allocation tag and heap context; bulk teardown uses a hand-encoded backward branch. | Managers are 0x28-byte heap objects appended to an owner list. Allocation failure is not safely handled in retail. Single removal repairs both links, destroys all contained instances, frees the manager, and decrements count; bulk teardown caches `next`, frees every manager, and clears endpoints/count once. A native owner should make allocation failure explicit and preserve callback-safe traversal. |
| `Graphics3DResourceOwner_CreateAnimationInstance`, `Graphics3DResourceOwner_RebindAnimationInstance` | Instance creation needs the retail retained-register schedule and hand-encoded PC-relative allocation tag/heap loads; typed rebinding shortens the repeated load/call sequence. | Allocate and initialize before storing resources, acquire texture and palette regions through their distinct allocators, and release/reacquire only when the corresponding resource identity changes. Retail assumes heap and region acquisition success, while animation-resource replacement is a direct pointer store with no acquisition. A native port should make rollback behavior explicit if either replacement fails. |
| `Graphics3DResourceOwner_AcquireTextureRegion`, `Graphics3DResourceOwner_FindTextureRegion`, `Graphics3DResourceOwner_AcquirePaletteRegion` | Typed resource upload and descriptor traversal substantially change register allocation; both matching scans use hand-encoded backward branches. | Share existing texture/palette regions by incrementing their 16-bit references. On a miss, allocate before issuing the ordered begin/load/end NDS upload transaction. Texture lookup matches owner plus type 1; palette lookup intentionally matches owner alone. Retail assumes valid resources and successful allocation, so native upload failure needs an explicit rollback policy. |
| `Graphics3DSceneState_Init` | MWCC derives the negative boundary defaults from retained positive constants and schedules independent zero stores differently from the typed initializer. | Initialize only the documented offsets; the 0x54-byte block at 0x28..0x7b is deliberately untouched. Preserve the two `0x1000` fixed-point unit defaults, projection bounds `-0x800,0x600,0x800,-0x600`, and zero X/Y projection offsets. |
| `Graphics3DSceneState_Apply` | Projection selection combines stack-passed SDK arguments, fixed-point constant synthesis, retained offsets, and volatile geometry-register writes into a retail-specific register schedule. The matching fallback hand-encodes three PC-relative literal loads, so Objdiff reports a false negative while the full ROM is exact. | Reset the projection matrix before selecting perspective, orthographic, or frustum parameters; then build and derive the retained matrices and leave the engine in position-vector mode. A native backend must preserve the ordering while replacing fixed MMIO addresses and should define behavior for an unsupported projection selector. |
| `Graphics3DRenderObject_Draw` | The dense sequence of volatile geometry commands, repeated texture-format queries, packed fixed-point constants, and four hand-encoded PC-relative loads requires a matching ARM body. Objdiff classifies those instruction words as data despite an exact full ROM. | Treat matrix reset, polygon/texture/palette setup, the complete four-vertex submission, end command, and matrix pop as one ordered transaction. Translate the fixed NDS MMIO addresses through the native renderer, preserve the format-2 palette shift special case, and reject stale or missing bindings before issuing partial hardware state. |

## C++ runtime and lifetime forms

These functions do not select a separate `MATCHING` body, but their recovered
source intentionally uses Metrowerks-style C++ lifetime machinery or an ABI
annotation. A native implementation should express the same ownership directly
instead of importing the Metrowerks runtime.

| Function | Compiler-sensitive form | Native-port care |
| --- | --- | --- |
| `DebugMenu_Update` | A C++ `delete` expression is required for the retail virtual deleting-destructor schedule. | Save `selection` before deletion, destroy the menu exactly once, and never read it afterward. Scene creation and the confirmation sound occur only after the menu has been destroyed. |
| `GamePhaseTransition_Update` | State 2 uses a C++ virtual `delete` expression. | Destroy the transition before calling `GamePhase_Start(0xE1, 1)`, return 1 after scheduling the replacement phase, and do not touch the transition after deletion. |
| `PackedTimerArray_Init`, `PackedTimerArray_Destroy` | `__construct_array` and `__destroy_arr` traverse the fixed 256-entry packed-timer bank; each recovered element destructor is a no-op. | A native fixed array may use ordinary value initialization and needs no teardown walk. Preserve stable indices, the 12-byte persisted representation, and the full-bank copy to and from GameWork offset `0x51f0`. |
| `func_020022dc` | A compiler guard plus `__register_global_object` lazily constructs the four-slot overlay manager and registers reverse-order teardown. The recovered aggregate preserves the guard/record/object layout, so Objdiff sees different interior BSS symbols while the linked ROM is exact. | Use a stable process-global manager with an explicit initialization policy. Preserve unload-on-shutdown and reverse slot order; choose deliberate synchronization if native callers may initialize it concurrently. |
| `GraphicsResourceSets_Destroy` | `__destroy_arr` supplies the compiler runtime's array-destruction behavior. | Destroy both constructed sets in reverse order and release each set's three resources exactly once. A native container or explicit loop can replace the runtime helper. |
| `GraphicsResourceSets_Get` | `__construct_array`, a guard bit, and `__register_global_object` implement lazy global construction and exit-time destruction. | Preserve stable object identity and one-time construction. Choose and document native thread-safety and shutdown ownership explicitly; the original guard itself is not a portable synchronization primitive. |
| `GraphicsVramAllocator_Init` | `__construct_array` initializes all 96 fixed VRAM-range descriptors before allocator-specific list setup. | Construct or value-initialize every descriptor before exposing the allocator, reserve descriptor zero for the initial 0x400-block free range, and link descriptors 1 through 95 as spare metadata nodes. A native container may replace the compiler helper while preserving stable node addresses. |
| `GraphicsRenderEntryPool_Init` | `__construct_array` initializes all 128 render entries before the pool reset links them into the free list. | Initialize every entry before exposing the pool and preserve stable descriptor addresses. A native fixed-capacity container may replace the runtime helper, but reset intentionally does not clear payload words after construction. |
| `GraphicsTransferQueue_Init` | `__construct_array` initializes all 128 transfer descriptors before queue reset clears them again and builds the free list. | Preserve stable descriptor addresses and the fixed-capacity, allocation-free runtime behavior. Reset drops queued metadata without performing transfers or releasing payload ownership; a native queue must make that same ownership boundary explicit. |
| `GraphicsIndexedChainPool_Init` | `__construct_array` initializes 16 fixed descriptors before assigning each a stable byte index and building the free list. | Preserve indices 0 through 15 for the lifetime of the pool and stable descriptor addresses. The constructor initializes an empty active list; allocation does not dynamically grow beyond this fixed capacity. |
| `GraphicsSpriteState_DestroyGlobalPool` | `__destroy_arr` supplies shutdown traversal for the global 384-entry, 0x3c-byte `GraphicsSpriteState` array. Every recovered element destructor is currently a no-op. | A native static pool needs stable entries and deliberate shutdown ownership, but does not need to reproduce an empty reverse-order destructor walk. Keep the count and element stride coupled to the actual state type if that destructor later gains behavior. |
| `Graphics3DResourceOwner_Destroy` | Two `__destroy_arr` calls traverse the embedded 32-entry palette and texture region arrays after owner cleanup and VRAM-bank reset. Both recovered descriptor destructors are currently no-ops. | Release live owner-managed resources and reset platform bank ownership before discarding allocator metadata. Native fixed-capacity containers need not reproduce empty destructor walks, but must preserve the palette-before-texture teardown order if either descriptor later acquires ownership behavior. |
| `func_02077a8c`, `func_02077ac4` | `__construct_array` and `__destroy_arr` provide compiler-runtime lifetime traversal for a fixed array of four 0x10-byte directional lights. The recovered element destructor is a no-op. | A native four-element value array may replace both runtime calls. Preserve deterministic zero initialization, stable light indices 0..3, and the element layout used by geometry-command submission; explicit destruction is unnecessary unless the light type later gains ownership. |
| `ErrorDisplayContext_Get` | A compiler guard plus `__register_global_object` lazily registers a no-op destructor; the function also carries `throw()`. | A host-owned static context may replace the runtime record, but its address must remain stable and initialization must happen once. Use `noexcept` only if the replacement path truly cannot throw. |
| `GameString_Clear` | The recovered C++ signature uses the old `throw()` exception specification. | The operation frees the owned buffer and sets the pointer to null. Map the annotation to the native error model deliberately; do not let a throwing allocator/free adapter cross a `noexcept` boundary. |

## Variadic ABI forms

These functions match from portable source, but their argument traversal is
expressed in terms of the 32-bit Metrowerks ARM variadic ABI and must be
replaced deliberately on another compiler.

| Function | Compiler-sensitive form | Native-port care |
| --- | --- | --- |
| `func_02075858`, `DebugText_Printf` | The source derives the first unnamed argument by rounding the address of the last named argument down to a four-byte boundary and advancing one word. This reproduces the retail register-homing and stack traversal without an available Metrowerks `stdarg.h`. | Use the host's real `va_list`/`va_start` in a native build. Preserve the active-renderer guard, mode forwarding, and formatted length passed to the glyph blitter. Retail formatting is unbounded and then writes a terminator at the returned length in a 0x104-byte buffer; replace this with bounded formatting and define truncation behavior rather than retaining the overflow hazard. |

### Sprite world-position conversion

`func_02005914`, `func_020059ac`, `func_02005a00`, `func_02005a54`,
`func_02005afc`, and `func_02005b50` retain matching inline ARM forms. Their portable equivalents
document the fixed-point origin subtraction, signed five-bit layer query,
expanded-viewport bounds, and caller-selected culling flag. A native port
should use the portable forms and replace the offset-based global view access
once that owner type is recovered; it must preserve arithmetic shifts and the
16-bit truncation of sprite fields.

### Sprite creation configuration

`func_02005bfc` and `func_02005c3c` retain matching inline ARM forms while
their portable equivalents document sprite allocation, animation selection,
and the ordering of flag set/clear masks. A native port should call the typed
sprite-group API and preserve that mask ordering; the descriptor's leading
word is deliberately skipped because only offsets 4, 8, and 0xc are confirmed
resource inputs.

### Debug sprite text

`func_02005c90`, `func_02005cc8`, `func_02005cec`, and `func_02005d0c`
retain matching inline ARM forms. The portable implementation captures entry
ownership, two-byte resource-record prefix skipping, signed half-width
rounding, and the renderer's mode/advance/spacing arguments. A native port
should replace the two offset-unknown global managers with typed interfaces
while preserving the entry selection before measurement and drawing.

### Software-canvas lifecycle

`func_02005d88`, `func_02005dac`, `func_02005dc8`, and `func_02005dcc`
retain matching inline ARM forms. Their portable counterparts establish that
the canvas only borrows its 16-bit pixel buffer: the normal destructor is a
no-op, and the deleting destructor frees only the canvas object and returns an
invalidated pointer for ABI compatibility. Native code must not use that
returned address or infer ownership of the retained buffer.

`func_02005dfc` also retains a matching inline ARM form because equivalent
portable fixed-point DDA source receives different register allocation. The
portable routine is authoritative for behavior: choose the larger absolute
axis delta, divide 20.12 deltas by that step count, plot both endpoints, and
force color bit 15. A native implementation should define zero-length division
behavior explicitly if it cannot rely on the retail integer divider.

`func_02005eb8` uses the same arrangement: portable half-open rectangle loops
are retained alongside a matching ARM form because register assignment differs
despite identical code size. Preserve its asymmetric clipping exactly: only
negative minima and maxima at or beyond 256x192 are clamped.

`func_02005f38` likewise keeps readable four-edge composition beside its
matching ARM register/stack arrangement. Preserve edge order and repeated
corner writes if pixel writes later gain blending or other side effects.

`func_02005fec` uses a separately assembled matching form alongside the readable
8x8 glyph blitter in `software_canvas_glyph.c`; CodeWarrior inserts extra
fallthrough branches around the two natural loop labels in inline assembly.
Its row pitch is the literal 256 pixels rather than the canvas stride, glyph
nibbles are consumed least-significant first, palette index zero is transparent,
and the shared cursor is not clipped before address formation.

`func_02006078` also uses a separately assembled matching form beside its
portable variadic C implementation. CodeWarrior changes the cursor-store and
argument-list register schedule even when the generated size is identical;
preserve the retail 256-byte halt threshold and signed-byte glyph lookup.

The `game_string_list` unit has portable C for the recovered ownership and
linking behavior, plus a separately assembled retail form. The compiler moves
the virtual-function and next-node loads in `func_02006164`; preserve the
virtual hook, explicit `GameString_Destroy`, and node free sequence.

The fixed-point Bézier evaluators use a separately assembled matching form
alongside `vec_fx32_bezier.c`. Equivalent C has identical sizes but allocates
the initial inverse-parameter products to different registers. Keep each 20.12
product's `+0x800` rounding independent rather than combining terms first.

The large game-phase runtime constructor/configurator has a documented portable
C implementation and a separately assembled matching form. The optimizer
collapses duplicated configuration-mode branches and several hardware bit-test
sequences; retain the volatile display-register writes and the retail call order.

The adjacent runtime helpers also use a matching assembly form because the
compiler hoists the field-loader table arguments ahead of the store at offset
0x30b4. The portable C preserves the observable store-before-configuration order.

The game-phase runtime deleting destructor has a readable portable wrapper
around the non-deleting destructor and heap release, while the matching retail
form duplicates the complete teardown before freeing the 0x3100-byte object.
Preserve the full teardown-before-free ordering if either implementation changes.

The short game-phase runtime virtual methods are portable C. The delinked target
object retains a pre-encoded forward branch from `func_02007328` to its copy
helper in addition to the branch relocation; a freshly compiled object leaves
that relocation field clear, but the linker produces the same final ARM branch.

The same delinker artifact occurs on the forward call from `func_020086f8` to
the immediately following `func_02008740`; their linked ARM code is identical.

The large per-frame game-phase controller has documented portable C and a
separately assembled matching form. Preserve its early-return order, request-bit
clears, virtual calls, and allocation-before-construction failure behavior.

The directional area-change routine also keeps a matching assembly form beside
portable C. It mixes compiler-runtime fixed/float conversions with offset-based
actor transfers; preserve direction-specific sign handling and cleanup order.

The actor synchronization routine has portable C and matching assembly because
its seven overlapping stack temporaries are laid out according to the original
C++ value-object lifetimes. Preserve each explicit temporary destructor call.

The secondary-transform builder likewise uses matching assembly for five
mode-dependent stack value objects. Invalid placement modes intentionally call
`OS_Halt`; do not replace those paths with a silent default.

The placement-mode switch has four mutually exclusive stack vector lifetimes
and therefore retains a matching assembly form beside its portable C. Its
invalid-mode halt and optional post-switch synchronization are intentional.

The auxiliary-object replacement routine uses matching assembly to retain the
VBlank disable/enable bracket and sub-display register schedule around overlay
replacement. All allocation and attachment work must stay inside that bracket.

The scene-object replacement routine uses matching assembly because the retail
C++ destruction idiom retains two consecutive null branches before clearing
offset 0x30e8. Portable C expresses the same destroy-before-create behavior.

The screen-mode switch uses matching assembly beside portable C because the
compiler reschedules the volatile sub BG palette clear around the GameWork
pointer load. Preserve the retail hardware-write and flag-update order.

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
