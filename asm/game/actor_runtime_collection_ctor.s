; Matching retail form; see src/game/actor_runtime_collection_lifecycle.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_0201b0f4
.extern func_0200adc8
.global func_0200ad90
func_0200ad90:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x0
    add r0, r4, #0x8
    str r1, [r4, #0x0]
    bl func_0201b0f4
    add r0, r4, #0xa0
    bl func_0201b0f4
    mov r1, #0x0
    add r0, r4, #0x138
    str r1, [r4, #0x134]
    bl func_0200adc8
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_0200ad90, . - func_0200ad90

