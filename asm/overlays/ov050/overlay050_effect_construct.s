.text
; Matching fallback for the portable implementation in src/overlays/ov050/overlay050_effect_recovery.c.
.extern VecFx32Object_Init
.extern VecFx32Object_InitCopy
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_CreateState
.extern func_ov050_0220d7c4

.global func_ov050_0220d600
func_ov050_0220d600:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    mov r7, r1
    ldr r1, [sp, #0x18]
    add r0, r5, #0x8
    mov r6, r2
    mov r4, r3
    bl VecFx32Object_InitCopy
    add r0, r5, #0x18
    bl VecFx32Object_Init
    ldr r2, [sp, #0x18]
    mov r1, #0x1
    ldr r2, [r2, #0x8]
    mov r0, r7
    str r2, [r5, #0x28]
    str r1, [sp, #0x0]
    ldmia r4, {r1, r2, r3}
    bl GraphicsSpriteGroup_CreateState
    str r0, [r5, #0x0]
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [r5, #0x0]
    mov r1, #0x80
    strh r1, [r2, #0x2c]
    mov r1, #0x60
    strh r1, [r2, #0x2e]
    mov r1, #0x1
    str r1, [sp, #0x0]
    ldmia r4, {r1, r2, r3}
    mov r0, r6
    bl GraphicsSpriteGroup_CreateState
    str r0, [r5, #0x4]
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r5, #0x4]
    mov r0, #0x80
    strh r0, [r1, #0x2c]
    mov r0, #0x60
    strh r0, [r1, #0x2e]
    mov r0, r5
    mov r1, #0x1000
    bl func_ov050_0220d7c4
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_ov050_0220d600, . - func_ov050_0220d600
