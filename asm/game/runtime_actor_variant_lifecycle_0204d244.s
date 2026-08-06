; Matching retail form; see src/game/runtime_actor_variant_lifecycle.c.
.extern func_02030f98
.extern func_0203130c
.extern Heap_Free
.extern data_020e2028
.text
    .global func_0204d244
func_0204d244: ; 0x0204d244
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_02030f98
    ldr r0, .L_0204d280
    str r0, [r5, #0x0]
    ldr r1, [r4, #0x2c]
    cmp r1, #0x0
    beq .L_0204d278
    mov r0, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x74]
    blx r2
.L_0204d278:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_0204d280: .word data_020e2028
.size func_0204d244, . - func_0204d244

    .global func_0204d284
func_0204d284: ; 0x0204d284
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_02030f98
    ldr r0, .L_0204d2c0
    str r0, [r5, #0x0]
    ldr r1, [r4, #0x2c]
    cmp r1, #0x0
    beq .L_0204d2b8
    mov r0, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x74]
    blx r2
.L_0204d2b8:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_0204d2c0: .word data_020e2028
.size func_0204d284, . - func_0204d284

    .global func_0204d2c4
func_0204d2c4: ; 0x0204d2c4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203130c
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_0204d2c4, . - func_0204d2c4

    .global func_0204d2d8
func_0204d2d8: ; 0x0204d2d8
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203130c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_0204d2d8, . - func_0204d2d8

    .global func_0204d2f4
func_0204d2f4: ; 0x0204d2f4
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203130c
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_0204d2f4, . - func_0204d2f4

