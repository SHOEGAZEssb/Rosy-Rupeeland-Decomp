; Matching retail form; see src/game/actor_runtime_object_lists_populate.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_0200bba8
.extern Heap_Free
.extern data_020d44f0
.global func_0200bedc
func_0200bedc:
    stmdb sp!, {r4, lr}
    ldr r1, L_0200bf00
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_0200bba8
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200bf00: .word data_020d44f0
.size func_0200bedc, . - func_0200bedc

