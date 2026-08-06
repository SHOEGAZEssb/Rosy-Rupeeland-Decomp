; Matching retail form; see src/game/type7_marker_presentation.c.
.extern func_02071e60
.extern func_02071e70
.extern func_02071e80
.extern func_020337d4
.extern func_02030acc
.extern func_02073fc4
.extern func_02072b68
.extern func_0204cdcc
.extern func_02073ef8
.extern Heap_Free
.extern func_0204cf28
.extern data_020e1ed8
.extern data_020f4e18
.text
    .global func_0204cca8
func_0204cca8: ; 0x0204cca8
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, .L_0204cd68
    mov r4, r0
    str r2, [r4, #0x0]
    str r1, [r4, #0x8]
    ldr r0, .L_0204cd6c
    ldr r1, .L_0204cd70
    ldr r0, [r0, #0x0]
    bl func_02071e60
    ldr r1, .L_0204cd6c
    mov r7, r0
    ldr r0, [r1, #0x0]
    ldr r1, .L_0204cd74
    bl func_02071e70
    ldr r1, .L_0204cd6c
    mov r6, r0
    ldr r0, [r1, #0x0]
    ldr r1, .L_0204cd78
    bl func_02071e80
    mov r5, r0
    ldr r0, [r4, #0x8]
    bl func_020337d4
    bl func_02030acc
    mov ip, #0x2
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str ip, [sp, #0x0]
    bl func_02073fc4
    str r0, [r4, #0x4]
    mov r1, #0x0
    bl func_02072b68
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    strb r1, [r0, #0x3a]
    ldr r1, [r4, #0x4]
    mov r3, #0x0
    strh r3, [r1, #0x2c]
    strh r3, [r1, #0x2e]
    ldr r2, [r4, #0x4]
    mov r0, r4
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x2
    strh r1, [r2, #0x24]
    strh r3, [r4, #0xe]
    bl func_0204cdcc
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0204cd68: .word data_020e1ed8
.L_0204cd6c: .word data_020f4e18
.L_0204cd70: .word 0x138a
.L_0204cd74: .word 0x1078
.L_0204cd78: .word 0x138b
.size func_0204cca8, . - func_0204cca8

    .global func_0204cd7c
func_0204cd7c: ; 0x0204cd7c
    stmdb sp!, {r4, lr}
    ldr r1, .L_0204cd9c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x4]
    bl func_02073ef8
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0204cd9c: .word data_020e1ed8
.size func_0204cd7c, . - func_0204cd7c

    .global func_0204cda0
func_0204cda0: ; 0x0204cda0
    stmdb sp!, {r4, lr}
    ldr r1, .L_0204cdc8
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x4]
    bl func_02073ef8
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0204cdc8: .word data_020e1ed8
.size func_0204cda0, . - func_0204cda0

    .global func_0204cdcc
func_0204cdcc: ; 0x0204cdcc
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x0
    strh r1, [r4, #0xc]
    ldrsh r1, [r4, #0xe]
    cmp r1, #0x0
    beq .L_0204cdec
    bl func_0204cf28
.L_0204cdec:
    ldr r1, [r4, #0x4]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0xc
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
.size func_0204cdcc, . - func_0204cdcc

    .global func_0204ce00
func_0204ce00: ; 0x0204ce00
    bx lr
.size func_0204ce00, . - func_0204ce00

