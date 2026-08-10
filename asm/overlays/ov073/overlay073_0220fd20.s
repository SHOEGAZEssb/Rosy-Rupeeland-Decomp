.text
; Matching fallback for the portable implementation in src/overlays/ov073/overlay073_recovery.c.
.extern data_ov073_02210bcc
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Assign
.extern func_0201e290
.extern GraphicsSpriteState_SetAnimationIndex

.global func_ov073_0220fd20
func_ov073_0220fd20:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r2
    mov r7, r1
    mov r1, r6
    mov r4, r0
    mov r5, r3
    bl func_0201e290
    ldr r2, .L_0220fdb4
    mov r1, r7
    add r0, r4, #0x2c
    str r2, [r4, #0x0]
    bl VecFx32Object_InitCopy
    ldrh r1, [sp, #0x18]
    mov r2, #0x0
    sub r0, r2, #0x1
    strh r1, [r4, #0x3c]
    strh r2, [r4, #0x3e]
    strh r2, [r4, #0x40]
    strh r0, [r4, #0x42]
    add r0, r4, #0x8
    add r1, r6, #0x10
    strh r2, [r4, #0x44]
    bl VecFx32Object_Assign
    add r0, r4, #0x18
    add r1, r6, #0x20
    bl VecFx32Object_Assign
    ldr r0, [r6, #0x30]
    mov r1, r5
    str r0, [r4, #0x28]
    ldr r2, [r4, #0x4]
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x4]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220fdb4: .word data_ov073_02210bcc
.size func_ov073_0220fd20, . - func_ov073_0220fd20
