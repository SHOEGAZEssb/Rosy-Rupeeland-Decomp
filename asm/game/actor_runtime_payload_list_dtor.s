; Matching retail form; see src/game/actor_runtime_object_lists_lifecycle.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_0200bba8
.extern data_020d44f0
.global func_0200bb88
func_0200bb88:
    stmdb sp!, {r4, lr}
    ldr r1, L_0200bba4
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_0200bba8
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200bba4: .word data_020d44f0
.size func_0200bb88, . - func_0200bb88

