.text
; Matching fallback for the portable implementation in src/overlays/ov065/overlay065_recovery.c.
.extern data_020c9670
.extern data_ov065_02210c00
.extern VecFx32Object_Destroy
.extern GraphicsSpriteState_SetDepthOrderedWorldPosition
.extern VecFx32Bezier_Evaluate3D
.extern func_020593ac
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_ReplaceStateResources
.extern func_020befec
.extern gSoundContext
.extern genrand_int32

.global func_ov065_0220ff20
func_ov065_0220ff20:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x18
    mov r7, r0
    ldrsh r0, [r7, #0x8]
    mov r6, r1
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_02210198
.L_0220ff40:
    b .L_0220ff50
    b .L_02210018
    b .L_02210134
    b .L_02210198
.L_0220ff50:
    ldrsh r0, [r7, #0x4]
    ldrsh r1, [r7, #0x6]
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r2, r0
    ldr r1, [r7, #0x10]
    add r0, sp, #0x8
    bl VecFx32Bezier_Evaluate3D
    ldrsh r0, [r7, #0x4]
    ldrsh r1, [r7, #0x6]
    mov r0, r0, lsl #0xf
    bl func_020befec
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r2, r0, lsl #0x2
    ldr r1, .L_022101b0
    ldrsh r3, [r7, #0xa]
    ldrsh r1, [r1, r2]
    ldr r4, [sp, #0x14]
    mov r0, #0x8
    smlabb r1, r3, r1, r4
    str r1, [sp, #0x14]
    str r0, [sp, #0x0]
    ldr r0, [r7, #0x0]
    ldr r1, [sp, #0xc]
    ldr r2, [sp, #0x10]
    ldr r3, [sp, #0x14]
    bl GraphicsSpriteState_SetDepthOrderedWorldPosition
    ldr r2, [r7, #0x0]
    ldrsh r1, [r7, #0xc]
    ldrh r0, [r2, #0x28]
    add r0, r1, r0
    strh r0, [r2, #0x28]
    ldr r1, [r7, #0x0]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldrsh r0, [r7, #0x4]
    add r0, r0, #0x1
    strh r0, [r7, #0x4]
    ldrsh r1, [r7, #0x6]
    ldrsh r0, [r7, #0x4]
    cmp r0, r1
    strgth r1, [r7, #0x4]
    movgt r0, #0x1
    strgth r0, [r7, #0x8]
    add r0, sp, #0x8
    bl VecFx32Object_Destroy
    b .L_02210198
.L_02210018:
    ldr r0, .L_022101b4
    ldr r1, [r7, #0x0]
    ldr r0, [r0, #0x0]
    ldr r3, [r0, #0x150]
    ldr r0, [r3, #0xc]
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x0]
    ldmib r3, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
    ldr r0, [r7, #0x0]
    ldrb r4, [r0, #0x38]
    mov r1, r4
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r3, [r7, #0x0]
    mov r1, #0x2
    ldrh r2, [r3, #0x24]
    add r0, r6, #0x100
    bic r2, r2, #0x3
    strh r2, [r3, #0x24]
    strh r1, [r7, #0x8]
    ldrh r0, [r0, #0x1a]
    cmp r0, #0x0
    bne .L_02210134
    ldr r0, [r7, #0x0]
    ldrsh r0, [r0, #0x2c]
    sub r5, r0, #0x7f
    cmp r5, #0x7f
    movgt r5, #0x7f
    bgt .L_02210098
    sub r0, r1, #0x81
    cmp r5, r0
    movlt r5, r0
.L_02210098:
    str r5, [sp, #0x0]
    mov r1, #0x0
    ldr r0, .L_022101b8
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r2, #0xf
    mov r3, #0x64
    bl func_020593ac
    mov r0, #0xa
    mul r0, r4, r0
    add r4, r0, #0x30
    cmp r4, #0x7f
    movgt r4, #0x7f
    bgt .L_022100d8
    cmp r4, #0x30
    movlt r4, #0x30
.L_022100d8:
    bl genrand_int32
    str r5, [sp, #0x0]
    and r1, r0, #0x7f
    ldr r0, .L_022101b8
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    mov r1, #0x0
    mov r2, #0x1d
    bl func_020593ac
    bl genrand_int32
    str r5, [sp, #0x0]
    rsb r3, r4, #0x7f
    and r0, r0, #0x7f
    str r0, [sp, #0x4]
    ldr r0, .L_022101b8
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x21
    bl func_020593ac
    add r0, r6, #0x100
    mov r1, #0x6
    strh r1, [r0, #0x1a]
.L_02210134:
    ldr r3, [r7, #0x10]
    mov r0, #0x8
    str r0, [sp, #0x0]
    ldr r0, [r7, #0x0]
    ldr r1, [r3, #0x14]
    ldr r2, [r3, #0x18]
    ldr r3, [r3, #0x1c]
    bl GraphicsSpriteState_SetDepthOrderedWorldPosition
    ldr r2, [r7, #0x0]
    ldrsh r1, [r7, #0xc]
    ldrh r0, [r2, #0x28]
    add r0, r1, r0
    strh r0, [r2, #0x28]
    ldr r0, [r7, #0x0]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02210198
    mov r0, #0x3
    strh r0, [r7, #0x8]
    ldr r1, [r7, #0x0]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x8
    strh r0, [r1, #0x24]
.L_02210198:
    ldrsh r0, [r7, #0x8]
    cmp r0, #0x3
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_022101b0: .word data_020c9670
.L_022101b4: .word data_ov065_02210c00
.L_022101b8: .word gSoundContext
.size func_ov065_0220ff20, . - func_ov065_0220ff20
