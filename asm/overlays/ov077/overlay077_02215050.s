.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern data_021052fc
.extern data_ov077_02216fc8
.extern VecFx32Object_Assign
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern Actor_PlayHorizontalSpatialSound
.extern Graphics3dPresentation_CreatePreset14To19SpriteEffectWithHorizontalVelocityAt
.extern func_ov077_02213768
.extern func_ov090_0221c3dc

.global func_ov077_02215050
func_ov077_02215050:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r1, #0x11
    strh r1, [r5, #0xd6]
    add r1, r5, #0x200
    ldrh r2, [r1, #0xf2]
    mov r3, r2, lsl #0x1f
    movs r3, r3, lsr #0x1f
    bne .L_022150c4
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x13
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x58]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x13
    strneh r0, [r1, #0x24]
    ldr r0, [r5, #0x298]
    mov r1, #0x0
    bl func_ov090_0221c3dc
    ldr r0, [r5, #0x2c4]
    mov r1, #0x10
    bl func_ov077_02213768
    ldr r1, [r5, #0x14]
    mov r0, #0x0
    orr r1, r1, #0x10000000
    str r1, [r5, #0x14]
    ldmia sp!, {r3, r4, r5, pc}
.L_022150c4:
    bic r2, r2, #0x1
    strh r2, [r1, #0xf2]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r1, [r5, #0x29c]
    add r0, r5, #0x18
    add r1, r1, #0x18
    bl VecFx32Object_Assign
    mov r2, #0x0
    strh r2, [r5, #0xda]
    mov r1, #0x13
    ldr r0, .L_022151b4
    strh r1, [r5, #0xd6]
    ldr r3, [r0, #0x78]
    ldr r1, [r0, #0x7c]
    mov r0, r5
    str r3, [r5, #0x218]
    str r1, [r5, #0x21c]
    mov r1, #0xa100
    bl Actor_PlayHorizontalSpatialSound
    ldr r0, [r5, #0x14]
    bic r0, r0, #0x10000000
    str r0, [r5, #0x14]
    ldrh r0, [r5, #0x4e]
    cmp r0, #0x81
    moveq r4, #0x2
    beq .L_02215140
    cmp r0, #0x82
    moveq r4, #0x1
    movne r4, #0x0
.L_02215140:
    ldr r0, .L_022151b8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r1, #0x3
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x24]
    ldr r2, [r5, #0x1c]
    ldr ip, [r5, #0x20]
    mov r3, r1, asr #0xc
    mov r1, r4
    mov r2, r2, asr #0xc
    rsb r3, r3, ip, asr #0xc
    mov r4, r0
    bl Graphics3dPresentation_CreatePreset14To19SpriteEffectWithHorizontalVelocityAt
    mov r0, #0x5
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x24]
    ldr r2, [r5, #0x1c]
    ldr r3, [r5, #0x20]
    mov r1, r0, asr #0xc
    mov r0, r4
    mov r2, r2, asr #0xc
    rsb r3, r1, r3, asr #0xc
    mov r1, #0x2
    bl Graphics3dPresentation_CreatePreset14To19SpriteEffectWithHorizontalVelocityAt
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_022151b4: .word data_ov077_02216fc8
.L_022151b8: .word data_021052fc
.size func_ov077_02215050, . - func_ov077_02215050
