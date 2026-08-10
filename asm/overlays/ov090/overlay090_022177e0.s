.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.
.extern GXx_SetMasterBrightness_
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern data_021052fc
.extern data_ov090_0221cb10
.extern func_02004fe0
.extern GamePhaseRuntime_GetActorCollection
.extern func_0204d520
.extern gGameWork

.global func_ov090_022177e0
func_ov090_022177e0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    bl func_0204d520
    ldr r0, .L_02217a20
    mov r2, #0x0
    str r0, [r10, #0x0]
    strb r2, [r10, #0x1ec]
    strb r2, [r10, #0x1ed]
    strb r2, [r10, #0x1ee]
    strb r2, [r10, #0x1ef]
    add r0, r10, #0x100
    strh r2, [r0, #0xf0]
    mov r1, #0xd2
    strh r1, [r0, #0xf2]
    str r2, [r10, #0x200]
    str r2, [r10, #0x204]
    add r0, r10, #0x20c
    str r2, [r10, #0x208]
    bl func_02004fe0
    mov r2, #0x0
    str r2, [r10, #0x21c]
    add r0, r10, #0x200
    mov r1, #0x7d0
    strh r1, [r0, #0x20]
    strb r2, [r10, #0x222]
    add r0, r10, #0x224
    strb r2, [r10, #0x223]
    bl func_02004fe0
    mov r8, #0x0
    mov r6, #0x1
    add r0, r10, #0x200
    strh r8, [r0, #0x34]
    mov r1, #0x12c
    strh r1, [r0, #0x36]
    mov r1, #0x7d0
    strh r1, [r0, #0x38]
    strh r1, [r0, #0x3a]
    str r8, [r10, #0x23c]
    str r8, [r10, #0x240]
    mov r1, #0x7f
    strh r1, [r0, #0x44]
    strb r8, [r10, #0x246]
    mov r9, r8
    strb r8, [r10, #0x247]
    mov r5, r8
    mov r11, r6
    mov r7, r6
    ldr r4, .L_02217a24
    b .L_0221791c
.L_022178a4:
    ldr r0, [r4, #0x0]
    mov r1, r7
    bl GamePhaseRuntime_GetActorCollection
    ldr r0, [r0, r9, lsl #0x2]
    cmp r0, #0x0
    beq .L_02217918
    ldrb r1, [r0, #0x4d]
    cmp r1, #0x2
    moveq r1, r6
    movne r1, r5
    cmp r1, #0x0
    beq .L_02217918
    add r1, r0, #0x200
    ldrsb r1, [r1, #0x7e]
    cmp r1, #0x12
    moveq r1, r11
    movne r1, #0x0
    cmp r1, #0x0
    beq .L_02217918
    add r1, r0, #0x200
    ldrsb r1, [r1, #0xe4]
    mov r1, r1, lsl #0x1c
    movs r1, r1, asr #0x1c
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    addne r1, r10, r8, lsl #0x2
    strne r0, [r1, #0x1f4]
    addne r8, r8, #0x1
.L_02217918:
    add r9, r9, #0x1
.L_0221791c:
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r9, r0
    cmplt r8, #0x3
    blt .L_022178a4
    ldr r1, .L_02217a24
    ldr r0, [r1, #0x0]
    add r0, r0, #0x2000
    ldr r4, [r0, #0xea4]
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x40000
    str r0, [r4, #0xd0]
    ldr r0, [r1, #0x0]
    add r0, r0, #0x2000
    ldr r1, [r0, #0xea8]
    cmp r1, #0x0
    ldrne r0, [r1, #0xd0]
    orrne r0, r0, #0x40000
    strne r0, [r1, #0xd0]
    ldr r1, [r4, #0x230]
    mov r0, r4
    bic r1, r1, #0x4
    str r1, [r4, #0x230]
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
    ldr r1, [r4, #0x230]
    ldr r0, .L_02217a28
    orr r1, r1, #0x20
    str r1, [r4, #0x230]
    ldr r0, [r0, #0x0]
    ldr r1, .L_02217a2c
    bl GameWork_SetFlag
    ldr r0, .L_02217a28
    mov r1, #0x3ec
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r3, #0x0
.L_022179c4:
    add r2, r10, r3, lsl #0x2
    ldr r0, [r2, #0x1f4]
    add r3, r3, #0x1
    add r0, r0, #0x200
    ldrh r1, [r0, #0xf2]
    cmp r3, #0x3
    bic r1, r1, #0x2
    strh r1, [r0, #0xf2]
    ldr r0, [r2, #0x1f4]
    str r10, [r0, #0x2f8]
    blt .L_022179c4
    ldr r0, .L_02217a28
    ldr r1, .L_02217a30
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, .L_02217a34
    mov r1, #0x10
    bl GXx_SetMasterBrightness_
    ldr r0, .L_02217a38
    mov r1, #0x10
    bl GXx_SetMasterBrightness_
    mov r0, r10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02217a20: .word data_ov090_0221cb10
.L_02217a24: .word data_021052fc
.L_02217a28: .word gGameWork
.L_02217a2c: .word 0x403
.L_02217a30: .word 0x386
.L_02217a34: .word 0x400006c
.L_02217a38: .word 0x400106c
.size func_ov090_022177e0, . - func_ov090_022177e0
