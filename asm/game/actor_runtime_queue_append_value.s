; Matching retail form; see src/game/actor_runtime_collection_queue.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_0200b100
.global func_0200b164
func_0200b164:
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x144]
    cmp r2, #0x8
    ldmgtia sp!, {r3, pc}
    add r0, r0, #0x138
    bl func_0200b100
    ldmia sp!, {r3, pc}
.size func_0200b164, . - func_0200b164

