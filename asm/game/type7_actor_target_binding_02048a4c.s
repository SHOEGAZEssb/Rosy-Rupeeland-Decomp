; Matching retail form; see src/game/type7_actor_target_binding.c.
.text
.extern data_021052fc
.extern func_02007f0c
.extern Actor_DestroyAuxiliaryCollisionResource
.extern AttachmentController_SetEnabled
.extern func_02048378
.extern func_020adcac
.global func_02048a4c
.global func_02048b94
.global func_02048bcc
.type func_02048a4c, @function
.type func_02048b94, @function
.type func_02048bcc, @function

func_02048a4c: ; 0x02048a4c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    add r0, r10, #0x200
    ldrh r1, [r0, #0x56]
    cmp r1, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldrh r0, [r0, #0x5a]
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r0, [r10, #0x268]
    tst r0, #0x4
    beq .L_02048aa4
    tst r0, #0x100
    bne .L_02048a9c
    ldrsh r0, [r10, #0xd6]
    cmp r0, #0x1
    cmpne r0, #0x2
    beq .L_02048aa4
.L_02048a9c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02048aa4:
    ldr r0, [r10, #0x29c]
    ldrb r0, [r0, #0x54]
    cmp r0, #0x2
    beq .L_02048b88
    mov r5, #0x0
    mov r9, r5
    add r4, r10, #0x18
    ldr r11, .L_02048b90
    b .L_02048b50
.L_02048ac8:
    ldr r0, [r11, #0x0]
    mov r1, #0x1
    bl func_02007f0c
    ldr r8, [r0, r9, lsl #0x2]
    cmp r8, #0x0
    beq .L_02048b4c
    ldrb r0, [r8, #0x4d]
    cmp r0, #0x4
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02048b4c
    ldrh r7, [r8, #0x4e]
    cmp r7, #0x21
    cmpne r7, #0x12
    bne .L_02048b4c
    adds r1, r8, #0x18
    addne r1, r1, #0x4
    mov r0, r4
    cmp r4, #0x0
    addne r0, r4, #0x4
    bl func_020adcac
    cmp r7, #0x21
    moveq r1, #0x60000
    movne r1, #0xa0000
    cmp r0, r1
    bge .L_02048b4c
    cmp r5, #0x0
    beq .L_02048b44
    cmp r0, r6
    bge .L_02048b4c
.L_02048b44:
    mov r5, r8
    mov r6, r0
.L_02048b4c:
    add r9, r9, #0x1
.L_02048b50:
    ldr r0, [r11, #0x0]
    mov r1, #0x1
    bl func_02007f0c
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r9, r0
    blt .L_02048ac8
    cmp r5, #0x0
    beq .L_02048b88
    mov r0, r10
    mov r1, r5
    bl func_02048378
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02048b88:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02048b90: .word data_021052fc

func_02048b94: ; 0x02048b94
    stmdb sp!, {r4, lr}
    mov r4, r0
    str r1, [r4, #0x280]
    ldr r1, [r4, #0x268]
    orr r1, r1, #0x10
    str r1, [r4, #0x268]
    ldr r1, [r4, #0x1e0]
    cmp r1, #0x0
    beq .L_02048bbc
    bl Actor_DestroyAuxiliaryCollisionResource
.L_02048bbc:
    ldr r0, [r4, #0xd0]
    bic r0, r0, #0x100
    str r0, [r4, #0xd0]
    ldmia sp!, {r4, pc}

func_02048bcc: ; 0x02048bcc
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x0
    str r1, [r4, #0x280]
    ldr r1, [r4, #0x268]
    bic r1, r1, #0x10
    str r1, [r4, #0x268]
    ldr r1, [r4, #0x1e0]
    cmp r1, #0x0
    beq .L_02048bf8
    bl Actor_DestroyAuxiliaryCollisionResource
.L_02048bf8:
    add r0, r4, #0x2a8
    mov r1, #0x0
    bl AttachmentController_SetEnabled
    mov r0, #0x0
    str r0, [r4, #0x108]
    ldmia sp!, {r4, pc}

.size func_02048a4c, func_02048b94 - func_02048a4c
.size func_02048b94, func_02048bcc - func_02048b94
.size func_02048bcc, . - func_02048bcc
