; Matching retail form; see src/game/actor_runtime_object_lists_lifecycle.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_0200bd10
.extern func_0200bd6c
.extern func_0200bcb8
.extern func_0200bba8
.extern Heap_Free
.extern data_020d44f0
.extern data_020d4500
.global func_0200bc4c
func_0200bc4c:
    stmdb sp!, {r4, lr}
    ldr r1, L_0200bcb0
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_0200bd10
    mov r0, r4
    bl func_0200bd6c
    mov r0, r4
    bl func_0200bcb8
    ldr r1, L_0200bcb4
    add r0, r4, #0x24
    str r1, [r4, #0x24]
    bl func_0200bba8
    ldr r1, L_0200bcb4
    add r0, r4, #0x14
    str r1, [r4, #0x14]
    bl func_0200bba8
    ldr r1, L_0200bcb4
    add r0, r4, #0x4
    str r1, [r4, #0x4]
    bl func_0200bba8
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200bcb0: .word data_020d4500
L_0200bcb4: .word data_020d44f0
.size func_0200bc4c, . - func_0200bc4c

