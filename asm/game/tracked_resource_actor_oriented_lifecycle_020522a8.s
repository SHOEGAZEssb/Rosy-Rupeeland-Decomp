; Matching retail form; see src/game/tracked_resource_actor_oriented_lifecycle.c.
.extern Heap_Free
.extern data_020e295c
.extern func_0204fcb8
.extern func_0204fdc0
.text
    .global func_020522a8
func_020522a8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204fcb8
    ldr r1, .L_020522c4
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_020522c4: .word data_020e295c
    .size func_020522a8, . - func_020522a8

    .global func_020522c8
func_020522c8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204fcb8
    ldr r1, .L_020522e4
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_020522e4: .word data_020e295c
    .size func_020522c8, . - func_020522c8

    .global func_020522e8
func_020522e8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204fdc0
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_020522e8, . - func_020522e8

    .global func_020522fc
func_020522fc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204fdc0
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_020522fc, . - func_020522fc

    .global func_02052318
func_02052318:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204fdc0
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02052318, . - func_02052318
