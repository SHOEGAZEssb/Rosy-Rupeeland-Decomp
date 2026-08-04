; Matching retail form; see src/game/actor_runtime_collection_lifecycle.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_0200ae4c
.extern data_020d4468
.global func_0200adf0
func_0200adf0:
    stmdb sp!, {r4, lr}
    ldr r1, L_0200ae0c
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_0200ae4c
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200ae0c: .word data_020d4468
.size func_0200adf0, . - func_0200adf0

