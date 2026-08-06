; Matching retail form; see src/game/tracked_resource_actor_projectile_lifecycle.c.
.extern Heap_Free
.extern data_020e2f7c
.extern func_0204fcb8
.extern func_0204fdc0
.text
    .global func_0205135c
func_0205135c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204fcb8
    ldr r1, .L_02051378
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02051378: .word data_020e2f7c
    .size func_0205135c, . - func_0205135c

    .global func_0205137c
func_0205137c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204fdc0
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0205137c, . - func_0205137c

    .global func_02051390
func_02051390:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204fdc0
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02051390, . - func_02051390
