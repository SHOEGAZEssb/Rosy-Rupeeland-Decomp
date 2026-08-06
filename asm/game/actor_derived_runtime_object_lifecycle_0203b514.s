; Matching retail form; see src/game/actor_derived_runtime_object_lifecycle.c.
.text
.extern Heap_Free
.extern data_020df510
.extern func_020055d0
.extern func_02010854
.extern func_02030f98
.extern func_0203130c
.extern func_02031488
    .global func_0203b514
    .type func_0203b514, @function
func_0203b514: ; 0x0203b514
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02030f98
    ldr r1, .L_0203b550
    add r0, r4, #0x1ec
    str r1, [r4, #0x0]
    bl func_02010854
    mvn r0, #0x0
    str r0, [r4, #0x1fc]
    str r0, [r4, #0x200]
    add r1, r4, #0x200
    mov r2, #0x0
    mov r0, r4
    strh r2, [r1, #0x4]
    ldmia sp!, {r4, pc}
.L_0203b550: .word data_020df510
    .size func_0203b514, . - func_0203b514

    .global func_0203b554
    .type func_0203b554, @function
func_0203b554: ; 0x0203b554
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02030f98
    ldr r1, .L_0203b590
    add r0, r4, #0x1ec
    str r1, [r4, #0x0]
    bl func_02010854
    mvn r0, #0x0
    str r0, [r4, #0x1fc]
    str r0, [r4, #0x200]
    add r1, r4, #0x200
    mov r2, #0x0
    mov r0, r4
    strh r2, [r1, #0x4]
    ldmia sp!, {r4, pc}
.L_0203b590: .word data_020df510
    .size func_0203b554, . - func_0203b554

    .global func_0203b594
    .type func_0203b594, @function
func_0203b594: ; 0x0203b594
    stmdb sp!, {r4, lr}
    ldr r1, .L_0203b5d0
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl func_02031488
    add r0, r4, #0x1ec
    bl func_020055d0
    mov r0, r4
    bl func_0203130c
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0203b5d0: .word data_020df510
    .size func_0203b594, . - func_0203b594

    .global func_0203b5d4
    .type func_0203b5d4, @function
func_0203b5d4: ; 0x0203b5d4
    stmdb sp!, {r4, lr}
    ldr r1, .L_0203b618
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl func_02031488
    add r0, r4, #0x1ec
    bl func_020055d0
    mov r0, r4
    bl func_0203130c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0203b618: .word data_020df510
    .size func_0203b5d4, . - func_0203b5d4

    .global func_0203b61c
    .type func_0203b61c, @function
func_0203b61c: ; 0x0203b61c
    stmdb sp!, {r4, lr}
    ldr r1, .L_0203b658
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl func_02031488
    add r0, r4, #0x1ec
    bl func_020055d0
    mov r0, r4
    bl func_0203130c
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0203b658: .word data_020df510
    .size func_0203b61c, . - func_0203b61c


