; Matching retail form; see src/game/type7_actor_target_completion.c.
.extern data_020e1d0c
.extern gHeapContext
.extern Heap_Alloc
.extern func_0201f864
.extern func_02034a60
.extern Type7Actor_SelectRandomCallback
.extern Type7Actor_SelectRandomCallbackPair01
.extern Type7Actor_DispatchCurrentCallback
.extern func_0204b7bc
.text
    .global func_02049be8
.type func_02049be8, @function
func_02049be8: ; 0x02049be8
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0xb4
    add r2, r4, #0x200
    strh r1, [r2, #0xa0]
    sub r1, r1, #0xf0
    strh r1, [r2, #0x50]
    mov r3, #0x0
    mov r1, #0x4
    strh r3, [r2, #0xa2]
    bl func_0204b7bc
    mov r0, r4
    bl Type7Actor_SelectRandomCallbackPair01
    ldmia sp!, {r4, pc}
.size func_02049be8, . - func_02049be8

    .global func_02049c20
.type func_02049c20, @function
func_02049c20: ; 0x02049c20
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    mov r4, r0
    ldr r2, [r4, #0x268]
    mov r1, #0x10
    bic r2, r2, #0x8000
    str r2, [r4, #0x268]
    ldr r2, [r4, #0xd0]
    orr r2, r2, #0x2
    str r2, [r4, #0xd0]
    strh r1, [r4, #0xd6]
    ldr r1, [r4, #0x54]
    ldrh r1, [r1, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_02049c6c
    bl Type7Actor_DispatchCurrentCallback
    b .L_02049d4c
.L_02049c6c:
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x48]
    add r1, r1, #0x1
    strh r1, [r0, #0x48]
    ldrsh r0, [r0, #0x48]
    cmp r0, #0xf
    ble .L_02049d4c
    ldr r1, [r4, #0x210]
    cmp r1, #0x0
    beq .L_02049d4c
    ldrb r0, [r1, #0x4d]
    cmp r0, #0x4
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02049d4c
    ldrh r0, [r1, #0x4e]
    cmp r0, #0x68
    bne .L_02049d4c
    mov r0, r4
    mov r1, #0x36
    mov r2, #0x0
    bl func_02034a60
    mov r0, r4
    mov r1, #0x47
    mov r2, #0x0
    bl func_02034a60
    ldr r0, [r4, #0x210]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xe8]
    blx r2
    mov r0, #0x14
    ldr r1, .L_02049d58
    mov r2, #0x4
    ldr r3, .L_02049d5c
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02049d4c
    ldr r3, .L_02049d60
    mov r1, #0x0
    str r3, [sp, #0x0]
    add r2, r3, #0x1
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r1, #0x4
    str r1, [sp, #0xc]
    mov r1, #0x2
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r4, #0x54]
    add r1, r4, #0x18
    ldr r2, [r2, #0x0]
    sub r3, r3, #0x1
    bl func_0201f864
.L_02049d4c:
    mov r0, #0x0
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
.L_02049d58: .word data_020e1d0c
.L_02049d5c: .word gHeapContext
.L_02049d60: .word 0x162c
.size func_02049c20, . - func_02049c20

    .global func_02049d64
.type func_02049d64, @function
func_02049d64: ; 0x02049d64
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    mov r4, r0
    ldr r1, [r4, #0x210]
    cmp r1, #0x0
    beq .L_02049e34
    ldrb r0, [r1, #0x4d]
    cmp r0, #0x4
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02049e34
    ldrh r0, [r1, #0x4e]
    cmp r0, #0x68
    bne .L_02049e34
    mov r0, r4
    mov r1, #0x36
    mov r2, #0x0
    bl func_02034a60
    mov r0, r4
    mov r1, #0x47
    mov r2, #0x0
    bl func_02034a60
    ldr r0, [r4, #0x210]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xe8]
    blx r2
    mov r0, #0x14
    ldr r1, .L_02049e44
    mov r2, #0x4
    ldr r3, .L_02049e48
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02049e34
    ldr r3, .L_02049e4c
    mov r1, #0x0
    str r3, [sp, #0x0]
    add r2, r3, #0x1
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r1, #0x4
    str r1, [sp, #0xc]
    mov r1, #0x2
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r4, #0x54]
    add r1, r4, #0x18
    ldr r2, [r2, #0x0]
    sub r3, r3, #0x1
    bl func_0201f864
.L_02049e34:
    mov r0, r4
    bl Type7Actor_SelectRandomCallback
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
.L_02049e44: .word data_020e1d0c
.L_02049e48: .word gHeapContext
.L_02049e4c: .word 0x162c
.size func_02049d64, . - func_02049d64

