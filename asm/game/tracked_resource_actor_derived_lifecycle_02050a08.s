; Matching retail form; see src/game/tracked_resource_actor_derived_lifecycle.c.
.extern Heap_Free
.extern data_020e2a3c
.extern func_0204fcb8
.extern func_0204fdc0
.text
    .global func_02050a08
func_02050a08:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204fcb8
    ldr r1, .L_02050a24
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02050a24: .word data_020e2a3c
    .size func_02050a08, . - func_02050a08

    .global func_02050a28
func_02050a28:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204fcb8
    ldr r1, .L_02050a44
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02050a44: .word data_020e2a3c
    .size func_02050a28, . - func_02050a28

    .global func_02050a48
func_02050a48:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204fdc0
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02050a48, . - func_02050a48

    .global func_02050a5c
func_02050a5c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204fdc0
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02050a5c, . - func_02050a5c

    .global func_02050a78
func_02050a78:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204fdc0
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02050a78, . - func_02050a78
