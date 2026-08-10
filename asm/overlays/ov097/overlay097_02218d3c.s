.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern func_02004fe0
.extern func_02005058
.extern func_020050a4
.extern VecFx32Triple_Set
.extern VecFx32Triple_Destroy
.extern VecFx32Bezier_Evaluate3D
.extern Actor_GetCachedTerrainHeight
.extern func_020349b8
.extern ActorExtendedType2_GetDescriptorValue25
.extern func_0204cfa4
.extern func_020593dc
.extern func_02072b68
.extern func_020befec
.extern func_ov097_022177e0
.extern func_ov097_02217ac4
.extern func_ov097_02217fd8
.extern func_ov097_0221818c
.extern func_ov097_022188f8
.extern func_ov097_02218d04
.extern func_ov097_0221951c
.extern gGameWork
.extern gSoundContext

.global func_ov097_02218d3c
func_ov097_02218d3c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x78
    mov r5, r0
    add r0, r5, #0x200
    ldrsh r1, [r0, #0x98]
    cmp r1, #0x0
    ldreqsh r1, [r5, #0xda]
    cmpeq r1, #0x4
    bne .L_02218e08
    ldr r2, [r5, #0x14]
    mov r1, #0x0
    orr r2, r2, #0x40
    bic r2, r2, #0x2000000
    str r2, [r5, #0x14]
    strh r1, [r0, #0xc2]
    strh r1, [r0, #0xbe]
    add r0, r5, #0x2c8
    add r1, r5, #0x18
    bl func_020050a4
    ldr r1, [r5, #0x2c4]
    add r0, r5, #0x2d8
    add r1, r1, #0x18
    bl func_020050a4
    ldr r0, [r5, #0x2e4]
    add r0, r0, #0x10000
    str r0, [r5, #0x2e4]
    ldr r0, [r5, #0x2e0]
    add r3, r0, #0x24000
    str r3, [r5, #0x2e0]
    ldr r1, [r5, #0x2d0]
    ldr r2, [r5, #0x2cc]
    ldr r0, [r5, #0x2dc]
    sub r1, r1, r3
    sub r0, r2, r0
    bl func_0204cfa4
    mov r1, #0x6
    bl func_020befec
    mov r0, r0, asr #0xc
    add r0, r0, #0x1e
    add r2, r5, #0x200
    strh r0, [r2, #0xc0]
    ldrsh r3, [r2, #0x98]
    ldr r1, .L_022191a8
    mov r0, r5
    add r3, r3, #0x1
    strh r3, [r2, #0x98]
    mov r2, #0x0
    bl func_020349b8
    mov r0, r5
    mov r1, #0x0
    bl func_ov097_0221951c
.L_02218e08:
    mov r1, #0x0
    strb r1, [r5, #0x24c]
    ldr r3, [r5, #0x260]
    ldr r0, .L_022191ac
    mov r2, #0x1b
    and r0, r3, r0
    str r0, [r5, #0x260]
    strh r2, [r5, #0xd6]
    str r1, [r5, #0x40]
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x88
    str r1, [r5, #0x3c]
    bl func_ov097_0221818c
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x98
    bl func_ov097_0221818c
    ldrsh r0, [r5, #0xda]
    sub r0, r0, #0x4
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_0221914c
.L_02218e68:
    b .L_02218e7c
    b .L_02218fe8
    b .L_0221914c
    b .L_02219060
    b .L_0221909c
.L_02218e7c:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x38
    bl func_ov097_0221818c
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x88
    bl func_ov097_0221818c
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x98
    bl func_ov097_0221818c
    add r2, r5, #0x200
    ldrh r0, [r2, #0xbe]
    add r0, r0, #0x1
    strh r0, [r2, #0xbe]
    ldrh r1, [r2, #0xbe]
    ldrh r0, [r2, #0xc0]
    cmp r1, r0
    bhi .L_02218fb4
    add r0, sp, #0x28
    add r1, r5, #0x2d8
    add r2, r5, #0x2c8
    bl func_ov097_02218d04
    add r0, sp, #0x18
    add r1, sp, #0x28
    mov r2, #0x2000
    bl func_ov097_022188f8
    add r0, sp, #0x68
    add r2, sp, #0x18
    add r1, r5, #0x2c8
    bl func_ov097_02217ac4
    add r0, sp, #0x18
    bl func_02005058
    add r0, sp, #0x28
    bl func_02005058
    add r0, r5, #0x200
    ldrh r0, [r0, #0xc0]
    ldr r1, [r5, #0x2e4]
    add r4, sp, #0x38
    add r0, r0, r0, lsl #0x1
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    add r0, r1, r0, lsl #0xc
    str r0, [sp, #0x74]
    mov r0, r4
    bl func_02004fe0
    add r0, sp, #0x48
    bl func_02004fe0
    add r0, r4, #0x20
    bl func_02004fe0
    mov r0, r4
    add r1, r5, #0x2c8
    add r2, r5, #0x2d8
    add r3, sp, #0x68
    bl VecFx32Triple_Set
    add r0, r5, #0x200
    ldrh r2, [r0, #0xbe]
    ldrh r1, [r0, #0xc0]
    mov r0, r2, lsl #0xc
    bl func_020befec
    mov r2, r0
    add r0, sp, #0x8
    mov r1, r4
    bl VecFx32Bezier_Evaluate3D
    add r0, r5, #0x18
    add r1, sp, #0x8
    bl func_020050a4
    add r0, sp, #0x8
    bl func_02005058
    mov r0, r4
    bl VecFx32Triple_Destroy
    add r0, sp, #0x68
    bl func_02005058
    b .L_022191a0
.L_02218fb4:
    mov r1, #0x5
    mov r0, r5
    strh r1, [r5, #0xda]
    mov r1, #0x0
    strh r1, [r2, #0xbe]
    bl func_ov097_0221951c
    ldr r0, .L_022191b0
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0xc
    mov r3, #0x2
    bl func_ov097_022177e0
    b .L_022191a0
.L_02218fe8:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x38
    bl func_ov097_0221818c
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x88
    bl func_ov097_0221818c
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x98
    bl func_ov097_0221818c
    ldr r0, [r5, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_022191a0
    mov r0, #0x6
    strh r0, [r5, #0xda]
    add r0, r5, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xbe]
    ldr r0, [r5, #0x14]
    bic r0, r0, #0x40
    str r0, [r5, #0x14]
    b .L_022191a0
.L_02219060:
    ldr r1, [r5, #0x260]
    add r0, r5, #0x200
    orr r1, r1, #0x400
    orr r1, r1, #0x200000
    str r1, [r5, #0x260]
    ldrh r1, [r0, #0xbe]
    add r1, r1, #0x1
    strh r1, [r0, #0xbe]
    ldrh r1, [r0, #0xbe]
    cmp r1, #0x3c
    movhi r1, #0x6
    strhih r1, [r5, #0xda]
    movhi r1, #0x0
    strhih r1, [r0, #0xbe]
    b .L_022191a0
.L_0221909c:
    add r0, r5, #0x200
    ldrh r0, [r0, #0xbe]
    cmp r0, #0x78
    bne .L_022190e0
    ldr r0, [r5, #0x54]
    mov r1, #0x3b
    bl func_02072b68
    mov r0, #0x0
    mov r1, #0x200
    str r0, [sp, #0x0]
    ldr r0, .L_022191b4
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r5
    sub r1, r1, #0x13
    mov r2, #0xd
    bl func_020593dc
.L_022190e0:
    add r0, r5, #0x200
    ldrh r1, [r0, #0xbe]
    add r1, r1, #0x1
    strh r1, [r0, #0xbe]
    ldrh r0, [r0, #0xbe]
    cmp r0, #0xd2
    blo .L_022191a0
    mov r1, #0x1
    mov r0, r5
    strb r1, [r5, #0x2bc]
    bl ActorExtendedType2_GetDescriptorValue25
    cmp r0, #0x0
    ldr r0, .L_022191b0
    moveq r2, #0x4
    ldr r0, [r0, #0x0]
    movne r2, #0x5
    mov r1, #0x0
    mov r3, #0x1
    bl func_ov097_022177e0
    ldr r1, [r5, #0x14]
    add r0, r5, #0x200
    bic r1, r1, #0x2000000
    bic r1, r1, #0x40
    str r1, [r5, #0x14]
    mov r1, #0x0
    strh r1, [r0, #0xbe]
    b .L_022191a0
.L_0221914c:
    ldr r1, [r5, #0x260]
    mov r0, r5
    orr r1, r1, #0x20
    orr r1, r1, #0x200000
    str r1, [r5, #0x260]
    bl ActorExtendedType2_GetDescriptorValue25
    cmp r0, #0x0
    ldr r0, .L_022191b0
    moveq r2, #0x2
    ldr r0, [r0, #0x0]
    movne r2, #0x3
    mov r1, #0x0
    bl func_ov097_02217fd8
    cmp r0, #0x0
    beq .L_022191a0
    mov r0, r5
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r5, #0x24]
    cmp r1, r0
    moveq r0, #0x3000
    streq r0, [r5, #0x44]
.L_022191a0:
    add sp, sp, #0x78
    ldmia sp!, {r3, r4, r5, pc}
.L_022191a8: .word 0x4281
.L_022191ac: .word 0xfffffbf5
.L_022191b0: .word gGameWork
.L_022191b4: .word gSoundContext
.size func_ov097_02218d3c, . - func_ov097_02218d3c
