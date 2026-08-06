; Matching retail form; see src/game/tracked_resource_actor_variant_lifecycle.c.
.extern Heap_Free
.extern data_020e313c
.extern func_0204fcb8
.extern func_0204fdc0
.extern func_02051314
.text
    .global func_02050e74
func_02050e74:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204fcb8
    ldr r1, .L_02050e90
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02050e90: .word data_020e313c
    .size func_02050e74, . - func_02050e74

    .global func_02050e94
func_02050e94:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02050eb8
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_02051314
    mov r0, r4
    bl func_0204fdc0
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02050eb8: .word data_020e313c
    .size func_02050e94, . - func_02050e94

    .global func_02050ebc
func_02050ebc:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02050ee8
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_02051314
    mov r0, r4
    bl func_0204fdc0
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02050ee8: .word data_020e313c
    .size func_02050ebc, . - func_02050ebc
